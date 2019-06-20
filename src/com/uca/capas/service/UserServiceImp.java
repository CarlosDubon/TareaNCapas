package com.uca.capas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.User;
import com.uca.capas.repositories.UserRepository;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public boolean login(String user, String password) throws DataAccessException {
		User u = userRepository.findOneByUserAndPassword(user,password); 
		if(u!=null) {
			return true;
		}
		return false;
	}

}
