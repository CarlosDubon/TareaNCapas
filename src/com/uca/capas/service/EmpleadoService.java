package com.uca.capas.service;

import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.Empleado;

public interface EmpleadoService {
	boolean deleteEmpleadoById(Integer id) throws DataAccessException;
	Empleado save(Empleado empleado) throws DataAccessException;
	Empleado findById(Integer id) throws DataAccessException;
}
