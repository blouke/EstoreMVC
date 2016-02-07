package com.estoremvc.controller;


import java.util.HashMap;
import java.util.Map;
import com.stripe.*;
import com.stripe.exception.CardException;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.estore.service.order.IOrderService;
import com.estore.domain.order.Cart;
import com.estore.domain.order.OrderDetail;
import com.estore.domain.order.OrderService;
import com.estore.domain.payment.Address;
import com.estore.domain.payment.AddressService;
import com.estore.domain.payment.IAddress;
import com.estore.domain.product.IProduct;
import com.estore.domain.product.IProductService;
import com.estore.domain.product.Product;
import com.estore.domain.product.ProductService;
import com.estore.domain.user.IUser;
import com.estore.domain.user.User;
import com.estore.domain.user.UserService;
import com.estore.service.order.ICart;
import com.estore.service.order.IOrder;
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
//		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
//		ICart cart = (ICart)session.getAttribute("cart");
//		model.addObject("cart", cart);
		return model;
	}
	
	
	
	@RequestMapping("/cart/add/{productId}")
	public ModelAndView addItem(HttpServletRequest request, @PathVariable String productId){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
		ICart cart = (ICart)session.getAttribute("cart");
				
		if (cart == null){
			cart = new Cart();
		}
		try {
			Long prodId = Long.parseLong(productId);
		
		IProductService productService = new ProductService();
		IProduct product = productService.getProductById(prodId);
		if (product != null){
			IOrderDetail lineItem = new OrderDetail();
			lineItem.setProduct((Product)product);
			cart.addItem(lineItem);
		}
		} catch (NumberFormatException e){ }
		session.setAttribute("cart", cart);
//		model.addObject("cart", cart);
		return model;
	}
	
	
	
	@RequestMapping(value="/cart/update", method=RequestMethod.POST)
	public ModelAndView updateCart(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("cart");
		ICart cart = (ICart)session.getAttribute("cart");
		if (cart == null)
			cart = new Cart();
		
		Map<String,String[]> tableData = request.getParameterMap();
		String[] idsToUpdate = tableData.get("productId");
		String[] qtyToUpdate = tableData.get("quantity");
		for (int i=0; i<idsToUpdate.length; i++){
			Long prodId = Long.parseLong(idsToUpdate[i]);
			int quantity = Integer.parseInt(qtyToUpdate[i]);
			IOrderDetail item = cart.findItem(prodId);
			cart.updateItemQty(item, quantity);
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

	
	@RequestMapping("/cart/checkoutAddress")
	public ModelAndView checkoutAddress(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("userId")==null)
			return new ModelAndView("register");
		else {
			
			IAddress address = new Address();
			address.setCity(request.getParameter("city"));
			address.setPhone(request.getParameter("phone"));
			address.setState(request.getParameter("state"));
			address.setStreetAddress(request.getParameter("street"));
			int userId = (int)session.getAttribute("userId");
			UserService userService = new UserService();
			IUser user = userService.getUserById(userId);
			address.setUser((User) user);
			address.setZipCode(request.getParameter("zip"));
			session.setAttribute("address", address);
			
			return new ModelAndView("checkoutAddress");
		}
	}
	
	
	@RequestMapping("/cart/checkoutDelivery")
	public ModelAndView checkoutDelivery(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("userId")==null)
			return new ModelAndView("register");
		else {
			
			// calculate shippingCharges
			
			
			return new ModelAndView("checkoutDelivery");
		}
	}
	
	
	@RequestMapping("/cart/checkoutPayment")
	public ModelAndView checkoutPayment(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("userId")==null)
			return new ModelAndView("register");
		else {
			session.setAttribute("deliveryType", request.getParameter("delivery"));
			return new ModelAndView("checkoutPayment");
		}
	}
	
	
	@RequestMapping("/cart/checkoutReview")
	public ModelAndView checkoutReview(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("userId")==null)
			return new ModelAndView("register");
		else {
			session.setAttribute("stripeToken", request.getAttribute("stripeToken"));
			return new ModelAndView("checkoutReview");
		}
	}
	
	
	
	
	@RequestMapping("/cart/orderConfirm")
	public ModelAndView checkoutSubmit(HttpServletRequest request){

		HttpSession session = request.getSession();
		
		if (session.getAttribute("userId")==null)
			return new ModelAndView("register");
		else { 
			
			ModelAndView model = new ModelAndView("billingConfirm");
			
			
			
			// Set your secret key: remember to change this to your live secret key in production
			// See your keys here https://dashboard.stripe.com/account/apikeys
			Stripe.apiKey = "sk_test_iqOnQOBSuQ0BWFYzUCmT27yx";

			// Get the credit card details submitted by the form
			String token = (String)session.getAttribute("stripeToken");
			
			float chargeAmount = (float)session.getAttribute("cartTotal");

			// Create the charge on Stripe's servers - this will charge the user's card
			try {
			  Map<String, Object> chargeParams = new HashMap<String, Object>();
			  chargeParams.put("amount", chargeAmount); // amount in cents, again
			  chargeParams.put("currency", "usd");
			  chargeParams.put("source", token);
			  chargeParams.put("description", "Example charge");
			  
			  Map<String, String> initialMetaData = new HashMap<String, String>();
			  initialMetaData.put("order_id", "222");
			  chargeParams.put("metadata", initialMetaData);
			  
			  Charge charge = Charge.create(chargeParams);
			} catch (CardException e) {
			  // The card has been declined
			} catch (StripeException e) {
				
			}
			
			
			int userId = (int)session.getAttribute("userId");
			IAddress address = (IAddress)session.getAttribute("address");
			
			AddressService addressService = new AddressService();
			OrderService orderService = new OrderService();
			ICart cart = (ICart)session.getAttribute("cart");
			IOrder order = cart.createOrder(userId);
			addressService.saveAddress(address);
			int orderId = orderService.saveOrder(order);
			
			model.addObject("orderId", orderId);
			model.addObject("orderSuccess", "true");
			
			session.invalidate();
			session.setAttribute("userId", userId);
	
			return model;
		}
		
		
	}			
}