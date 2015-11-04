package com.estoremvc.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estore.domain.product.*;

@Controller
public class ProductController {
	//get product by ID and display single product info
	@RequestMapping("/product/{productId}")
	public ModelAndView displayProduct(HttpServletRequest request, @PathVariable String productId){
		ModelAndView model = new ModelAndView("product");
		Long prodId = Long.parseLong(productId);
		IProductService productService = new ProductService();
		IProduct product = productService.getProductById(prodId);
		if (product != null){
			model.addObject("product", product);
		}
		
		return model;
	}

}
