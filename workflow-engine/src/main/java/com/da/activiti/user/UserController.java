package com.da.activiti.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.activiti.engine.identity.Group;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.da.activiti.model.GroupInfo;
import com.da.activiti.model.Response;
import com.da.activiti.model.UserForm;
import com.da.activiti.web.BaseController;

@Controller
public class UserController extends BaseController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Response<List<UserForm>>> getUsers(HttpServletRequest request) {
		List<UserForm> users = userService.getAllUsers();
		LOG.trace("returning json response of {} users", users.size());
		Response res = new Response(true, "users", users);
		return new ResponseEntity<Response<List<UserForm>>>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/groups", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Response<List<Group>>> getGroups(HttpServletRequest request) {
		List<Group> groups = userService.getAllAssignmentGroups();
		LOG.trace("returning json response of {} groups", groups.size());
		Response res = new Response(true, "groups", groups);
		return new ResponseEntity<Response<List<Group>>>(res, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/admin/createUser", method = RequestMethod.POST)
	public ResponseEntity<Response> createUser(ModelMap model, HttpServletRequest request,
			@Valid @ModelAttribute UserForm userForm,final RedirectAttributes redirectAttributes ,BindingResult result) {
	
	Response<String> res = null  ;
	 if (result.hasFieldErrors()) {
    	Response<List<ObjectError>> resn = new Response<List<ObjectError>>(false, "BindingError") ;
    	resn.setData(result.getAllErrors());
    	return new ResponseEntity<Response>(res, HttpStatus.OK);
    }
		userService.createUser(userForm);
		res = new Response<String>(true, userForm.getUserName() + " Created Successfully");
		res.setData(userForm.getUserName());
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/admin/editUser", method = RequestMethod.POST)
	public ResponseEntity<Response> updateUser(ModelMap model, HttpServletRequest request,
			@Valid @ModelAttribute UserForm userForm,final RedirectAttributes redirectAttributes ,BindingResult result) {
		Response<String> res = null  ;
		 if (result.hasFieldErrors()) {
	    	Response<List<ObjectError>> resn = new Response<List<ObjectError>>(false, "BindingError") ;
	    	resn.setData(result.getAllErrors());
	    	return new ResponseEntity<Response>(res, HttpStatus.OK);
	    }
			userService.updateUser(userForm);
			res = new Response<String>(true, userForm.getUserName() + " Created Successfully");
			res.setData(userForm.getUserName());
			return new ResponseEntity<Response>(res, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/admin/saveGroup", method = RequestMethod.POST)
	public ResponseEntity<Response> updateUser(ModelMap model, HttpServletRequest request,
			@Valid @ModelAttribute GroupInfo groupInfo,final RedirectAttributes redirectAttributes ,BindingResult result) {
		Response<String> res = null  ;
		 if (result.hasFieldErrors()) {
	    	Response<List<ObjectError>> resn = new Response<List<ObjectError>>(false, "BindingError") ;
	    	resn.setData(result.getAllErrors());
	    	return new ResponseEntity<Response>(res, HttpStatus.OK);
	    }
			userService.saveGroup(groupInfo.getId(), groupInfo.getType());
			res = new Response<String>(true, groupInfo.getId() + " Saved Successfully");
			res.setData(groupInfo.getId());
			return new ResponseEntity<Response>(res, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/admin/deleteGroup/{groupid}/", method = RequestMethod.POST)
	public ResponseEntity<Response> deleteGroup(@PathVariable String groupId,final RedirectAttributes redirectAttributes) {
			Response<String> res = null  ;
		userService.deleteGroup(groupId);
		res = new Response<String>(true, groupId + " Deleted Successfully");
		res.setData(groupId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/admin/deleteUser/{userId}/", method = RequestMethod.POST)
	public ResponseEntity<Response> deleteUser(@PathVariable String userId,final RedirectAttributes redirectAttributes) {
			Response<String> res = null  ;
		userService.deleteUser(userId);
		res = new Response<String>(true, userId + " Deleted Successfully");
		res.setData(userId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
	}
	

	@RequestMapping(value = "/users.htm", method = RequestMethod.GET)
	public String getDocuments(ModelMap model, HttpServletRequest request) {
		return "users";
	}

	@RequestMapping(value = "/admin/roles.htm", method = RequestMethod.GET)
	public String getRoles(ModelMap model, HttpServletRequest request) {
		return "roles/rolelist";
	}
	
	@RequestMapping(value = "/admin/users.htm", method = RequestMethod.GET)
	public String getUsers(ModelMap model, HttpServletRequest request) {
		return "users/userlist";
	}

}
