package com.websystique.springmvc.controller;

import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Answers;
import com.websystique.springmvc.model.Categories;
//import com.websystique.springmvc.model.FileBucket;
import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Sections;
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
import com.websystique.springmvc.service.AnswersService;
import com.websystique.springmvc.service.CategoriesService;
import com.websystique.springmvc.service.QuestionsService;
import com.websystique.springmvc.service.SectionsService;
import com.websystique.springmvc.service.UsersService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class AppController {

    //Nikesh you can write the controller class with refrence to below code
    //it gave me error with previous code so i commented out
    @Autowired
    UsersService userService;

    @Autowired
    QuestionsService questionService;
//

    @Autowired
    AnswersService answersService;

    @Autowired
    CategoriesService categoriesService;

    @Autowired
    SectionsService sectionService;
    
    
    
    
    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "userslist";
    }

    @RequestMapping(value = {"/LW-GAPS"}, method = RequestMethod.GET)
    public String listAllLWGPAS(ModelMap model) {
        return "LW-GAPS";
    }

    @RequestMapping(value = {"/LR-HOTS"}, method = RequestMethod.GET)
    public String listAllLRHOTS(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LR-HOTS";
    }

    @RequestMapping(value = {"/LR-HILI"}, method = RequestMethod.GET)
    public String listALLLRHILI(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LR-HILI";
    }

    @RequestMapping(value = {"/LL-MAMC"}, method = RequestMethod.GET)
    public String listALLMAMC(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LL-MAMC";
    }

    @RequestMapping(value = {"/LL-SAMC"}, method = RequestMethod.GET)
    public String listALLSAMC(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LL-SAMC";
    }

    @RequestMapping(value = {"/LL-GAPS"}, method = RequestMethod.GET)
    public String listALLLLGAPS(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LL-GAPS";
    }

    @RequestMapping(value = {"/LW-SUMM"}, method = RequestMethod.GET)
    public String listALLLWSUMM(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LW-SUMM";
    }

    @RequestMapping(value = {"/LW-DICT"}, method = RequestMethod.GET)
    public String listALLLWDICT(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LW-DICT";
    }

    @RequestMapping(value = {"/RR-SAMC"}, method = RequestMethod.GET)
    public String listALLRRSAMC(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RR-SAMC";
    }

    @RequestMapping(value = {"/RW-GAPS"}, method = RequestMethod.GET)
    public String listRWGAPS(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RW-GAPS";
    }

    @RequestMapping(value = {"/RR-GAPS"}, method = RequestMethod.GET)
    public String listALLRRGAPS(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RR-GAPS";
    }

    @RequestMapping(value = {"/RR-MAMC"}, method = RequestMethod.GET)
    public String listALLRRMAMC(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RR-MAMC";
    }

    @RequestMapping(value = {"/RR-DRDR"}, method = RequestMethod.GET)
    public String listALLRRDRDR(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RR-DRDR";
    }

    @RequestMapping(value = {"/SS-DESC"}, method = RequestMethod.GET)
    public String listSSDESC(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "SS-DESC";
    }

    @RequestMapping(value = {"/SR-READ"}, method = RequestMethod.GET)
    public String listALLSRREAD(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "SR-READ";
    }

    @RequestMapping(value = {"/LS-SAQS"}, method = RequestMethod.GET)
    public String listALlLSSAQS(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LS-SAQS";
    }

    @RequestMapping(value = {"/LS-PRES"}, method = RequestMethod.GET)
    public String listALLLSPRES(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LS-PRES";
    }

    @RequestMapping(value = {"/LS-REPT"}, method = RequestMethod.GET)
    public String listALLLSREPT(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "LS-REPT";
    }

    @RequestMapping(value = {"/RW-SUMM"}, method = RequestMethod.GET)
    public String listALLRWSUMM(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "RW-SUMM";
    }

    @RequestMapping(value = {"/WW-ESSA"}, method = RequestMethod.GET)
    public String listALLWWESSA(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "WW-ESSA";
    }

    @RequestMapping(value = {"/BB-BREAK"}, method = RequestMethod.GET)
    public String listALLBBBREAK(ModelMap model) {
        Collection<Users> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "BB-BREAK";
    }

    @RequestMapping(value = {"/questions"}, method = RequestMethod.GET)
    public String listQuestions(ModelMap model) {
        Collection<Questions> questions = questionService.findAllQuestions();
        model.addAttribute("questions", questions);
        model.addAttribute("categories", categoriesService.findAllCategories());
        model.addAttribute("sections", sectionService.findAllSections());
        return "addquestion";
    }

    @RequestMapping(value = {"/questions"}, method = RequestMethod.POST)
    public String addQuestion(Questions question, @RequestParam("audio") MultipartFile file,@RequestParam("image") MultipartFile file2, 
            @RequestParam("answerOptionsCollection.option[]") String[] options) {
        List<AnswerOptions> answerOptions = new LinkedList<AnswerOptions>();
        for(String option : options){
            answerOptions.add(new AnswerOptions(null, option));
        }
        question.setAnswerOptionsCollection(answerOptions);
        question.setAudioPath(file.getName());
        question.setImagePath(file2.getName());
        questionService.saveQuestions(question);
        //System.out.println();
        //uploadFileHandler(file.getName(), file);
        //uploadFileHandler(file2.getName(), file2);
        return "redirect:/questions";
    }

    @RequestMapping(value = {"/answers"}, method = RequestMethod.GET)
    public String listAnswers(ModelMap model) {
        Collection<Answers> answers = answersService.findAllAnswers();
        model.addAttribute("answers", answers);
        return "newjsp";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        Users user = new Users();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }

    @RequestMapping(value = {"/section"}, method = RequestMethod.GET)
    public String newSection(ModelMap map) {

        Collection<Categories> categories = categoriesService.findAllCategories();
        map.addAttribute("categories", categories);
        return "addsection";
    }

    @RequestMapping(value = {"/section"}, method = RequestMethod.POST)
    public String addSection(Sections section) {
        sectionService.saveSections(section);
        return "redirect:/questions";
    }
    
    @RequestMapping(value="/test", method=RequestMethod.POST)
    public String test(@RequestParam("options[]") String[] options){
        for(int i = 0; i < options.length; i++)
            System.out.println(options[i]);
        return "redirect:/questions";
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

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String saveUser(@Valid Users user, BindingResult result,
            ModelMap model) {
        System.out.println("INSIDE");
//        if (result.hasErrors()) {
//            return "registration";
//        }

        //  System.out.println(user);

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
        //model.addAttribute("user", user);
        //   model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        userService.saveUser(user);
        // model.addAttribute("user", user);
        //model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        //return "success";
        return "registrationsuccess";
    }
//
//

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

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
//    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFileHandler(String name,
            MultipartFile file) {

        if (!file.isEmpty() || file != null) {
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

