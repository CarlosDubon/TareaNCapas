<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/materia/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">

<title>${sucursal.name}</title>
</head>
<body>
	<div class="container-fluid m-3">

		<h2>${sucursal.name}</h2>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#perfil">Perfil</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#empleados">Empleados</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">Opciones</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" data-toggle="modal" data-target="#edit-sucursal-modal">Editar sucursal</a> <a
						class="dropdown-item"
						href="${pageContext.request.contextPath}/DeteleSucursal/${sucursal.id}">Eliminar
						sucursal</a>
				</div></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active show" id="perfil">
				<p>Ubicacion: ${sucursal.location}</p>
				<p>Numero de mesas: ${sucursal.nMesas}</p>
				<p>Abierto desde: ${sucursal.openS }</p>
				<p>Abierto hasta: ${sucursal.closeS }</p>
				<p>Nombre gerente: ${sucursal.nameSupport}</p>
			</div>
			<div class="tab-pane fade" id="empleados">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Nombre</th>
							<th scope="col">Edad</th>
							<th scope="col">Genero</th>
							<th scope="col">Estado</th>
							<th scope="col">Opciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sucursal.empleados }" var="e">
							<tr>
								<td>${e.name }</td>
								<td>${e.yearsOld}</td>
								<td>${e.genderDelegate }</td>
								<td>${e.stateDelegate }</td>
								<td>
									<button type="button" class="btn btn-primary" onClick="editEmployee(${e.id})">
										<i class="fas fa-pen"></i>
									</button>
									<button type="button" class="btn btn-info">
										<c:if test="${e.state}">
											<i class="fas fa-times"></i>
										</c:if>
										<c:if test="${!e.state}">
											<i class="fas fa-check"></i>
										</c:if>
									</button>
									<button type="button" class="btn btn-danger" onClick="deleteEmpleado(${sucursal.id},${e.id})">
										<i class="fas fa-trash"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a class="btn btn-success floating-btn" data-toggle="modal"
					data-target="#new-empleado-modal"> <i class="fas fa-plus white"></i>
				</a>
			</div>

		</div>
		<div id="edit-sucursal-modal" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Agregar sucursal</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form action="${pageContext.request.contextPath}/addSucursal"
							method="POST" modelAttribute="sucursal">
							<p class="text-danger">${validMessage}</p>
							<form:input path="id" type="hidden"/>
							<div class="form-group">
								<label>Nombre:</label>
								<form:input type="text" path="name" class="form-control" />
								<form:errors cssClass="text-danger" element="p" path="name"></form:errors>
							</div>
							<div class="form-group">
								<label>Ubicacion:</label>
								<form:input type="text" path="location" class="form-control" />
							</div>
							<div class="form-group">
								<label>Abierto desde:</label>
								<form:input type="time" path="openS" class="form-control" />
							</div>
							<div class="form-group">
								<label>Cerrado desde:</label>
								<form:input type="time" path="closeS" class="form-control" />
							</div>
							<div class="form-group">
								<label>Numero de mesas:</label>
								<form:input type="number" path="nMesas" class="form-control" />
							</div>
							<div class="form-group">
								<label>Nombre gerente:</label>
								<form:input type="name" path="nameSupport" class="form-control" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									changes</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div id="new-empleado-modal" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Agregar empleado</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form action="${pageContext.request.contextPath}/addEmpleado/${sucursal.id}"
							method="POST" modelAttribute="empleado">
							<form:input path="id" type="hidden"/>
							<div class="form-group">
								<label>Nombre:</label>
								<form:input type="text" path="name" class="form-control" />
							</div>
							<div class="form-group">
								<label>Edad:</label>
								<form:input type="number" path="yearsOld" class="form-control" />
							</div>
							<div class="form-group">
								<label>Genero</label>
								<form:select path="gender" class="form-control">
									<form:option value="M">Masculino</form:option>
									<form:option value="F">Femenino</form:option>
								</form:select>
							</div>
							<div class="form-group">
								<label>Estado</label>
								<form:select path="state" class="form-control">
									<form:option value="FALSE">Inactivo</form:option>
									<form:option value="TRUE">Activo</form:option>
								</form:select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									changes</button>
							</div>
							
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
.floating-btn {
	border-radius: 100%;
	position: fixed;
	bottom: 1em;
	right: 1em;
	color: #fff;
	cursor: pointer;
}

.white {
	color: #fff;
}
</style>
<script type="text/javascript">
	function deleteEmpleado(idSucursal,idEmpleado){
		window.location = "${pageContext.request.contextPath}/deleteEmpleado/"+idSucursal+"/"+idEmpleado
	}
	function editEmployee(id){
		window.location ="${pageContext.request.contextPath}/editEmpleado/"+id
	}
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</html>