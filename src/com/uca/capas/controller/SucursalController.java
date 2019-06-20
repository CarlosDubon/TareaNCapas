package com.uca.capas.controller;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.repositories.EmpleadoRepository;
import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;


@Controller
public class SucursalController {
	@Autowired
	private SucursalService sucursalService;
	
	@Autowired
	private EmpleadoService empleadoService;
	
	@RequestMapping("/DeteleSucursal/{id}")
	public ModelAndView deleteSucursal(@PathVariable("id")Integer id) {
		ModelAndView mav = new ModelAndView("dashboard");
		sucursalService.deleteById(id);
		mav.addObject("sucursales", sucursalService.findAll());
		mav.addObject("sucursal",new Sucursal());
		return mav;
	}
	
	@RequestMapping("/addSucursal")
	public ModelAndView saveSucursal(@ModelAttribute Sucursal sucursal, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("dashboard"); 
		if(bindingResult.hasErrors()) {
			Sucursal s = null;
			try {
				s = sucursalService.save(sucursal);
			}catch(DataAccessException e) {
				
			}finally {
				if(s!=null) {
					mav.addObject("sucursal",new Sucursal());
				}else {
					mav.addObject("sucursal",sucursal);
				}
				mav.addObject("sucursales", sucursalService.findAll());
			}
		}else {
			mav.addObject("sucursal",new Sucursal());
			mav.addObject("sucursales", sucursalService.findAll());
			mav.addObject("validMessage","Existen campos vacios");
		}
		return mav;
	}
	@RequestMapping("/sucursal/{id}")
	public ModelAndView getSucursal(@PathVariable("id")Integer id) {
		ModelAndView mav = new ModelAndView("sucursal");
		mav.addObject("empleado", new Empleado());
		mav.addObject("sucursal", sucursalService.findById(id));
		return mav;
	}
	@RequestMapping("/deleteEmpleado/{idSucursal}/{idEmpleado}")
	public ModelAndView deleteEmpleado(@PathVariable("idEmpleado") Integer idEmpleado, @PathVariable("idSucursal") Integer idSucursal) {
		ModelAndView mav = new ModelAndView("sucursal");
		System.out.println("El siguiente es el query para delete "+idEmpleado);
		try {
			empleadoService.deleteEmpleadoById(idEmpleado);
		}catch(DataAccessException ex) {
			
		}
		mav.addObject("sucursal", sucursalService.findById(idSucursal));
		mav.addObject("empleado", new Empleado());
		return mav;
	}
	@RequestMapping("/addEmpleado/{idSucursal}")
	public ModelAndView addEmpleado(@ModelAttribute Empleado empleado, @PathVariable("idSucursal")Integer id, BindingResult result) {
		ModelAndView mav = new ModelAndView("dashboard"); 
		empleado.setSucursal(sucursalService.findById(id));
		if(result.hasErrors()) {
			empleadoService.save(empleado);
		}else {
			mav.addObject("validMessage", "Existen campos icorrectos");
		}
		mav.addObject("sucursal", new Sucursal());
		mav.addObject("sucursales", sucursalService.findAll());
		return mav;
	}
	@RequestMapping("/editEmpleado/{idEmpleado}")
	public ModelAndView addEmpleado(@PathVariable("idEmpleado")Integer idEmpleado) {
		ModelAndView mav = new ModelAndView("editEmployee");
		mav.addObject("empleado",empleadoService.findById(idEmpleado));
		return mav;
	}
}
