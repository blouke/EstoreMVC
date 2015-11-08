package com.estoremvc.controller;

import java.util.List;

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
	
	//get all products
	@RequestMapping(value={"/products"})
    public ModelAndView allProducts() {
		ModelAndView model = new ModelAndView("products");
		IProductService productService = new ProductService();
		//get all products
		List<IProduct> products = productService.getAllProducts();
		model.addObject("products", products);
		model.addObject("categoryName", "All Products");
		return model;
    }
	
	//get all products by category
	@RequestMapping(value={"/category/{categoryId}"})
    public ModelAndView displayCategoryProducts(HttpServletRequest request, @PathVariable String categoryId) {
		ModelAndView model = new ModelAndView("products");
		Long catId = Long.parseLong(categoryId);
		IProductService productService = new ProductService();
		//get all products for category
		List<IProduct> products = productService.getProductsByCategory(catId);
		model.addObject("products", products);
		
		//get category name
		IProductCategoryService catService = new ProductCategoryService();
		IProductCategory cat = catService.getCategoryById(catId);
		model.addObject("categoryName", cat.getName());
		return model;
    }

}
