package com.da.activiti.jouranal;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.activiti.engine.IdentityService;
import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.da.activiti.document.DocumentController;
import com.da.activiti.document.DocumentService;
import com.da.activiti.model.JournalDetail;
import com.da.activiti.model.Response;
import com.da.activiti.model.UserForm;
import com.da.activiti.model.document.Document;
import com.da.activiti.model.task.HistoricTask;
import com.da.activiti.task.LocalTaskService;
import com.da.activiti.user.UserService;

@Controller
@RequestMapping
public class JouranalController  extends DocumentController {
    private static final Logger LOG = LoggerFactory.getLogger(JouranalController.class);

    @Autowired
    UserService userService;
    @Autowired
    IdentityService identityService;
    @Autowired protected LocalTaskService localTaskSrvc;
    
    @Autowired
    DocumentService documentService ;
    
    @Autowired protected LocalTaskService taskService;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

   @RequestMapping(value = "/document/jouranalRegistration.htm", method = RequestMethod.GET)
    public String genrateJouranal(ModelMap model, HttpServletRequest request) {
        LOG.debug("jouranalRegistration");
        List<UserForm> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "/document/jouranalRegistration";
    }

    @RequestMapping(value = "/document/saveJournal", method = RequestMethod.POST)
    public @ResponseBody ResponseEntity<Response> post(@ModelAttribute JournalDetail journalDetail, BindingResult result,
    		@RequestParam(required = false, value = "isSubmit") boolean isSubmitfinal,@RequestParam("evidanceFileLocation") MultipartFile file, RedirectAttributes redirectAttributes) {
    	
    	
    	String journalId = documentService.createDocument(journalDetail);
    	journalDetail.setId(journalId);
    	journalDetail.setEvidanceFileLocation(uploadFile(file, "JournalEvidance_"+journalId));
    	documentService.updateDocumentLocation(journalDetail);
		String msg = "Journal id : "+ journalId +" -- Journal Created Successfully ";
		redirectAttributes.addFlashAttribute("msg",msg);
		checkSubmit(isSubmitfinal, journalId,  redirectAttributes, journalDetail.getDocType());
		Response<String> res = new Response<String>(true, (String)redirectAttributes.getFlashAttributes().get("msg"));
		res.setData(journalId);
		return new ResponseEntity<Response>(res, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/document/getApproverList.htm", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Response> getApproverList(@RequestParam int amount) {
		List<UserForm> userFormList = userService.getUserByAmountToApprove(amount);
		Response<List<UserForm>> res = new Response<List<UserForm>>(true, "User list Populated");
		res.setData(userFormList);
		return new ResponseEntity<Response>(res, HttpStatus.OK);

	}
    
    private void checkSubmit(boolean isSubmit, String docId, RedirectAttributes redirAttr,String docType) {
        if (isSubmit) {
            LOG.debug("Submitting to dynamic workflow docId {}", docId);
            this.documentService.submitToWorkflow(docType,docId);
        }
        if (isSubmit) {
            redirAttr.addFlashAttribute("msg", "Your Journal has been submitted to the workflow.</br>" +
                    "You will receive alerts as it processed.");
        } else {
            redirAttr.addFlashAttribute("msg", "Your invoice has been Saved");
        }
    }
    
  

    @RequestMapping(value = "/document/journal/view.htm", method = RequestMethod.GET)
    public String view(ModelMap model,
                       @RequestParam(value = "id", required = true) String id){
        LOG.debug("viewing doc {} ", id);
        Assert.hasText(id);
        Document doc = documentService.getDocument(id);
        model.addAttribute("document", doc);
        List<HistoricTask> hts = this.localTaskSrvc.getTaskHistory(id);
        model.addAttribute("historicTasks", hts);
        if (doc.isEditable(doc.getAuthor(), currentUserName())) {
            return "document/journal/edit";
        }
        model.addAttribute("msg", "The Journal cannot be edited in its current state.");
        return "document/journal/view";
    }


    @RequestMapping(value = "/document/journal/{id}", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute JournalDetail journalDetail,
                         BindingResult result,
                         @RequestParam(required = false, value = "isSubmit") boolean isSubmit,
                         final RedirectAttributes redirectAttributes) {
        LOG.debug("updating invoice: {}", journalDetail);

        if (!journalDetail.isEditable(journalDetail.getAuthor(), currentUserName())) {
            redirectAttributes.addFlashAttribute("msg", "This invoice cannot currently be edited by you.</p>");
            return "redirect:/journal/list.htm";
        }
        if (result.hasErrors()) {
            return "document/journal/edit";
        }

        this.documentService.updateDocument(journalDetail);
        String docId = journalDetail.getId();
        checkSubmit(isSubmit, docId, redirectAttributes,journalDetail.getDocType());
        return "redirect:/journal/list.htm";
    }
    
    private String uploadFile(MultipartFile  file,String name) {
    	if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				System.out.println("rootPath::::"+rootPath);
				File dir = new File(rootPath + File.separator + "tmpFiles" );
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				String fileLocation = dir.getAbsolutePath()
						+ File.separator + name ; 
				File serverFile = new File(fileLocation);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				LOG.info("Server File Location="
						+ serverFile.getAbsolutePath());

				return fileLocation;
			} catch (Exception e) {
				LOG.error( "You failed to upload " + name + " => " + e.getMessage());
			}
		} 
			return StringUtils.EMPTY;
	}

    

}
