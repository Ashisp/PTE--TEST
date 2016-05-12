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
import com.websystique.springmvc.service.UserAuthenticateService;
import com.websystique.springmvc.service.UsersService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/")
@MultipartConfig
public class AppController {

    //Nikesh you can write the controller class with refrence to below code
    //it gave me error with previous code so i commented out
    @Autowired
    UsersService userService;

    @Autowired
    QuestionsService questionService;
//

    @Autowired
    UserAuthenticateService userAuthenticateService;

    @Autowired
    AnswersService answersService;

    @Autowired
    CategoriesService categoriesService;

    @Autowired
    SectionsService sectionService;

    @RequestMapping(value = "/start", method = RequestMethod.GET)
    public String loadStartPage(ModelMap map) {

        return "start";
    }

    @RequestMapping(value = "/loadSection", method = RequestMethod.POST)
    public String loadSection(@RequestParam("currentSection") int currentSection, HttpServletRequest req) {
         
        int nextSectionToLoad = currentSection + 1;
        HttpSession session = req.getSession(false);
        System.out.println("Next: " + nextSectionToLoad);
session.setAttribute("question_count", "0");


        String sectionNext = sectionService.findUrlPatternByOrderSequence(nextSectionToLoad);
        Integer catId = sectionService.findCatIdBySectionId(currentSection);
        Integer catId_next = sectionService.findCatIdBySectionId(nextSectionToLoad);
        Long count = questionService.CountALlQuestionsByCatId(catId_next);
        
        Long count_question_section=questionService.CountALlQuestions(currentSection);
        Long total_questions=+count_question_section;
        session.setAttribute("previous_count", total_questions);
session.setAttribute("question_count", count);

        if (catId != catId_next) {

            session.setAttribute("startTime", 0);
           
            session.setAttribute("previous_count", 0);
            
              

        }

//        if(cat!=cat)
//        {
//        
//        }
        if (sectionNext.isEmpty()) {
            return "redirect:/end";
        }
        return "redirect:/" + sectionNext;
    }

    @RequestMapping(value = "/loadcategories", method = RequestMethod.POST)
    public String loadCategories(@RequestParam("currentSection") int currentCat) {
        int nextCattoLoad = currentCat + 1;
        //System.out.println("Next: " + nextCattoLoad);
        Integer cat_next = categoriesService.findCatIdByOrderSquence(nextCattoLoad);

        Long count = questionService.CountALlQuestionsByCatId(cat_next);

        return "redirect:/";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model, Integer offset, Integer maxResults, HttpServletRequest req) {
        Enumeration<String> attributeNames = req.getSession(false).getAttributeNames();
        System.out.println(attributeNames.hasMoreElements());
        while (attributeNames.hasMoreElements()) {
            String attribute = attributeNames.nextElement();
            if (attribute.equals("isAdmin")) {
                boolean isAdmin = Boolean.parseBoolean(req.getSession(false).getAttribute(attribute).toString());
                if (!isAdmin) {
                    return "redirect:/restrict";
                }
                break;
            }
        }
        Long count;
        count = userService.countUsers();
        Collection<Users> users = userService.findAllUsers(offset, maxResults);
        model.addAttribute("users", users);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        System.out.println("users");
        return "userslist";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String firstPage(ModelMap model, Integer offset, Integer maxResults) {

        System.out.println("users");
        return "index";
    }

    @RequestMapping(value = {"/Mainpage"}, method = RequestMethod.GET)
    public String firstPage(ModelMap model, HttpServletRequest req) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }

