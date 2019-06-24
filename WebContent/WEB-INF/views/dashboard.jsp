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
<title>Dashboard</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">Rustico</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor02" aria-controls="navbarColor02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor02">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
					<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
					</li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<ul class="navbar-nav mr-auto">
						<li >
							<a class="nav-link" href="${pageContext.request.contextPath}/">Cerrar sesión <i class="fas fa-sign-out-alt"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container-fluid">
		<div class="d-flex align-items-center flex-column mt-3"">
			<h2>Bienvenido usuario Administrador</h2>
			<h3>Todas las sucursales</h3>
			<c:if test="${!firstTime}">
				<div class="alert alert-${alertType} alert-dismissible fade show"
					role="alert">
					${alertMessage}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<div class="d-flex flex-wrap w-75 m-3 justify-content-around">
				<c:forEach items="${sucursales}" var="s">
					<div class="card text-white bg-primary w-25 m-3">
						<div class="card-header d-flex justify-content-between">
							${s.nameSupport}
							<div>
								<i class="fas fa-cog mr-3" onClick="findSucursal(${s.id})" style="cursor: pointer"></i> 
								<i class="fas fa-times" onClick="handleDelete(${s.id})"  style="cursor: pointer"></i>
							</div>
						</div>
						<div class="card-body">
							<h4 class="card-title">${s.name}</h4>
							<p class="card-text">Todos los dias de: ${s.openS} -
								${s.closeS}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<a class="btn btn-success floating-btn" data-toggle="modal"
			data-target="#new-sucursal-modal"> <i class="fas fa-plus white"></i>
		</a>
	</div>
	<div id="new-sucursal-modal" class="modal" tabindex="-1" role="dialog">
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
	function handleDelete(id){
		window.location = "${pageContext.request.contextPath}/DeteleSucursal/"+id
	}
	function findSucursal(id){
		window.location = "${pageContext.request.contextPath}/sucursal/"+id
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