package com.estoremvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.support.PagedListHolder;

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
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		pagedListHolder.setPage(0);
		int pageSize = 6;
		pagedListHolder.setPageSize(pageSize);
		model.addObject("pagedProducts", pagedListHolder);
		model.addObject("categoryName", "All Products");
		model.addObject("catId","all");
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
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		pagedListHolder.setPage(0);
		int pageSize = 6;
		pagedListHolder.setPageSize(pageSize);
		model.addObject("pagedProducts", pagedListHolder);
		
		//get category name
		IProductCategoryService catService = new ProductCategoryService();
		IProductCategory cat = catService.getCategoryById(catId);
		model.addObject("categoryName", cat.getName());
		model.addObject("catId",categoryId);
		return model;
    }
	
	//method for handling paging ajax requests for products
	@RequestMapping(value={"/products/{categoryId}/getPage/{pageNumber}"})
    public ModelAndView productsByPage(HttpServletRequest request, @PathVariable String pageNumber, @PathVariable String categoryId) {
		ModelAndView model = new ModelAndView("productListPartial");
		IProductService productService = new ProductService();
		int pageNum = Integer.parseInt(pageNumber) - 1;
		
		//check if request is for all products then get PagedList for proper page and category
		//return HTML for partial view to be inserted into page via AJAX
		if(categoryId.equals("all")) {
			List<IProduct> products = productService.getAllProducts();
			PagedListHolder pagedListHolder = new PagedListHolder(products);
			pagedListHolder.setPage(pageNum);
			int pageSize = 6;
			pagedListHolder.setPageSize(pageSize);
			model.addObject("pagedProducts", pagedListHolder);
		} else {
			Long catId = Long.parseLong(categoryId);
			//get all products for category
			List<IProduct> products = productService.getProductsByCategory(catId);
			PagedListHolder pagedListHolder = new PagedListHolder(products);
			pagedListHolder.setPage(pageNum);
			int pageSize = 6;
			pagedListHolder.setPageSize(pageSize);
			model.addObject("pagedProducts", pagedListHolder);
		}
		return model;
    }
}
