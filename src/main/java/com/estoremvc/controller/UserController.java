package com.estoremvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.user.UserService;

@Controller
public class UserController 
{
	private UserService userService = new UserService();
	
	@RequestMapping("/users")
	public ModelAndView user()
	{
		ModelAndView model = new ModelAndView("users");
		model.addObject("users", userService.getAllUsers());
		return model;
				
	}
}
