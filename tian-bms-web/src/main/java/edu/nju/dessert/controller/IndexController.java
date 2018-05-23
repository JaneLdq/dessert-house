package edu.nju.dessert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.service.DessertService;

@Controller
@RequestMapping(value="")
public class IndexController {

	@RequestMapping(value="/")
	public String index(ModelMap model){
		return "/backend/login_internal";
	}
	
}
