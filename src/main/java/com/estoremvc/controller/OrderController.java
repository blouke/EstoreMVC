package com.estoremvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estore.service.order.IOrderService;
import com.estore.domain.order.Cart;
import com.estore.domain.order.OrderDetail;
import com.estore.domain.order.OrderService;
import com.estore.domain.product.IProduct;
import com.estore.domain.product.IProductService;
import com.estore.domain.product.Product;
import com.estore.domain.product.ProductService;
import com.estore.service.order.ICart;
import com.estore.service.order.IOrderDetail;

@Controller
public class OrderController {
	
	@RequestMapping("/orders")
	public ModelAndView orderHistory() {
		IOrderService orderService = new OrderService();
		ModelAndView model = new ModelAndView("orders");
		model.addObject("orders", orderService.getAllOrders());
		return model;
	}
	

	
	@RequestMapping("/cart")
	public ModelAndView showCart(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
		ICart cart = (ICart)session.getAttribute("cart");
		model.addObject("cart", cart);
		return model;
	}
	
	
	
	@RequestMapping("/cart/add/{productId}")
	public ModelAndView addItem(HttpServletRequest request, @PathVariable String productId){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
		ICart cart = (ICart)session.getAttribute("cart");
		if (cart == null)
			cart = new Cart();
		Long prodId = Long.parseLong(productId);
		IProductService productService = new ProductService();
		IProduct product = productService.getProductById(prodId);
		if (product != null){
			IOrderDetail lineItem = new OrderDetail();
			lineItem.setProduct((Product)product);
			cart.addItem(lineItem);
		}
		session.setAttribute("cart", cart);
//		model.addObject("cart", cart);
		return model;
	}
	
	
	@RequestMapping("/cart/remove/{lineItemId}")
	public ModelAndView removeItem(HttpServletRequest request, @PathVariable String lineItemId){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
		ICart cart = (ICart)session.getAttribute("cart");
		Long id = Long.parseLong(lineItemId);
		cart.removeItem(id);
		session.setAttribute("cart", cart);
//		model.addObject("cart", cart);
		return model;
	}
	
	
}






















