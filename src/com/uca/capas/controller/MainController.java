package com.uca.capas.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.User;



@Controller
public class MainController {
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("badcredentials", false);
		mav.addObject("user", new User());
		return mav;
	}
	
}