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

		<h2>${empleado.name}</h2>

		<form:form
			action="${pageContext.request.contextPath}/addEmpleado/${empleado.sucursal.id}"
			method="POST" modelAttribute="empleado">
			<form:input path="id" type="hidden" />
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
			</div>

		</form:form>
	</div>

</body>


</html>