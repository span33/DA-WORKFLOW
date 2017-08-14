package com.da.activiti.FormBuilder;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.activiti.engine.IdentityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
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

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.FormBuilder.gen.models.FormTemplate;
import com.da.activiti.document.DocumentService;
import com.da.activiti.document.ProcessUserfomInfo;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.FormTemplateInfo;
import com.da.activiti.model.Response;
import com.da.activiti.model.document.DocState;
import com.da.activiti.model.document.Document;
import com.da.activiti.model.task.HistoricTask;
import com.da.activiti.task.LocalTaskService;
import com.da.activiti.user.UserService;
import com.da.activiti.web.BaseController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/forms")
public class FormBuilderController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(FormBuilderController.class);

	@Autowired
	FormService formService;
	@Autowired
	UserService userService;
	@Autowired
	IdentityService identityService;
	@Autowired
	protected LocalTaskService localTaskSrvc;
	@Autowired
	DocumentService documentService;
	@Autowired
	protected LocalTaskService taskService;

	@Override
	@ModelAttribute
	public void addModelInfo(ModelMap model, HttpServletRequest request) {
		super.addModelInfo(model, request);

	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@RequestMapping(value = "/dynamicFormGenrator.htm", method = RequestMethod.GET)
	public String genratetDocuments(ModelMap model, @RequestParam int userProcessFormId, @RequestParam String docType,
			HttpServletRequest request) {
		model.addAttribute("userProcessFormId", userProcessFormId);
		model.addAttribute("docType", docType);
		model.addAttribute("fields", formService.fetchFormFields(userProcessFormId));
		return "FormBuilder/index";
	}
	
	@RequestMapping(value = "/userFormList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getUserFormList(ModelMap model,
			HttpServletRequest request) {
		Response<List<Map<String, Object>>> res = new Response<List<Map<String, Object>>>(true, "Alert acknowledged");
		res.setData(formService.fetchUserFormList());
		return new ResponseEntity<Response>(res, HttpStatus.OK);
		
	}

	@RequestMapping(value = "/saveDynamicFormData.htm", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> saveDynamicFormData(ModelMap model,
			@RequestParam int userProcessFormId, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, String[]> requestMap = request.getParameterMap();
		/*String workFlowid = formService.saveWorkFlowFormData(requestMap, DocState.DRAFT, currentUserName());
		String msg = "WorkFow id : " + workFlowid + " -- WorkFlow Created Successfully ";
		redirectAttributes.addFlashAttribute("msg", msg);
		checkSubmit(request.getParameter("isSubmit"), workFlowid, redirectAttributes, request.getParameter("docType"),
				userProcessFormId);*/
		String workFlowid = formService.excute(request, redirectAttributes, userProcessFormId, currentUserName());
		Response<String> res = new Response<String>(true, (String) redirectAttributes.getFlashAttributes().get("msg"));
		res.setData(workFlowid);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	
	
	@RequestMapping(value = "/listForms.htm", method = RequestMethod.GET)
	public List<ProcessUserfomInfo> getUserFormsByUserId(ModelMap model, @RequestParam String userId,
			HttpServletRequest request) {
		return formService.userFormsByUserId(userId);

	}

	@RequestMapping(value = "/saveXmlFormMetaData", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> post(@RequestBody FormTemplate formTemplate,
			@RequestParam String processId, BindingResult result, final RedirectAttributes redirectAttributes,
			HttpServletRequest request, ModelMap model) throws BusinessException {
		FormTemplateInfo formTemplateInfo = new FormTemplateInfo();
		formTemplateInfo.setProcessId(processId);
		formTemplateInfo.setFormTemplate(formTemplate);
		formTemplateInfo.setFormTemplateStr(jaxbObjectToXML(formTemplate));
		String msg = formService.saveFormData(formTemplateInfo);
		Response<String> res = new Response<String>(true, msg);
		res.setData(processId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/saveJsonFormMetaData", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Response> postJson(@RequestBody List<Field> fields,@RequestParam String formName,
			HttpServletRequest request, ModelMap model) throws BusinessException {
		FormTemplateInfo formTemplateInfo = new FormTemplateInfo();
		formTemplateInfo.setFields(fields);
		formTemplateInfo.setCreatedBy(currentUserName());
		formTemplateInfo.setUserformName(formName);
		String formId = formService.saveFormData(formTemplateInfo);
		String msg = "Userfom id : " + formId + " -- Form Created Successfully ";
		Response<String> res = new Response<String>(true, msg);
		res.setData(formId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	private static String convertXmltoJson(String xmlString) throws JsonProcessingException, IOException {
		ObjectMapper xmlMapper = new ObjectMapper();
		JsonNode node = xmlMapper.readTree(xmlString.getBytes());
		ObjectMapper jsonMapper = new ObjectMapper();
		String json = jsonMapper.writeValueAsString(node);
		return json;
	}

	private static String jaxbObjectToXML(FormTemplate formTemplate) {
		StringWriter sw = null;
		try {
			JAXBContext context = JAXBContext.newInstance(FormTemplate.class);
			Marshaller m = context.createMarshaller();
			// for pretty-print XML in JAXB
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			sw = new StringWriter();
			m.marshal(formTemplate, sw);
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		return sw.toString();
	}

	private void checkSubmit(String isSubmit, String workFlowId, RedirectAttributes redirAttr, String docType,
			int userProcessFormId) {
		if (isSubmit.equalsIgnoreCase("on")) {
			LOG.debug("Submitting to dynamic workflow workFlowId {}", workFlowId);
			this.documentService.submitToWorkflow(docType, workFlowId, userProcessFormId);
		}
		if (isSubmit.equalsIgnoreCase("on")) {
			redirAttr.addFlashAttribute("msg", "Your Journal has been submitted to the workflow.</br>"
					+ "You will receive alerts as it processed.");
		} else {
			redirAttr.addFlashAttribute("msg", "Your invoice has been Saved");
		}
	}

	@RequestMapping(value = "/document/{docType}/view.htm", method = RequestMethod.GET)
	public String view(ModelMap model, @RequestParam(value = "id", required = true) String id,
			@PathVariable(value = "docType") String docType, @RequestParam int processUserFormId,@RequestParam String workFlowId) {
		LOG.debug("viewing doc {} processUserFormId {}", id, processUserFormId);
		Assert.hasText(id);
		Document doc = documentService.getDocument(id);
		List<HistoricTask> hts = this.localTaskSrvc.getTaskHistory(id);
		model.addAttribute("document", doc);
		model.addAttribute("historicTasks", hts);
		model.addAttribute("userProcessFormId", processUserFormId);
		model.addAttribute("docType", docType);
		model.addAttribute("fields", formService.fetchWorkFlowDataById(workFlowId, processUserFormId));
		if (doc.isEditable(doc.getAuthor(), currentUserName())) {
			return "FormBuilder/view";
		}
		model.addAttribute("msg", "The Journal cannot be edited in its current state.");
		return "FormBuilder/view";
	}

}
