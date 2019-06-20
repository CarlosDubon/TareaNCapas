package com.uca.capas.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Entity(name = "sucursal")
public class Sucursal {
	@Id
	@GeneratedValue(generator="sucursal_codigo_seq",strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_codigo_seq", sequenceName = "public.sucursal_codigo_seq",allocationSize = 1)
	@Column(name="codigo")
	Integer id;
	@NotEmpty(message = "Por favor seleccione un nombre")
	@Column(name="nombre")
	String name;
	@NotEmpty(message = "Por favor seleccione una ubicacion")
	@Column(name="ubicacion")
	String location;
	@NotEmpty(message = "Por favor seleccione una hora de inicio")
	@Column(name="horario_apertura")
	String openS;
	@Column(name="nmesas")
	@Min(value = 1,message = "Por favor seleccione un valor arriba de 1")
	Integer nMesas;
	@Column(name="nomgerente")
	@NotEmpty(message = "Por favor seleccione un gerente")
	String nameSupport;
	@Column(name="horario_cierre")
	@NotEmpty(message = "Por favor seleccione una hora de cierre")
	String closeS;
	@OneToMany(mappedBy = "sucursal",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	List<Empleado> empleados;
	public Sucursal(Integer id, String name, String location, String openS, Integer nMesas, String nameSupport,
			String closeS, List<Empleado> empleados) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.openS = openS;
		this.nMesas = nMesas;
		this.nameSupport = nameSupport;
		this.closeS = closeS;
		this.empleados = empleados;
	}
	public Sucursal() {
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOpenS() {
		return openS;
	}
	public void setOpenS(String openS) {
		this.openS = openS;
	}
	public Integer getnMesas() {
		return nMesas;
	}
	public void setnMesas(Integer nMesas) {
		this.nMesas = nMesas;
	}
	public String getNameSupport() {
		return nameSupport;
	}
	public void setNameSupport(String nameSupport) {
		this.nameSupport = nameSupport;
	}
	public String getCloseS() {
		return closeS;
	}
	public void setCloseS(String closeS) {
		this.closeS = closeS;
	}
	public List<Empleado> getEmpleados() {
		return empleados;
	}
	public void setEmpleados(List<Empleado> empleados) {
		this.empleados = empleados;
	}

	
}
