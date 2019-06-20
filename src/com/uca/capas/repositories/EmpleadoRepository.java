package com.uca.capas.repositories;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.capas.domain.Empleado;

public interface EmpleadoRepository extends JpaRepository<Empleado, Integer>{
	@Query(nativeQuery = true,value = "DELETE FROM empleado WHERE codigo = :codigo")
	Integer deleteEmployee(@Param("codigo") Integer id) throws DataAccessException;
	Empleado findOneById(Integer id) throws DataAccessException;
}
