package com.uca.capas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Sucursal;
import com.uca.capas.domain.User;
import com.uca.capas.service.SucursalService;
import com.uca.capas.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private SucursalService sucursalService;
	
	@RequestMapping(name="login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView();
		if(userService.login(user.getUser(), user.getPassword())) {
			mav.setViewName("dashboard");
			List<Sucursal> s = sucursalService.findAll();
			mav.addObject("badcredentials", false);
			mav.addObject("sucursales", s);
			mav.addObject("sucursal", new Sucursal());
		}else {
			mav.setViewName("index");
			mav.addObject("badcredentials", true);
		}
		return mav;
	}
}
