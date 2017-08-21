package com.da.activiti.code;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.da.activiti.FormBuilder.gen.models.Field;
import com.da.activiti.exception.BusinessException;
import com.da.activiti.model.CodeLookUp;
import com.da.activiti.model.Response;
import com.da.activiti.web.BaseController;

@Controller
@RequestMapping("/admin/codelookup")
public class CodeLookUpController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(CodeLookUpController.class);

	@Autowired
	CodeLookUpService codeLookUpService;

	@Override
	@ModelAttribute
	public void addModelInfo(ModelMap model, HttpServletRequest request) {
		super.addModelInfo(model, request);

	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@RequestMapping(value = "/codeList.htm", method = RequestMethod.GET)
	public String getCodeListPage(ModelMap model, HttpServletRequest request) {
		return "CodeLookUp/codelist";
	}

	@RequestMapping(value = "/dynCodelist", method = RequestMethod.GET)
	public ResponseEntity<Response> getCodeList(ModelMap model, HttpServletRequest request) {
		List<CodeLookUp> codeList = codeLookUpService.fetchCodeList();
		Response<List<CodeLookUp>> res = new Response<List<CodeLookUp>>(true, "Alert acknowledged");
		res.setData(codeList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/addCodeType", method = RequestMethod.POST)
	public ResponseEntity<Response> addCodeType(ModelMap model, HttpServletRequest request,
			@ModelAttribute CodeLookUp codeLookUp,final RedirectAttributes redirectAttributes) {
		codeLookUpService.addCodeType(codeLookUp);
		Response<String> res = new Response<String>(true, codeLookUp.getCodeType() + " Created Successfully");
		res.setData(codeLookUp.getCodeType());
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteCodeType/{codeType}", method = RequestMethod.POST)
	public ResponseEntity<Response> deleteCodeType(ModelMap model, HttpServletRequest request,
			@ModelAttribute CodeLookUp codeLookUp, @PathVariable String codeType) {
		codeLookUpService.deleteCodeType(codeLookUp.getCodeType());
		;
		Response<String> res = new Response<String>(true, codeLookUp.getCodeType() + " Deleted Successfully");
		res.setData(codeLookUp.getCodeType());
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateCodeType", method = RequestMethod.POST)
	public ResponseEntity<Response> updateCodeType(ModelMap model, HttpServletRequest request,
			@ModelAttribute CodeLookUp codeLookUp,final RedirectAttributes redirectAttributes) {
		codeLookUpService.editCodeType(codeLookUp);
		Response<String> res = new Response<String>(true, codeLookUp.getCodeType() + " Updated Successfully");
		res.setData(codeLookUp.getCodeType());
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}

}
