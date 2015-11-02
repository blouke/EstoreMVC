package com.estoremvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.order.OrderService;
import com.estore.domain.product.IProduct;
import com.estore.domain.product.Product;
import com.estore.domain.product.ProductService;
import com.estore.domain.user.IUser;
import com.estore.domain.user.UserService;
import com.estore.service.order.IOrder;

@Controller
public class AdminController {
	// Create instances to be used to connect to database
	private OrderService orderService = new OrderService();
	private ProductService productService = new ProductService();
	private UserService userService = new UserService();
	
	// Create enum to fix types of items in tables
	public enum namePageEnum {
	    product,
	    order,
	    user
	}
	// This method is used to show all orders.
	// Front controller will call this method when the url is http://localhost:8080/EstoreMVC/adminOrder.
	@RequestMapping("/adminOrder")
	public ModelAndView adminOrder() {
		// Create model and link adminOrderPage to it.
		ModelAndView model = new ModelAndView("adminOrderPage");
		
		// Binding orderAdmin to orderService.getAllOrders().
		model.addObject("orderAdmin", orderService.getAllOrders());
		
		// Return model and view to front controller class. Then front controller class
		// will link the object(orderAdmin) to the view page (adminOrderPage)
		return model;
	}
	
	// This method is used to show all products.
	@RequestMapping("/adminProduct")
	public ModelAndView adminProduct() {
		ModelAndView model = new ModelAndView("adminProductPage");
		model.addObject("productAdmin", productService.getAllProducts());
		return model;
	}
	
	// This method is used to show all users.
	@RequestMapping("/adminUser")
	public ModelAndView adminAccount() {
		ModelAndView model = new ModelAndView("adminUserPage");
		model.addObject("userAdmin", userService.getAllUsers());
		return model;
	}
	
// Delete button
	
	// This method is used to delete an item from table.
	// This url has two arguments: namePage and itemId.
	// We use @PathVariable to use those arguments.
	@RequestMapping("/adminDelete/{namePage}/{itemId}")
	public ModelAndView adminDelete(@PathVariable("namePage") namePageEnum namePage, @PathVariable("itemId") int itemId) {
		ModelAndView model = new ModelAndView("adminDeleteSuccessPage");
		switch (namePage){
			case product:
				// If the first argument is product, delete a product.
				productService.deleteProduct(itemId);
				break;
			case order:
				// If the first argument is order, delete an order.
				orderService.deleteOrder(itemId);
				break;
			case user:
				// If the first argument is user, delete a user.
				userService.deleteUser(itemId);
				break;
			default:
				break;
		}
		
		// send name and id of the item to adminDeletePage.
		model.addObject("name", namePage);
		model.addObject("itemId", itemId);
		return model;
	}
	
// Add button
	
	// This method is used to open product form.
	@RequestMapping(value="/adminProductForm", method = RequestMethod.GET)
	public ModelAndView adminProductForm() {
		ModelAndView model = new ModelAndView("adminProductFormPage");
		return model;
	}
	
	// This method is used to add an item by receiving it's detail from the form.
	// @ModelAttribute is to receive all detail from the form. We don't have to create
	// new instant of Product class nor binding(model.addObject).
	@RequestMapping(value="/adminAddSuccess", method = RequestMethod.POST)
	public ModelAndView adminAddSuccess(@ModelAttribute("product1") Product product1){
		ModelAndView model = new ModelAndView("adminAddSuccessPage");
		//productService.saveProduct(product1); This should work, but it doesn't
		return model;
	}
	
// Edit button
	
	// This method is used to edit a product.
	@RequestMapping(value="/adminProductEdit/{id}", method = RequestMethod.GET)
	public ModelAndView adminProductEdit(@PathVariable("id") long id) {
		ModelAndView model = new ModelAndView("adminProductEditPage");
		model.addObject("id", id);		
		return model;
	}
	
	// This method is used to edit an item.
	@RequestMapping(value="/adminEditSuccess", method = RequestMethod.POST)
	public ModelAndView adminEditSuccess(@RequestParam("id") long id,
			@RequestParam("name") String name,
			@RequestParam("price") Double price,
			@RequestParam("description") String description,
			@RequestParam("categoryId") long categoryId,
			@RequestParam("image") String image){
		ModelAndView model = new ModelAndView("adminEditSuccessPage");
		Product product1 = new Product();
		product1.setId(id);
		product1.setName(name);
		product1.setPrice(price);
		product1.setDescription(description);
		product1.setCategoryId(categoryId);
		product1.setImage(image);
		productService.saveProduct(product1); 
		model.addObject("product1", product1);	
		return model;
	}
	
// Search button
	
	// This method is used to search an item by id.
	@RequestMapping("/adminSearch/{namePage}")
	public ModelAndView adminSearch(@PathVariable("namePage") namePageEnum namePage, @RequestParam("id") long id) {
		ModelAndView model; 
		Object item;
		int id2 = (int) id;
		switch (namePage){
		case product:
			model = new ModelAndView("adminSearchProductPage");
			item = productService.getProductById(id);
			model.addObject("product", (IProduct)item);
			break;
		case order:
			model = new ModelAndView("adminSearchOrderPage");
			item = orderService.findById(id2);
			model.addObject("order", (IOrder)item);
			break;
		case user:
			model = new ModelAndView("adminSearchUserPage");
			item = userService.getUserById(id);
			model.addObject("user", (IUser)item);
			break;
		default:
			model = new ModelAndView("no");
			break;
	}	
		return model;
	}
}