        return "Mainpage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loadLogin(HttpServletRequest req) {
        /*String userId = "";
         if (req.getSession(false) != null) {
         userId = (String) req.getSession(false).getAttribute("uid");
         } else {
         return "login";
         }
         if (userId != null || !userId.equals("")) {
         return "redirect:/list";
         }*/
        return "login";
    }

    @RequestMapping(value = "/login_admin", method = RequestMethod.GET)
    public String loadLogin_admin(HttpServletRequest req) {
        /*String userId = "";
         if (req.getSession(false) != null) {
         userId = (String) req.getSession(false).getAttribute("uid");
         } else {
         return "login";
         }
         if (userId != null || !userId.equals("")) {
         return "redirect:/list";
         }*/
        return "login_admin";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req) {
        req.getSession(false).invalidate();
        return "redirect:/login";
    }

    @RequestMapping(value = "/sections-list", method = RequestMethod.GET)
    public String loadList(HttpServletRequest req) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/login";
        }
        return "index";
    }

    @RequestMapping(value = {"/LW-GAPS"}, method = RequestMethod.GET)
    public String listAllLWGPAS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;

        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }

        int sectionId = sectionService.findSectionIdByUrlPattern("LW-GAPS");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        int counter = 0;
        for (Questions q : questions) {
            String passage = q.getPassage();
            if (!passage.isEmpty()) {
                while (passage.contains("%_%")) {
                    String replaced = passage.replaceFirst("%_%", "<input type=\"text\" spellcheck=\"false\" class=\"blanks form-control\" name=\"ans" + counter + "\" />");
                    //String replaced = question.replaceAll("%_%", "<input type=\"text\" spellcheck=\"false\" class=\"blanks form-control\" name=\"" + counter +"\"/>");
                    q.setPassage(replaced);
                    passage = q.getPassage();
                    counter++;
                }
            }
        }
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", req.getAttribute("offset"));
        return "LW_GAPS";
    }

    @RequestMapping(value = {"/LW-GAPS"}, method = RequestMethod.POST)
    public String listAllLWGAPS(ModelMap map, @RequestParam("currentSection") int currentSection, @RequestParam("catId") int catId,
            @RequestParam("questionId") int questionId, HttpServletRequest req, RedirectAttributes redir) {
//ashis
        ///sesstion id for type of test;
//        if (endId == 1) {
//            loadSection(currentSection,req);
//        } else if (endId == 2) {
//            loadCategories(catId);
//        } else {
//
//        }
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers answer = new Answers();
        answer.setUserId(new Users(Integer.parseInt(userId)));
        answer.setQuestionId(new Questions(questionId));
        String answers = "";
        Enumeration<String> parameterNames = req.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameter = parameterNames.nextElement();
            if (parameter.contains("ans")) {
                answers = answers + req.getParameter(parameter) + ",";
            }
            /*if (!parameter.equals("questionId") && !parameter.equals("userId")
             && !parameter.equals("done") && !parameter.equals("catId")
             && !parameter.equals("currentSection") && !parameter.equals("endId")
             && !parameter.equals("offset") && !parameter.equals("count")) {
             }*/
        }
        answer.setAnswer(answers);
        answersService.saveAnswers(answer);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section

            return "redirect:/LW-GAPS?offset=" + offset;

        }
        return loadSection(currentSection, req);
        //redir.addAttribute("offset", offset);
    }

    @RequestMapping(value = {"/LR-HOTS"}, method = RequestMethod.GET)
    public String listAllLRHOTS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LR-HOTS");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);

        return "LR_HOTS";
    }

    @RequestMapping(value = "/LR-HOTS", method = RequestMethod.POST)
    public String processLRHOTS(@RequestParam("questionId") int questionId, @RequestParam("choice") String choice, HttpServletRequest req, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers answer = new Answers();
        answer.setUserId(new Users(Integer.parseInt(userId)));
        answer.setQuestionId(new Questions(questionId));
        answer.setAnswer(choice);
        answersService.saveAnswers(answer);

        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LR-HOTS?offset=" + offset;

        }
        return loadSection(currentSection, req);

    }

    @RequestMapping(value = {"/LR-HILI"}, method = RequestMethod.GET)
    public String listALLLRHILI(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LR-HILI");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LR_HILI";

    }

    @RequestMapping(value = "/LR-HILI", method = RequestMethod.POST)
    public String processLRHILI(@RequestParam("questionId") int questionId, @RequestParam("selected") String selected, HttpServletRequest req, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setAnswer(selected);
        ans.setQuestionId(new Questions(questionId));
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LR-HILI?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/LL-MAMC"}, method = RequestMethod.GET)
    public String listALLMAMC(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LL-MAMC");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);

        return "LL_MAMC";
    }

    @RequestMapping(value = "/LL-MAMC", method = RequestMethod.POST)
    public String processMAMC(@RequestParam("questionId") int questionId, @RequestParam("choices") String choice, HttpServletRequest req, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {

        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(choice);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LL-MAMC?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String processCredentialModelAndView(@RequestParam("email") String username, @RequestParam("password") String password, HttpServletRequest request) {
        List<Users> users = userAuthenticateService.verifyLogin(username, password);
        if ((users != null) && (users.size() > 0)) {
            request.getSession(false).setAttribute("uid", users.get(0).getUserId().toString());
            request.getSession(false).setAttribute("isAdmin", String.valueOf(users.get(0).getIsAdmin()));
            //request.setAttribute();
            //String message = "invalid";
            if (users.get(0).getIsAdmin()) {
                return "redirect:/list";
            } else {
                return "redirect:/start";
            }
            // message="valid";

        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = {"/login_admin"}, method = RequestMethod.POST)
    public String processCredentialModelAndView_login(@RequestParam("email") String username, @RequestParam("password") String password, HttpServletRequest request) {

        if ((username.equalsIgnoreCase("rijan@sijan@admin@gmail.com")) && (password == "heroku123456789")) {
            request.getSession(false).setAttribute("uid", 11);
            //request.setAttribute();
            String message = "invalid";
            return "redirect:/list";
            // message="valid"
        } else {
            return "redirect:/Role";
        }
    }

    @RequestMapping(value = {"/LL-SAMC"}, method = RequestMethod.GET)
    public String listALLSAMC(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;

        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LL-SAMC");
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        count = questionService.CountALlQuestions(sectionId);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LL_SAMC";
    }

    @RequestMapping(value = "/LL-SAMC", method = RequestMethod.POST)
    public String processSAMC(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("choice") String choice, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setAnswer(choice);
        ans.setQuestionId(new Questions(questionId));
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LL-SAMC?offset=" + offset;

        }
        return loadSection(currentSection, req);

    }

    @RequestMapping(value = {"/LL-GAPS"}, method = RequestMethod.GET)
    public String listALLLLGAPS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;

        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }

        int sectionId = sectionService.findSectionIdByUrlPattern("LL-GAPS");
        count = questionService.CountALlQuestions(sectionId);
        //   count=questionService.CountALlQuestions(sectionId);

        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);

        return "LL_GAPS";
    }

    @RequestMapping(value = "/LL-GAPS", method = RequestMethod.POST)
    public String processLLGAPS(@RequestParam("questionId") int questionId, HttpServletRequest req,
            @RequestParam("missing") String missing,
            @RequestParam("currentSection") int currentSection) {
        long count;

        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(missing);

        answersService.saveAnswers(ans);
        int sectionId = sectionService.findSectionIdByUrlPattern("LL-GAPS");
        count = questionService.CountALlQuestions(sectionId);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LL-GAPS?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/LW-SUMM"}, method = RequestMethod.GET)
    public String listALLLWSUMM(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LW-SUMM");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LW_SUMM";
    }

    @RequestMapping(value = "/LW-SUMM", method = RequestMethod.POST)
    public String processLWSUMM(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("summary") String summary, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(summary);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LW-SUMM?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/LW-DICT"}, method = RequestMethod.GET)
    public String listALLLWDICT(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LW-DICT");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LW_DICT";
    }

    @RequestMapping(value = "/LW-DICT", method = RequestMethod.POST)
    public String processLWDICT(@RequestParam("questionId") int questionId, @RequestParam("answer") String answer, HttpServletRequest req, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setAnswer(answer);
        ans.setQuestionId(new Questions(questionId));
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LW-DICT?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/end"}, method = RequestMethod.GET)
    public String endpage(ModelMap modelMa, HttpServletRequest request) {

        return "end";
    }

    @RequestMapping(value = {"/RR-SAMC"}, method = RequestMethod.GET)
    public String listALLRRSAMC(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("RR-SAMC");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RR_SAMC";
    }

    @RequestMapping(value = "/RR-SAMC", method = RequestMethod.POST)
    public String processRRSAMC(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("choice") String choice, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(choice);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RR-SAMC?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/RW-GAPS"}, method = RequestMethod.GET)
    public String listRWGAPS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId); 
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("RW-GAPS");
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        for (Questions q : questions) {
            int counter = 1;
            String passage = q.getPassage();
            if (!passage.isEmpty()) {
                while (passage.contains("%_%")) {
                    String selectTagStart = "<select onchange=\"setSelectedItem(this)\" name=\"blank" + counter + "\" class=\"blanks form-control\">";
                    String options = "<option value=\"\"></option>";
                    for (AnswerOptions aO : q.getAnswerOptionsCollection()) {
                        if (Integer.parseInt(aO.getOrderBlanks()) == counter) {
                            options += "<option  value=\"" + aO.getAnsOption() + "\">" + aO.getAnsOption() + "</option>";
                        }
                    }
                    String selectTagEnd = "</select>";
                    String htmlSelectTag = selectTagStart + options + selectTagEnd;
                    String replaced = passage.replaceFirst("%_%", htmlSelectTag);

                    q.setPassage(replaced);
                    passage = q.getPassage();
                    counter++;
                }
            }
        }
        model.addAttribute("listOfQuestions", questions);
        count = questionService.CountALlQuestions(sectionId);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RW_GAPS";
    }

    @RequestMapping(value = "/RW-GAPS", method = RequestMethod.POST)
    public String processRWGAPS(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("answerPassage") String answerPassage, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(answerPassage);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RW-GAPS?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/RR-GAPS"}, method = RequestMethod.GET)
    public String listALLRRGAPS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("RR-GAPS");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        for (Questions q : questions) {
            String passage = q.getPassage();
            if (!passage.isEmpty()) {
                String replaced = passage.replaceAll("%_%", "<span class=\"blank-box\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"></span>");
                q.setPassage(replaced);
            }
        }
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RR_GAPS";
    }

    @RequestMapping(value = "/RR-GAPS", method = RequestMethod.POST)
    public String processRRGAPS(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("answerPassage") String answerPassage, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(answerPassage);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RR-GAPS?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/RR-MAMC"}, method = RequestMethod.GET)
    public String listALLRRMAMC(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("RR-MAMC");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RR_MAMC";
    }

    @RequestMapping(value = "/RR-MAMC", method = RequestMethod.POST)
    public String processRRMAMC(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("choices") String choices, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(choices);
        answersService.saveAnswers(ans);
        int offset;
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RR-MAMC?offset=" + offset;

        }
        return loadSection(currentSection, req);

    }

    @RequestMapping(value = {"/RR-DRDR"}, method = RequestMethod.GET)
    public String listALLRRDRDR(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }

        int sectionId = sectionService.findSectionIdByUrlPattern("RR-DRDR");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RR_DRDR";
    }

    @RequestMapping(value = "/RR-DRDR", method = RequestMethod.POST)
    public String processRRDRDR(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("answer") String answer, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(answer);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");

        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);

        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RR-DRDR?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = "/BB-BREAK", method = RequestMethod.POST)
    public String processBB_BREAK(@RequestParam("currentSection") int currentSection, HttpServletRequest req) {
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = "/SR-READ", method = RequestMethod.POST)
    public String processSR_READ(HttpServletRequest req, Integer maxResults,
            @RequestParam("offset") int offset, @RequestParam("currentSection") int currentSection) {
        saveFileNameToDatabase(req);
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/SR-READ?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = "/LS-SAQS", method = RequestMethod.POST)
    public String processLS_SAQS(HttpServletRequest req, Integer maxResults,
            @RequestParam("offset") int offset, @RequestParam("currentSection") int currentSection) {
        saveFileNameToDatabase(req);
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LS-SAQS?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = "/LS-PRES", method = RequestMethod.POST)
    public String processLS_PRES(HttpServletRequest req, Integer maxResults,
            @RequestParam("offset") int offset, @RequestParam("currentSection") int currentSection) {
        saveFileNameToDatabase(req);
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LS-PRES?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = "/LS-REPT", method = RequestMethod.POST)
    public String processLS_REPT(HttpServletRequest req, Integer maxResults,
                @RequestParam("currentSection") int currentSection) {
        saveFileNameToDatabase(req);

        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/LS-REPT?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/SS-DESC"}, method = RequestMethod.GET)
    public String listSSDESC(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("SS-DESC");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "SS_DESC";
    }

    @RequestMapping(value = "/SS-DESC", method = RequestMethod.POST)
    public String processSSDESC(HttpServletRequest req, Integer maxResults,
            @RequestParam("offset") int offset, @RequestParam("currentSection") int currentSection) {
        //System.out.println("CALLED FROM AJAX POST " + req.getParameter("recording"));
        saveFileNameToDatabase(req);
        String s = req.getParameter("offset");
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
         String question_count = req.getParameter("question_no").toString();
        req.getSession(false).setAttribute("question_no", question_count);
        
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/SS-DESC?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/SR-READ"}, method = RequestMethod.GET)
    public String listALLSRREAD(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }

        int sectionId = sectionService.findSectionIdByUrlPattern("SR-READ");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);

        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "SR_READ";
    }

    @RequestMapping(value = {"/LS-SAQS"}, method = RequestMethod.GET)
    public String listALlLSSAQS(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LS-SAQS");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LS_SAQS";
    }

    @RequestMapping(value = {"/LS-PRES"}, method = RequestMethod.GET)
    public String listALLLSPRES(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LS-PRES");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LS_PRES";
    }

    @RequestMapping(value = {"/LS-REPT"}, method = RequestMethod.GET)
    public String listALLLSREPT(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //  count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("LS-REPT");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);

        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "LS_REPT";
    }

    @RequestMapping(value = {"/RW-SUMM"}, method = RequestMethod.GET)
    public String listALLRWSUMM(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //   count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("RW-SUMM");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "RW_SUMM";
    }

    @RequestMapping(value = {"/RW-SUMM"}, method = RequestMethod.POST)
    public String processRWSUMM(@RequestParam("questionId") int questionId, HttpServletRequest req, @RequestParam("summary") String summary, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setUserId(new Users(Integer.parseInt(userId)));
        ans.setQuestionId(new Questions(questionId));
        ans.setAnswer(summary);
        answersService.saveAnswers(ans);
        String s = req.getParameter("offset");
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/RW-SUMM?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/WW-ESSA"}, method = RequestMethod.GET)
    public String listALLWWESSA(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        // count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("WW-ESSA");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);
        model.addAttribute("listOfQuestions", questions);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "WW_ESSA";
    }

    @RequestMapping(value = {"/WW-ESSA"}, method = RequestMethod.POST)
    public String processWWESSA(@RequestParam("questionId") int questionId, @RequestParam("essay") String essay, HttpServletRequest req, RedirectAttributes redir, @RequestParam("currentSection") int currentSection) {
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers answer = new Answers();
        answer.setUserId(new Users(Integer.parseInt(userId)));
        answer.setQuestionId(new Questions(questionId));
        answer.setAnswer(essay);
        answersService.saveAnswers(answer);
        String s = req.getParameter("offset");
        
        String elapsedTime = req.getParameter("elapsedTime").toString();
        req.getSession(false).setAttribute("startTime", elapsedTime);
        
        int offset;
        if (s.isEmpty() || s.equals("")) {
            offset = 1;
        } else {
            offset = Integer.parseInt(s) + 1;
        }
        if (offset != questionService.CountALlQuestions(currentSection)) {
            // load section
            return "redirect:/WW-ESSA?offset=" + offset;

        }
        return loadSection(currentSection, req);
    }

    @RequestMapping(value = {"/BB-BREAK"}, method = RequestMethod.GET)
    public String listALLBBBREAK(ModelMap model, HttpServletRequest req, Integer offset, Integer maxResults) {
        Long count;
        //   count=questionService.CountALlQuestions(sectionId);
        String userId = (String) req.getSession(false).getAttribute("uid");
        if (userId == null) {
            return "redirect:/register";
        }
        int sectionId = sectionService.findSectionIdByUrlPattern("BB-BREAK");
        count = questionService.CountALlQuestions(sectionId);
        Collection<Questions> questions = questionService.findAllQuestionsBySectionId(sectionId, offset, maxResults);

        model.addAttribute("sectionId", sectionId);
        model.addAttribute("count", count);
        model.addAttribute("offset", offset);
        return "BB_BREAK";
    }

    //  post methods for form
    /*@RequestMapping(value = {"/LW-GAPS"}, method = RequestMethod.POST)
     public String saveLWGAPS(@Valid Answers answers, BindingResult result,
     ModelMap model) {
     if (result.hasErrors()) {
     return "LW-GAPS";
     }

     answersService.saveAnswers(answers);

     model.addAttribute("answers", answers);

     return "registrationsuccess";
     }*/
    //post method for from 
    /*@RequestMapping(value = {"/LR-HOTS"}, method = RequestMethod.POST)
     public String save(@Valid Answers answers, BindingResult result,
     ModelMap model) {
     if (result.hasErrors()) {
     return "LR-HOTS";
     }

     answersService.saveAnswers(answers);

     model.addAttribute("answers", answers);

     return "registrationsuccess";
     }*/
    @RequestMapping(value = {"/questions"}, method = RequestMethod.GET)
    public String listQuestions(ModelMap model) {
        Collection<Questions> questions = questionService.findAllQuestions();
        model.addAttribute("questions", questions);
        model.addAttribute("categories", categoriesService.findAllCategories());
        model.addAttribute("sections", sectionService.findAllSections());

        return "addquestion";
    }

    @RequestMapping(value = {"/questions"}, method = RequestMethod.POST)
    public String addQuestion(Questions question, @RequestParam("audio") MultipartFile file, @RequestParam("image") MultipartFile file2,
            @RequestParam("answerOptionsCollection.option[]") String[] options) {
        List<AnswerOptions> answerOptions = new LinkedList<AnswerOptions>();
        for (String option : options) {
            AnswerOptions ansOption = new AnswerOptions();
            ansOption.setAnsOption(option);
            answerOptions.add(ansOption);
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

    @RequestMapping(value = {"/answers-{userId}"}, method = RequestMethod.GET)
    public String listAnswers(ModelMap model, @PathVariable int userId, HttpServletRequest req) {
        Enumeration<String> attributeNames = req.getSession(false).getAttributeNames();
        System.out.println(attributeNames.hasMoreElements());
        while (attributeNames.hasMoreElements()) {
            String attribute = attributeNames.nextElement();
            if (attribute.equals("isAdmin")) {
                boolean isAdmin = Boolean.parseBoolean(req.getSession(false).getAttribute(attribute).toString());
                if (!isAdmin) {
                    return "redirect:/restrict";
                }
                break;
            }
        }
        Collection<Answers> answers = answersService.findAllAnswersByUserId(userId);
        System.out.println("User ID: " + userId);
        model.addAttribute("answers", answers);
        return "results";
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

    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(@RequestParam("options[]") String[] options) {
        for (int i = 0; i < options.length; i++) {
            System.out.println(options[i]);
        }
        return "redirect:/questions";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String saveUser(@Valid Users user, BindingResult result,
            ModelMap model) {
        System.out.println("INSIDE");
        userService.saveUser(user);
        return "registrationsuccess";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @RequestMapping(value = {"/edit-user-{id}"}, method = RequestMethod.GET)
    public String editUser(@PathVariable int id, ModelMap model) {
        Users user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        return "registration";
    }

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

    @RequestMapping(value = "/restrict", method = RequestMethod.GET)
    public String showRestrictPage() {
        return "restrict";
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
    ///		model.addAttribute("documents", documents);
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

    @RequestMapping(value = "/RecordingHandle", method = RequestMethod.POST)
    public String uploadRecordedFile(HttpServletRequest request) {
        OutputStream outputStream = null;
        try {
            String appPath = request.getServletContext().getRealPath("/");

            String name = request.getParameter("fname");
            String encodedData = request.getParameter("audio");
            outputStream = new FileOutputStream(new File(appPath + File.separator + name));//File.separator + "static" + File.separator + "Recordings" + 
            //outputStream.write(Base64.getDecoder().decode(encodedData));

        } catch (IOException ex) {

        } finally {
            try {
                outputStream.close();
            } catch (IOException ex) {

            }
        }
        return "Success";
    }

    @RequestMapping(value = "/RecordingHandle", method = RequestMethod.GET)
    public void uploadRecordGET() {
        System.out.println("GET: RECORDING");

    }

    private void saveFileNameToDatabase(HttpServletRequest req) {
        int questionId = Integer.parseInt(req.getParameter("questionId"));
        String fileName = req.getParameter("filename");
        String userId = (String) req.getSession(false).getAttribute("uid");
        Answers ans = new Answers();
        ans.setAudioPath(fileName);
        ans.setQuestionId(new Questions(questionId));
        ans.setUserId(new Users(Integer.parseInt(userId)));
        answersService.saveAnswers(ans);
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

