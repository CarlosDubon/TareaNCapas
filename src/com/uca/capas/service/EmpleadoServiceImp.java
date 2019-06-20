package com.uca.capas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Empleado;
import com.uca.capas.repositories.EmpleadoRepository;

@Service
public class EmpleadoServiceImp implements EmpleadoService{

	@Autowired
	private EmpleadoRepository empleadoRepo;
	
	
	@Override
	public boolean deleteEmpleadoById(Integer id) throws DataAccessException {
		if(empleadoRepo.deleteEmployee(id)==0) {
			return false;
		}
		
		return true;
	}

	@Override
	public Empleado save(Empleado empleado) throws DataAccessException {
		return empleadoRepo.save(empleado);
	}

	@Override
	public Empleado findById(Integer id) throws DataAccessException {
		return empleadoRepo.findOneById(id);
	}

}
