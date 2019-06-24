package com.uca.capas.controller;

import javax.validation.Valid;

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
		try {
			sucursalService.deleteById(id);
			mav.addObject("alertType", "success");
			mav.addObject("alertMessage", "La sucursal se elimino correctamente.");
		}catch(DataAccessException e) {
			mav.addObject("alertType", "danger");
			mav.addObject("alertMessage", "Un error inesperado ocurrio, por favor intentalo de nuevo");
		}
		mav.addObject("sucursales", sucursalService.findAll());
		mav.addObject("sucursal",new Sucursal());
		return mav;
	}
	
	@RequestMapping("/addSucursal")
	public ModelAndView saveSucursal(@ModelAttribute @Valid Sucursal sucursal, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("dashboard"); 
		System.out.println(bindingResult.hasErrors());

		if(!bindingResult.hasErrors()) {
			Sucursal s = null;
			try {
				s = sucursalService.save(sucursal);
				mav.addObject("alertType", "success");
				mav.addObject("alertMessage", "La sucursal se agrego correctamente.");
			}catch(DataAccessException e) {
				mav.addObject("alertType", "danger");
			}finally {
				if(s!=null) {
					mav.addObject("sucursal",new Sucursal());
				}else {
					mav.addObject("sucursal",sucursal);
				}
				mav.addObject("sucursales", sucursalService.findAll());
			}
		}else {
			mav.addObject("alertType", "warning");
			mav.addObject("alertMessage", "No se añadio la sucursal, por favor verficar los campos");
			mav.addObject("sucursal",new Sucursal());
			mav.addObject("sucursales", sucursalService.findAll());
			mav.addObject("validMessage","Existen campos vacios");
		}
		return mav;
	}
	@RequestMapping("/sucursal/{id}")
	public ModelAndView getSucursal(@PathVariable("id")Integer id) {
		ModelAndView mav = new ModelAndView("sucursal");
		mav.addObject("firstTime", true);
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
			mav.addObject("alertType", "success");
			mav.addObject("alertMessage", "El empleado se elimino correctamente.");
		}catch(DataAccessException ex) {
			mav.addObject("alertType", "danger");
			mav.addObject("alertMessage", "Un error inesperado ocurrio, por favor intentalo de nuevo");
		}
		mav.addObject("sucursal", sucursalService.findById(idSucursal));
		mav.addObject("empleado", new Empleado());
		return mav;
	}
	@RequestMapping("/addEmpleado/{idSucursal}")
	public ModelAndView addEmpleado(@ModelAttribute @Valid Empleado empleado, @PathVariable("idSucursal")Integer id, BindingResult result) {
		ModelAndView mav = new ModelAndView("sucursal"); 
		empleado.setSucursal(sucursalService.findById(id));
		if(!result.hasErrors()) {
			empleadoService.save(empleado);
			mav.addObject("empleado", new Empleado());
			mav.addObject("alertType", "success");
			mav.addObject("alertMessage", "El empleado se elimino correctamente.");
		}else {
			mav.addObject("validMessage", "Existen campos icorrectos");
			mav.addObject("alertMessage", "No se añadio el cliente, por favor verficar los campos");
			mav.addObject("sucursal",new Sucursal());
		}
		mav.addObject("sucursal", sucursalService.findById(id));
		return mav;
	}
	@RequestMapping("/editEmpleado/{idEmpleado}")
	public ModelAndView addEmpleado(@PathVariable("idEmpleado")Integer idEmpleado) {
		ModelAndView mav = new ModelAndView("editEmployee");
		mav.addObject("empleado",empleadoService.findById(idEmpleado));
		return mav;
	}
}
