package com.uca.capas.repositories;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.User;

public interface UserRepository extends JpaRepository<User, String>{
	User findOneByUserAndPassword(String user, String password) throws DataAccessException;
}
