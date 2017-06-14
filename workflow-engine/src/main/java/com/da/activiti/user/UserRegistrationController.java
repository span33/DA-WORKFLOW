package com.da.activiti.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.da.activiti.model.UserForm;
import com.da.activiti.task.LocalTaskService;

@Controller
@RequestMapping
public class UserRegistrationController {
    private static final Logger LOG = LoggerFactory.getLogger(UserRegistrationController.class);

    @Autowired
    UserService userService;
    @Autowired
    IdentityService identityService;
    
    @Autowired protected LocalTaskService taskService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

   @RequestMapping(value = "/userRegistration.htm", method = RequestMethod.GET)
    public String get(ModelMap model, HttpServletRequest request) {
        LOG.debug("userRegistration");
        if (request.getRemoteUser() != null) {
            return "redirect:j_spring_security_logout";
        }
        List<Group> groups = userService.getAllAssignmentGroups();
        model.addAttribute("groups", groups);
        return "userRegistration";
    }

    @RequestMapping(value = "/userRegistration", method = RequestMethod.POST)
    public String post(@Valid @ModelAttribute UserForm userForm,
                       BindingResult result,
                       final RedirectAttributes redirectAttributes,
                       HttpServletRequest request,ModelMap model) {
        LOG.debug("userRegistration: " + userForm);
        List<Group> groups = userService.getAllAssignmentGroups();
        model.addAttribute("groups", groups);
       /* if (request.getRemoteUser() != null) {
            return "redirect:j_spring_security_logout";
        }*/
        /*if (result.hasFieldErrors()) {
        	model.addAttribute("error", true);
        	model.addAttribute("errors", result.getAllErrors());
            return "userRegistration";
        }*/
        try {
        	String taskId = request.getParameter("taskId") ;
        	if(taskId!=null) {
        	boolean approved = Boolean.parseBoolean( request.getParameter("approved")) ;
        	taskService.approveOrRejectDoc(approved, request.getParameter("comment") , taskId);
        	}else {
        		userService.submitForApproval(userForm);
        	}
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", true);
            result.rejectValue("userName", null, e.getMessage());
            redirectAttributes.addFlashAttribute("errors", result.getFieldErrors());
            return "redirect:userRegistration.htm";
        }

        redirectAttributes.addFlashAttribute("msg", "A request has been made to the admin to approve your account");
        return "redirect:login.htm";
    }
    
    


}
