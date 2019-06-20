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
		<div>
			<h2 style="text-align:center">Log in</h2>
			<form:form action="${pageContext.request.contextPath}/login" method="POST" modelAttribute="user">
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
</html>