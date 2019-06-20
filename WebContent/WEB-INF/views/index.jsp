<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/materia/bootstrap.min.css">

<title>Login</title>
</head>
<body>
	<div class="content-fluid d-flex justify-content-center align-items-center" style="height:100vh">
		<div class="w-50">
			<h2 style="text-align:center">Log in</h2>
			<form:form action="${pageContext.request.contextPath}/login" method="POST" modelAttribute="user">
				<c:if test="${badcredentials}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>Lo sentimos! </strong> sus credenciales son invalidas.
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<div class="form-group">
					<label>Usuario:</label>
					<form:input path="user" type="text" class="form-control" />
				</div>
				<div class="form-group">
					<label>Contraseña:</label>
					<form:input path="password" type="password" class="form-control"/>
				</div>
				<div class="form-group">
					<input type="submit" value="Login" class="btn btn-success" />
				</div>
			</form:form>
		</div>
	</div>
</body>
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