package com.estoremvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.estore.domain.product.*;
 
@Controller
public class HomeController {
	@RequestMapping(value={"/", "/products"})
    public ModelAndView home() {
		//test connecting to JPA project to get current project and send data to the view to display
		ProductService productService = new ProductService();
		
		//get all products
		List<IProduct> resultList = productService.getAllProducts();
		
		//return view and pass products to view
		return new ModelAndView("index", "products", resultList);
    }
 
}
