package com.uca.capas.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.uca.capas.domain.Sucursal;

public interface SucursalService {
	List<Sucursal> findAll() throws DataAccessException;
	boolean deleteById(Integer id) throws DataAccessException;
	Sucursal save(Sucursal sucursal) throws DataAccessException;
	Sucursal findById(Integer id) throws DataAccessException;
}
