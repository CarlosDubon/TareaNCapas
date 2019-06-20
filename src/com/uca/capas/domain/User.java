package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity(name = "usuario")
public class User {
	@Column(name = "usuario")
	@Id
	String user;
	@Column(name = "clave")
	String password;
	
	public User() {
		
	}
	
	public User(String usuario, String clave) {
		super();
		this.user = usuario;
		this.password = clave;
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String usuario) {
		this.user = usuario;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String clave) {
		this.password = clave;
	}
	
	

}
