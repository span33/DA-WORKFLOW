package com.da.activiti.document;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.activiti.bpmn.model.Process;
import org.activiti.engine.identity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.da.activiti.FormBuilder.FormService;
import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.Response;
import com.da.activiti.model.UserForm;
import com.da.activiti.model.document.ProcessInfo;
import com.da.activiti.model.document.TaskInfo;
import com.da.activiti.user.UserService;
import com.da.activiti.web.BaseController;
import com.da.activiti.workflow.WFConstants;
import com.da.activiti.workflow.WorkflowBuilder;
import com.da.activiti.workflow.WorkflowService;
import com.da.util.ServiceHelper;

@Controller
@RequestMapping("/admin/process")
public class ProcessController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(ProcessController.class);

	@Autowired
	ProcessService processService;

	@Autowired
	WorkflowService workflowService;

	@Autowired
	WorkflowBuilder workflowBuilder;

	@Autowired
	UserService userService;

	@Autowired
	FormService formService;

	@RequestMapping(value = "/buildForms.htm", method = RequestMethod.GET)
	public String getDocuments(ModelMap model, HttpServletRequest request) {
		return "FormBuilder/buildform";
	}

	@RequestMapping(value = "/genrateForm", method = RequestMethod.GET)
	public String genrateFormById(ModelMap model, HttpServletRequest request, @RequestParam String userFormId,
			@RequestParam String userFormName) {
		model.addAttribute("userFormId", userFormId);
		model.addAttribute("userFormName", userFormName);
		return "FormBuilder/buildform";
	}

	@RequestMapping(value = "/jsonDataForForm", method = RequestMethod.GET)
	public ResponseEntity<Response> genrateFormData(ModelMap model, HttpServletRequest request,
			@RequestParam String userFormId) {
		List<Field> jsonData = formService.fetchFormFields(Integer.parseInt(userFormId));
		jsonData.forEach(index -> {
			if (index.getType().equalsIgnoreCase("radio")) {
				index.setType("radio-group");
			}
		});
		Response<List<Field>> res = new Response<List<Field>>(true, "Alert acknowledged");
		res.setData(jsonData);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/saveGridData", method = RequestMethod.POST)
	public ResponseEntity<Response> postGridData(@Valid @RequestBody ProcessInfo processInfo, BindingResult result,
			final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model) {
		processTaskMapping(processInfo);
		processService.editProcess(processInfo, true);
		String msg = "Process Created Successfully ";
		final Response<String> res;
		if(!ServiceHelper.validateProcessInfo(processInfo)) {
			msg = "Subprocess list is required" ;
			res = new Response<String>(false, msg);
			res.setData(msg);
			return new ResponseEntity<Response>(res, HttpStatus.OK);
			
		}
		workflowService.deleteWorkflow(processInfo.getDocType(), processInfo.getGroupId());
		Process process;
		try {
			processInfo.setProcessActName(WFConstants.createProcId(processInfo.getDocType(), processInfo.getGroupId()));
			processInfo.setId(Integer.toString(processInfo.getProcessId()));
			process = workflowBuilder.createProcess(processInfo, processInfo.getSubProcessList());
			processService.editProcess(processInfo,false);
			String.join(msg, ",", process.getName());
		} catch (Exception e) {
			LOG.error("Error occured while creating process :::"+e.getMessage(),e);
			e.printStackTrace();
			throw new BusinessException(e.getMessage());

		}
		res = new Response<String>(true, msg);
		res.setData(msg);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/editProcess", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> editProcess(@ModelAttribute ProcessInfo processInfo,
			BindingResult result, final RedirectAttributes redirectAttributes, HttpServletRequest request,
			ModelMap model) {
		processService.editProcess(processInfo,true);
		String msg = "Process id : " + processInfo.getProcessId() + " -- Process Changed Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(Integer.toString(processInfo.getProcessId()));
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/deleteProcess/{processId}/", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> deleteProcess(ModelMap model,
			@PathVariable(value = "processId") int processId) {

		processService.deleteProcess(processId);
		String msg = "Process id : " + processId + " -- Process Deleted Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(Integer.toString(processId));
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/saveProcess", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> post(@ModelAttribute ProcessInfo processInfo, BindingResult result,
			final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model) {
		String processId;
		try {
			processId = processService.createProcess(processInfo);
		} catch (BusinessException e) {
			String msg = e.getMessage();
			Response<String> res = new Response<String>(true, msg);
			res.setData(msg);
			return new ResponseEntity<Response>(res, HttpStatus.OK);
		}
		String msg = "Process id : " + processId + " -- Process Created Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(processId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/createTask", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> createTask(@ModelAttribute TaskInfo taskInfo, BindingResult result,
			final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model) {
		String taskId = processService.createTask(taskInfo);
		String msg = "Task id : " + taskId + " -- Process Created Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(taskId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/departmentList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> departmentList(ModelMap model) {
		List<Map<String, Object>> departMentList = processService.departMentList();
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(departMentList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/userListByDepartments", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> userListByDepartments(ModelMap model,
			@RequestParam String departments) {
		List<String> departMentList = userService.fetchUserByDepartments(departments);
		Response<List<String>> res = new Response<List<String>>(true, "Alert acknowledged");
		res.setData(departMentList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/approverUserList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> approverUserList(ModelMap model) {
		List<UserForm> userList = userService.getUserListByRole("Approver");
		Response<List<UserForm>> res = new Response<List<UserForm>>(true, "Alert acknowledged");
		res.setData(userList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@Override
	@ModelAttribute
	public void addModelInfo(ModelMap model, HttpServletRequest request) {
		model.addAttribute("approverUserList", userService.getUserListByRole("Approver"));
		super.addModelInfo(model, request);
		/*
		 * List<ProcessInfo> processList = processService.listAllProcesses();
		 * 
		 * ObjectMapper mapper = new ObjectMapper(); model.addAttribute("json",
		 * mapper.writeValueAsString(files));
		 * 
		 * model.addAttribute("processList", processList);
		 */
		// model.addAttribute("departMentList",
		// processService.departMentList());
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@RequestMapping(value = "/Processlist.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getPeocessList() {
		List<ProcessInfo> processList = processService.listAllProcesses();
		Response<List<ProcessInfo>> res = new Response<List<ProcessInfo>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/createProcess.htm", method = RequestMethod.GET)
	public String addDocumentForm(ModelMap model) {
		model.addAttribute("processInfo", new ProcessInfo());
		return "document/createProcessView";
	}

	@RequestMapping(value = "/DynProcesslist.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getDynProcessList() {
		List<Map<String, Object>> processList = processService.allProcesses();
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/ProcesslistByTaskMappingId.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getDynProcessList(@RequestParam int mappingId) {
		List<Map<String, Object>> processList = processService.processesListByTraskMappingId(mappingId);
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/TaskMappingList.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getTaskMapingList() {
		List<Map<String, Object>> processList = processService.processTaskMappingList();
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/SubprocessByProcessId.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getSubProcessByProcessId(@RequestParam int processId) {
		List<Map<String, Object>> processList = processService.allSubProcessesByProcessId(processId);
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/TaskListByProcessId.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getTaskByProcessId(@RequestParam int processId) {
		List<Map<String, Object>> processList = processService.taskListByProcessId(processId);
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/TaskList.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getTaskList() {
		List<Map<String, Object>> processList = processService.taskList();
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/TaskListById.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getTaskList(@RequestParam int taskId) {
		List<Map<String, Object>> processList = processService.taskListById(taskId);
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(processList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/editTask", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> editTask(@ModelAttribute TaskInfo taskInfo, BindingResult result,
			final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model) {
		processService.editTask(taskInfo);
		String msg = "Process id : " + taskInfo.getId() + " -- Task edited  Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(Integer.toString(taskInfo.getId()));
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	@RequestMapping(value = "/deleteTask/{taskId}/", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> deleteTask(ModelMap model,
			@PathVariable(value = "taskId") int taskId) {
		processService.deleteTask(taskId);
		String msg = "Process id : " + taskId + " -- Task Deleted Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(Integer.toString(taskId));
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}

	private void processTaskMapping(ProcessInfo processInfo) {

		List<ProcessInfo> subprocesslist = processService.listAllSubProcesses(processInfo.getProcessId());
		processInfo.setSubProcessList(subprocesslist);
		subprocesslist.forEach(process -> {
			List<TaskInfo> tasklist = processService.listTaskByProcessId(process.getProcessId());
			process.setTaskList(tasklist);
		});

	}
	
}
