package com.estoremvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.order.OrderService;
import com.estore.domain.product.ProductService;
import com.estore.domain.user.UserService;

@Controller
public class AdminController {
	private OrderService orderService = new OrderService();
	private ProductService productService = new ProductService();
	private UserService userService = new UserService();
	
	@RequestMapping("/adminOrder")
	public ModelAndView adminOrder() {
		ModelAndView model = new ModelAndView("adminOrderPage");
		model.addObject("orderAdmin", orderService.getAllOrders());
		return model;
	}
	
	@RequestMapping("/adminProduct")
	public ModelAndView adminProduct() {
		ModelAndView model = new ModelAndView("adminProductPage");
		model.addObject("productAdmin", productService.getAllProducts());
		return model;
	}
	
	@RequestMapping("/adminUser")
	public ModelAndView adminAccount() {
		ModelAndView model = new ModelAndView("adminUserPage");
		model.addObject("userAdmin", userService.getAllUsers());
		return model;
	}
	
	@RequestMapping("/adminDelete/{id}")
	public ModelAndView adminDelete(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("adminDeletePage");
		productService.deleteProduct(id);
		model.addObject("productId", id);
		return model;
	}
}
