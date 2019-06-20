package com.uca.capas.repositories;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.capas.domain.Sucursal;

public interface SucursalRepository extends JpaRepository<Sucursal, Integer>{
	Sucursal findOneById(Integer id) throws DataAccessException;
	
	//@Query("DELETE FROM sucursal WHERE codigo=:codigo")
	//void deleteById(@Param("codigo")Integer id) throws DataAccessException;
}
