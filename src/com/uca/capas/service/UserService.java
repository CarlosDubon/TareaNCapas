package com.uca.capas.service;

import org.springframework.dao.DataAccessException;

public interface UserService {
	boolean login(String user,String password) throws DataAccessException;
}
