package com.da.activiti.workflow;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.identity.Group;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.da.activiti.document.ProcessService;
import com.da.activiti.model.Response;
import com.da.activiti.model.workflow.DynamicUserTask;
import com.da.activiti.model.workflow.DynamicUserTaskType;
import com.da.activiti.web.BaseController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/workflow")
public class WorkflowController extends BaseController {
    private static final Logger LOG = LoggerFactory.getLogger(WorkflowController.class);

    @Autowired protected WorkflowService workflowSrvc;
    @Autowired protected WorkflowBuilder workflowBldr;
    @Autowired
	ProcessService processService;
    protected ObjectMapper objectMapper = new ObjectMapper();


    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
    
    @RequestMapping(value = "/departmentList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> departmentList(  ModelMap model) {
		List<Map<String, Object>> departMentList = processService.departMentList();
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(departMentList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

    @Override
    @ModelAttribute
    public void addModelInfo(ModelMap model, HttpServletRequest request) {
        super.addModelInfo(model, request);
        List<Group> groups = userService.getAllAssignmentGroups();
        model.addAttribute("groups", groups);
        //model.addAttribute("defaultDocProcId", "FOO");//TODOWorkflow.PROCESS_ID_DOC_APPROVAL);
        model.addAttribute("docTypes", this.workflowSrvc.findExistingBaseDocTypes());

        List<DynamicUserTaskType> taskTypes = DynamicUserTaskType.asList();
        model.addAttribute("dynamicTaskTypes", taskTypes);
        try {
            String json = objectMapper.writeValueAsString(taskTypes);
            model.addAttribute("dynamicTaskTypesJson", json);
        } catch (JsonProcessingException ex) {
            throw new RuntimeException(ex);
        }
    }

    @RequestMapping(value = "/chosen-test.htm", method = RequestMethod.GET)
    public String chosenTest(ModelMap model) {
        return "workflow/chosen-test";
    }

    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index(ModelMap model) {
        return "workflow/index";
    }

    @RequestMapping(value = "/dynamicTasks/{docType}/{group}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<String>> userTasksByGroup(
            @RequestBody List<DynamicUserTask> dynamicUserTasks,
            @PathVariable(value = "group") String group,
            @PathVariable(value = "docType") String docType)  {
        LOG.debug("updating tasks for docType: {} and group: {} --> {}", docType, group, dynamicUserTasks.toString());
        ProcessDefinition procDefinition = this.workflowBldr.updateDynamicTasks(docType, group, dynamicUserTasks);


        //wait for the model diagram to catch up (maybe)
        Response res = new Response(true, group);
        return new ResponseEntity<Response<String>>(res, HttpStatus.OK);
    }

    @RequestMapping(value = "/dynamicTasks/{docType}/{group}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<List<DynamicUserTask>>> dynamicTasksByDocAndGroup
            (@PathVariable(value = "group") String group,
             @PathVariable(value = "docType") String docType) {

        LOG.debug("finding dynamic tasks for docType = {} and group = {}", docType, group);

        // Do we have a DocType at least?
        if (!workflowSrvc.baseDocTypeWorkflowExists(docType,group)) {
            String errMsg = String.format("There is no defined work group for docType: %s", docType);
            Response res = new Response(false, errMsg);
            return new ResponseEntity<Response<List<DynamicUserTask>>>(res, HttpStatus.OK);
        }

        //Try to find the specific DocType/Group workflow
        ProcessDefinition procDef = this.workflowSrvc.findBaseProcDef(docType,group);
        if (procDef == null) {
            //we need to build a new group workflow based on the specified docType
            procDef = this.workflowBldr.createGroupWorkflow(docType, group);
        }
        List<DynamicUserTask> tasks = this.workflowBldr.getDynamicTasks(procDef);
        LOG.debug("returning json response of {} dynamicProcDefs", tasks.size());
        Response res = new Response<List<DynamicUserTask>>(true, group, tasks);
        return new ResponseEntity<Response<List<DynamicUserTask>>>(res, HttpStatus.OK);
    }


}
