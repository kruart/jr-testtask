package ua.kruart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import ua.kruart.dao.UserDao;
import ua.kruart.model.User;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserValidation validator;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/searchUsers")
    public ModelAndView searchUsers(@RequestParam(required = false, defaultValue = "") String name){
        ModelAndView mav = new ModelAndView("showUsers");
        List<User> users = userDao.searchUsers(name.trim());
        mav.addObject("SEARCH_USERS_RESULTS_KEY", users);

        return mav;
    }

    @RequestMapping(value = "/viewAllUsers", method= RequestMethod.GET)
    public ModelAndView getAllUsers(@RequestParam(value="pageNum", required = false) int pageNum){
        ModelAndView mav = new ModelAndView("showUsers");
        List<User> users = userDao.getAllUsers(pageNum);
        mav.addObject("SEARCH_USERS_RESULTS_KEY", users);

        int pageCount = 0;
        List<User> usersAll = userDao.getAllOfUsers();
        if (usersAll.size() % 10 == 0) {
            pageCount = usersAll.size() / 10;
        } else
            pageCount = usersAll.size() / 10 + 1;

        mav.addObject("USERS_PAGE_COUNT", pageCount);
        return mav;
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.GET)
    public ModelAndView newUserForm(){
        ModelAndView mav = new ModelAndView("addUser");
        mav.addObject("addUser", new User());
        return mav;
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public String create(@ModelAttribute("addUser")User user, BindingResult result, SessionStatus status){
        validator.validate(user, result);
        if (result.hasErrors()){
            return "addUser";
        }
        userDao.save(user);
        status.setComplete();
        return "redirect:viewAllUsers.do?pageNum=1";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("id")Integer id){
        ModelAndView mav = new ModelAndView("editUser");
        User user = userDao.getById(id);
        mav.addObject("editUser", user);

        return mav;
    }

    @RequestMapping(value="/updateUser", method = RequestMethod.POST)
    public String update(@ModelAttribute("editUser") User user, BindingResult result, SessionStatus status){
        validator.validate(user, result);
        if (result.hasErrors()){
            return "editUser";
        }
        userDao.update(user);
        status.setComplete();
        return "redirect:viewAllUsers.do?pageNum=1";
    }

    @RequestMapping("deleteUser")
    public String delete(@RequestParam("id")Integer id){
        userDao.delete(id);
        return "redirect:viewAllUsers.do?pageNum=1";
    }
}
