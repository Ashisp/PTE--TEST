package com.websystique.springmvc.controller;

import com.websystique.springmvc.model.FileBucket;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.websystique.springmvc.model.Users;
import com.websystique.springmvc.service.UsersService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Collection;
import static org.hibernate.annotations.common.util.impl.LoggerFactory.logger;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class AppController {

    //Nikesh you can write the controller class with refrence to below code
    //it gave me error with previous code so i commented out
    @Autowired
    UsersService userService;
//
//	@Autowired
//        private UserAuthenticateService userAuthenticateService;
//	@Autowired
//	UserDocumentService userDocumentService;
//	
//	@Autowired
//	MessageSource messageSource;
//
//	@Autowired
//	FileValidator fileValidator;
//	
//	@InitBinder("fileBucket")
//	protected void initBinder(WebDataBinder binder) {
//	   binder.setValidator(fileValidator);
//	
//        
//        
//        
//        }
//	
//	/**
//	 * This method will list all existing users.
//	 */

    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "userslist";
    }

//	/**
//	 * This method will provide the medium to add a new user.
//	 */
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        Users user = new Users();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }
//        
//  @RequestMapping(value = { "/categories" }, method = RequestMethod.GET)
//	public String Categories(ModelMap model) {
//		Categories sections = new Categories();
//		model.addAttribute("user", sections);
//		//model.addAttribute("edit", false);
//		return "multiplechoice";
//	}
//        
//        
//        
//        	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
//                
//                public String processCredentialModelAndView(@RequestParam("email")String username,@RequestParam("password")String password)
//                {
//                 
//                    
//String message="invalid";                    
//                  
//                if(userAuthenticateService.verifyLogin(username,password ))
//                {
//                      return "redirect:/list";
//             // message="valid";
//                }
//               return "redirect:/newUser";
//                }
//                    
//	
//		
//		//model.addAttribute("edit", false);
//
//	
//

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String saveUser(@Valid Users user, BindingResult result,
            ModelMap model) {
        System.out.println("INSIDE");
        if (result.hasErrors()) {
            return "registration";
        }

        System.out.println(user);

        /*
         * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
         * and applying it on field [sso] of Model class [User].
         * 
         * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
         * framework as well while still using internationalized messages.
         * 
         */
//		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
//			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
//		    result.addError(ssoError);
//			return "registration";
//		}
		//userService.saveUser(user);
        model.addAttribute("user", user);
        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        //return "success";
        return "registrationsuccess";
    }
//
//

    /**
     * This method will provide the medium to update an existing user.
     */
    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.GET)
    public String editUser(@PathVariable int id, ModelMap model) {
        Users user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        return "registration";
    }

//        @RequestMapping(value = { "/approve-user-{ssoId}" }, method = RequestMethod.GET)
//	public String approveUser(@PathVariable String ssoId, ModelMap model) {
//		User user = userService.findBySSO(ssoId);
//		//userService.approveUser(user);
//               model.addAttribute("approve", true);
//              //  user.setApprove(1);
//		model.addAttribute("user", user);
//                userService.approveUser(user);
//		return "redirect:/list";
//	}
//       
//            @RequestMapping(value = { "/suspend-user-{ssoId}" }, method = RequestMethod.GET)
//	public String suspendUser(@PathVariable String ssoId, ModelMap model) {
//		User user = userService.findBySSO(ssoId);
//		model.addAttribute("approve", false);
//                model.addAttribute("user", user);
//                userService.suspendUser(user);
//		return "redirect:/list";
//	}
//        
//   
//	/**
//	 * This method will be called on form submission, handling POST request for
//	 * updating user in database. It also validates the user input
//	 */
    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.POST)
    public String updateUser(@Valid Users user, BindingResult result,
            ModelMap model, @PathVariable int id) {

        if (result.hasErrors()) {
            return "registration";
        }

        userService.updateUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
        return "registrationsuccess";
    }

    /**
     * This method will delete an user by it's SSOID value.
     */
    @RequestMapping(value = {"/delete-user-{id}"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable int id) {
        userService.deleteById(id);
        return "userslist";
    }

//	@RequestMapping(value = { "/add-document-{id}" }, method = RequestMethod.GET)
//	public String addDocuments(@PathVariable int id, ModelMap model) {
//		Users user = userService.findById(id);
//		model.addAttribute("user", user);
//
//		FileBucket fileModel = new FileBucket();
//		model.addAttribute("fileBucket", fileModel);
//
////		List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
////		model.addAttribute("documents", documents);
//		
//		return "userlist";
//	}
//        
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(@RequestParam("name") String name,
            @RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                //C:\xampp\tomcat\tmpFiles
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "AudioFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded file=" + name;
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }
}

//
//	@RequestMapping(value = { "/download-document-{userId}-{docId}" }, method = RequestMethod.GET)
//	public String downloadDocument(@PathVariable int userId, @PathVariable int docId, HttpServletResponse response) throws IOException {
//		UserDocument document = userDocumentService.findById(docId);
//		response.setContentType(document.getType());
//        response.setContentLength(document.getContent().length);
//        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");
// 
//        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
// 
// 		return "redirect:/add-document-"+userId;
//	}
//
//	@RequestMapping(value = { "/delete-document-{userId}-{docId}" }, method = RequestMethod.GET)
//	public String deleteDocument(@PathVariable int userId, @PathVariable int docId) {
//		userDocumentService.deleteById(docId);
//		return "redirect:/add-document-"+userId;
//	}
//
//	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
//	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int userId) throws IOException{
//		
//		if (result.hasErrors()) {
//			System.out.println("validation errors");
//			User user = userService.findById(userId);
//			model.addAttribute("user", user);
//
//			List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
//			model.addAttribute("documents", documents);
//			
//			return "managedocuments";
//		} else {
//			
//			System.out.println("Fetching file");
//			
//			User user = userService.findById(userId);
//			model.addAttribute("user", user);
//
//			saveDocument(fileBucket, user);
//
//			return "redirect:/add-document-"+userId;
//		}
//	}
//	
//	private void saveDocument(FileBucket fileBucket, User user) throws IOException{
//		
//		UserDocument document = new UserDocument();
//		
//		MultipartFile multipartFile = fileBucket.getFile();
//		
//		document.setName(multipartFile.getOriginalFilename());
//		document.setDescription(fileBucket.getDescription());
//		document.setType(multipartFile.getContentType());
//		document.setContent(multipartFile.getBytes());
//		document.setUser(user);
//		userDocumentService.saveDocument(document);
//	}

