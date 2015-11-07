package com.estoremvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.estore.domain.product.*;

@Controller
@RequestMapping("/billing")
public class BillingController {

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView billingForm() {
		return new ModelAndView("billing");
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView processBillingSubmit(HttpServletRequest request){
		
		//In progress
		
		ModelAndView model = new ModelAndView("billingConfirm");
		Object attributeValue = "123 Main Street";
		model.addObject("street", attributeValue.toString() );
		//model.addObject("street", request.getParameter("street"));
		model.addObject("city", request.getParameter("city"));
		model.addObject("state", request.getParameter("state"));
		model.addObject("zip", request.getParameter("zip"));
		model.addObject("phone", request.getParameter("phone"));
		
		return model;
	}
}


