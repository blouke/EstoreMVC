package com.estoremvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.order.OrderService;
import com.estore.domain.payment.Address;
import com.estore.domain.payment.AddressService;
import com.estore.domain.payment.IAddress;
import com.estore.domain.user.IUser;
import com.estore.domain.user.User;
import com.estore.domain.user.UserService;
import com.estore.service.order.ICart;
import com.estore.service.order.IOrder;

@Controller
public class BillingController {

//	@RequestMapping(method=RequestMethod.GET)
//	public ModelAndView billingForm() {
//		return new ModelAndView("billing");
//	}
	
	//Just for testing form output
	//Not necessary for final website
	@RequestMapping(value="/billing", method=RequestMethod.POST)
	public ModelAndView processBillingSubmit(HttpServletRequest request){
		ModelAndView model = new ModelAndView("billingConfirm");
		IAddress address = new Address();
		address.setCity(request.getParameter("city"));
		address.setPhone(request.getParameter("phone"));
		address.setState(request.getParameter("state"));
		address.setStreetAddress(request.getParameter("street"));
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		UserService userService = new UserService();
		IUser user = userService.getUserById(userId);
		
		address.setUser((User) user);
		address.setZipCode(request.getParameter("zip"));
		
		AddressService addressService = new AddressService();
		OrderService orderService = new OrderService();
		ICart cart = (ICart)session.getAttribute("cart");
		IOrder order = cart.createOrder(userId);
		addressService.saveAddress(address);
		int orderId = orderService.saveOrder(order);
		
		model.addObject("orderId", orderId);
		model.addObject("orderSuccess", "true");
		
		session.removeAttribute("cart");
		
		return model;
	}
}


