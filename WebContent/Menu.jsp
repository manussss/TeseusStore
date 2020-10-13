<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Menu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<style>
p {
color: #f1faee;
}
th {
color: #f1faee;
}
label {
color: #f1faee;
}
h3 {
	color: #f1faee;
}

h2 {
	color: #f1faee;
}

a {
	color: #f1faee;
}

h1 {
	font-family: "Freestyle Script";
	color: orange;
	font-size: 70px;
}

li {
	padding-right: 15px;
}

/* Estilo do Menu */
nav.navbar {
	font-size: 14px;
}
</style>
<style>
/*Estilo da Barra de Pesquisa */
body {
	font-family: Arial;
	background-color: #04191C;
}

* {
	box-sizing: border-box;
}

div.busca input[type=text] {
	padding: 16px;
	font-size: 16px;
	border: 1px solid grey;
	float: left;
	width: 650px;
	background: #f1f1f1;
}

div.busca button {
	float: left;
	background: #FF8800;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1 align="center" class="font-weight-bolder">Teseus Store</h1>

	<nav class="navbar navbar-expand-sm navbar-dark"
		style="background-color: #04191C">
		<!-- Logo Com foto -->
		<a class="navbar-brand" href="Home.jsp"> <img src="img/logo.png"
			alt="logo" width="45">
		</a>

		<!-- Links No Menu de Acesso a outras Páginas -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="btn btn-outline-warning btn-lg"
				href="Carrinho.jsp">Carrinho</a></li>
			<c:if test="${empty logado }">
				<li class="nav-item"><a class="btn btn-outline-warning btn-lg"
					href="CadastroCliente.jsp">Cadastro</a></li>
			</c:if>
			<!-- Menu Dropdown da Conta -->
			<li class="nav-item dropdown"><a
				class="btn btn-outline-warning btn-lg dropdown-toggle" href="#"
				id="navbardrop" data-toggle="dropdown">Gerenciar</a>
				<div class="dropdown-menu">
					<c:if test="${empty logado }">
						<H5>
							<a class="dropdown-item" href="Login.jsp"> <font
								color="black" face="Comic Sans MS" size="2">Faça seu
									login</font></a>
						</H5>
					</c:if>
					<c:if test="${not empty logado }">
						<H5>
							<a class="dropdown-item" href="CadastroEndereco.jsp"> <font
								color="black" face="Comic Sans MS" size="2">Cadastrar
									endereço</font></a>
						</H5>
						<H5>
							<a class="dropdown-item" href="VisualizarEndereco.jsp"> <font
								color="black" face="Comic Sans MS" size="2">Lista de
									endereços</font></a>
						</H5>
					</c:if>
					<c:if test="${not empty logadoAdm }">
						<H5>
							<a class="dropdown-item" href="ListarClientes.jsp"> <font
								color="black" face="Comic Sans MS" size="2">Editar
									Clientes</font></a>
						</H5>
						<H5>
							<a class="dropdown-item" href="#"> <font color="black"
								face="Comic Sans MS" size="2">Editar Endereços</font></a>
						</H5>
					</c:if>
				</div></li>
			<c:if test="${not empty logadoAdm }">
				<li class="nav-item dropdown"><a
					class="btn btn-outline-warning btn-lg dropdown-toggle" href="#"
					id="navbardrop" data-toggle="dropdown">Produtos </a>
					<div class="dropdown-menu">
						<h5>
							<a class="dropdown-item" href="CadastroProduto.jsp"> <font
								color="black" face="Comic Sans MS" size="2">Cadastrar
									Produtos</font></a>
						</h5>
						<H5>
							<a class="dropdown-item" href="testealterar.jsp"> <font color="black"
								face="Comic Sans MS" size="2">Editar Produtos</font></a>
						</H5>
					</div></li>
			</c:if>
			<li class="nav-item"><a class="btn btn-outline-warning btn-lg"
				href="MonteSeuPc.jsp">Monte seu PC</a></li>
		</ul>


		<!-- Barra de Pesquisa -->
		<form action="controller.do" method="post">
			<div class="col-md-8">
				<div class="busca input-group h10">
					<input name="data[search]" class="form-control mr-2" id="search"
						type="text" placeholder="Pesquisar produtos"> <span
						class="input-group-btn">
						<button class="btn btn-primary" type="submit" name="command"
							value="ListarProduto">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</form>
		<c:if test="${not empty logado}">
			<ul class="navbar-nav navbar-right">
				<li class="nav-item"><a class="btn btn-outline-warning btn-lg"
					href="controller.do?command=EfetuarLogoff">Sair</a></li>
			</ul>
		</c:if>
		<c:if test="${not empty logadoAdm}">
			<ul class="navbar-nav navbar-right">
				<li class="nav-item"><a class="btn btn-outline-warning btn-lg"
					href="controller.do?command=LogoffAdm">Sair</a></li>
			</ul>
		</c:if>
	</nav>
</body>
</html>
