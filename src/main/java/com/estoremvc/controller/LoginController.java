package com.estoremvc.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.user.IUser;
import com.estore.domain.user.User;
import com.estore.domain.user.UserGroup;
import com.estore.domain.user.UserService;
import com.estore.utility.PasswordUtil;

@Controller
public class LoginController 
{
	private UserService userService = new UserService();

	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView authenticateUser(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		IUser user = userService.getUserByEmail(email);
		if (user != null){
			String passwordHash = user.getPasswordHash();
			String passwordChallengeHash = PasswordUtil.hashPassword(request.getParameter("password"));
			if (passwordHash.equals(passwordChallengeHash)){
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getId());
				ModelAndView model = new ModelAndView("billing");
				return model;
			}
		} 
		ModelAndView model = new ModelAndView("register");
		model.addObject("loginErrorMessage", "Invalid Email/Password");
		return model;
	}


	@RequestMapping(value="register", method=RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		IUser existingUser = userService.getUserByEmail(email);
		if (existingUser != null){
			ModelAndView model = new ModelAndView("register");
			model.addObject("registerErrorMessage", "Email Already registered.");
			return model;
		}
		
		IUser user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        String password = PasswordUtil.hashPassword(request.getParameter("password"));
        user.setPasswordHash(password);
        user.setCreateDate(new Date());
        
        UserGroup userGroup = userService.getUserGroupById(2);
        
        user.setUserGroup(userGroup);
		int userId = userService.saveUser(user);
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);		
		ModelAndView model = new ModelAndView("billing");
		return model;
	}
	
}
