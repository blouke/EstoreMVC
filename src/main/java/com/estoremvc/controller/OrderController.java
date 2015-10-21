package com.estoremvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.order.OrderService;

@Controller
public class OrderController {
	private OrderService orderService = new OrderService();
	
	@RequestMapping("/orders")
	public ModelAndView helloWorld() {
		ModelAndView model = new ModelAndView("orders");
		model.addObject("orders", orderService.getAllOrders());
		return model;
	}
	
//	public void setOrderService(OrderService orderService){
//		this.orderService = orderService;
//	}
}
