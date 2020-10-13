<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Administrador</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<c:import url="Menu.jsp" />
	
	<div id="main" class="container">
		<h3 class="page-header">Faça seu login, administrador</h3>
		<form action="controller.do" method="post">
		
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-6">
					<label for="email">E-mail</label> <input type="email"
						class="form-control" name="email" id="email" placeholder="E-mail"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="senha">Senha</label> <input type="password"
						class="form-control" name="senha" id="senha"
						placeholder="Insera sua senha"
						required>
				</div>
			</div>
			<hr>
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-warning" name="command"
						value="LoginAdm">Ok!</button>
					<a href="Home.jsp" class="btn btn-default" style = "color: #f1faee">Cancelar</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>