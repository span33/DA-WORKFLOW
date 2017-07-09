package com.da.activiti.document;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.identity.Group;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.da.activiti.task.LocalTaskService;
import com.da.activiti.web.BaseController;

@Controller
@RequestMapping("/document")
public class DocumentController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(DocumentController.class);

	@Autowired
	DocumentService docService;
	@Autowired
	LocalTaskService localTaskSrvc;
	@Override
	@ModelAttribute
	public void addModelInfo(ModelMap model, HttpServletRequest request) {
		super.addModelInfo(model, request);
		List<Group> groups = userService.getAssignmentGroups(request.getRemoteUser());
		model.addAttribute("groups", groups);
	}
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	@RequestMapping(value = "/list.htm", method = RequestMethod.GET)
	public String getDocuments(ModelMap model, HttpServletRequest request) {
		model.addAttribute("documents", this.docService.getDocumentsByUser(currentUserName()));
		return "document/list";
	}
	@RequestMapping(value = "/downloadEvidance.htm", method = RequestMethod.GET)
	public void downloadPDFResource(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "fileName", required = true)  String fileName) {
		Path file = Paths.get(fileName);
		if (Files.exists(file)) {
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment; filename=Evidance_"+currentUserName()+".xls" );
			try {
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

}
