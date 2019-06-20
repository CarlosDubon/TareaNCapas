package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Sucursal;
import com.uca.capas.repositories.SucursalRepository;

@Service
public class SucursalServiceImp implements SucursalService{
	
	@Autowired
	private SucursalRepository sucursalRepo;
	
	@Override
	public List<Sucursal> findAll() throws DataAccessException {
		return sucursalRepo.findAll();
	}

	@Override
	public boolean deleteById(Integer id) throws DataAccessException {
		sucursalRepo.findOneById(id);
		return true;
	}
	@Override
	public Sucursal findById(Integer id) throws DataAccessException{
		return sucursalRepo.findOneById(id);
	}
	@Override
	public Sucursal save(Sucursal sucursal) throws DataAccessException {
		return sucursalRepo.save(sucursal);
	}

}
