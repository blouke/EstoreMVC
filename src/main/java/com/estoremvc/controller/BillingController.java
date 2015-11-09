package com.estoremvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.payment.Address;
import com.estore.domain.payment.IAddress;

@Controller
@RequestMapping("/billing")
public class BillingController {

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView billingForm() {
		return new ModelAndView("billing");
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView processBillingSubmit(HttpServletRequest request){
		ModelAndView model = new ModelAndView("billingConfirm");
		IAddress address = new Address();
		address.setCity(request.getParameter("city"));
		address.setPhone(request.getParameter("phone"));
		address.setState(request.getParameter("state"));
		address.setStreetAddress(request.getParameter("street"));
		address.setUserId(Integer.parseInt(request.getParameter("userId")));
		address.setZipCode(request.getParameter("zip"));
		model.addObject("address", address);
		return model;
	}
}


