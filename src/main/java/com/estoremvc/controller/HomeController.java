package com.estoremvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.estore.domain.product.*;
 
@Controller
public class HomeController {
	@RequestMapping(value={"/"})
    public ModelAndView home() {
		ModelAndView model = new ModelAndView("index");
		//get all categories to dynamically display in site navigation
        ProductCategoryService categoryService = new ProductCategoryService();	
		//get all products
		List<IProductCategory> categories = categoryService.getAllCategories();
		model.addObject("categories", categories); 
		return model;
    }
 
}
