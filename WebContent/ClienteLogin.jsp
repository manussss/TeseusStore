<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<%
		Cliente cliente = (Cliente) request.getAttribute("cliente");
	%>
	<c:import url="Menu.jsp" />
	<hr>

	<div id="main" class="container">
		<h3 class="page-header">Faça seu login.</h3>
		<form action="ManterCliente.do" method="post">
			<div class="row">
				<div class="form-group col-md-6">
					<label for="email">Email</label> <input type="text" required
						class="form-control" name="email" id="email" maxlength="30"
						placeholder="Email" /> <label for="pass">Senha</label> <input
						type="password" class="form-control" id="pass" name="password"
						placeholder="Senha" required> <br> <a
						href="EsqueciMinhaSenha.jsp">Esqueci minha senha</a> <a
						class="dropdown-item" href="ClienteCadastro.jsp">Novo por
						aqui? Faça seu cadastro!</a><br>


					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="dropdownCheck">
						<label class="form-check-label" for="dropdownCheck">Lembrar-me
						</label>
					</div>
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="md-col-12">
					<button type="submit" class="btn btn-primary" name="acao"
						value="Criar">
						<span class="glyphicon glyphicon-upload"></span>Fazer Login
					</button>

					<a href="index.html" class="btn btn-
	default"><span
						class="glyphicon glyphicon-remove"></span>Cancelar</a>

				</div>
			</div>
		</form>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>

