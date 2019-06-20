package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Entity(name="empleado")
public class Empleado {
	@Id
	@GeneratedValue(generator="empleado_codigo_seq",strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "empleando_codigo_seq", sequenceName = "public.empleado_codigo_seq",allocationSize = 1)
	@Column(name="codigo")
	Integer id;
	@Column(name="nombre")
	@NotEmpty
	String name;
	@Column(name="edad")
	@Min(value = 18)
	Integer yearsOld;
	@Column(name="genero")
	String gender;
	@Column(name="estado")
	boolean state;	
	@ManyToOne(fetch = FetchType.EAGER)
	Sucursal sucursal;
	public Empleado(Integer id, String name, Integer yearsOld, String gender, boolean state, Sucursal sucursal) {
		super();
		this.id = id;
		this.name = name;
		this.yearsOld = yearsOld;
		this.gender = gender;
		this.state = state;
		this.sucursal = sucursal;
	}
	public Empleado() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getYearsOld() {
		return yearsOld;
	}
	public void setYearsOld(Integer yearsOld) {
		this.yearsOld = yearsOld;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	public String getGenderDelegate() {
		if(this.gender.equals("F")) {
			return "Femenino";
		}
		return "Masculino";
	}
	public String getStateDelegate() {
		if(state) {
			return "Activo";
		}
		return "Inactivo";
	}
	
}
