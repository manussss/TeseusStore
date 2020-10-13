<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<c:import url="Menu.jsp" />

	<div id="main" class="container">
		<h3 class="page-header">Ainda não é cadastrado? Faça seu cadastro
			agora.</h3>
<form action="controller.do" method="post">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Completo</label> <input type="text"
						class="form-control" name="nome" id="nome"
						 placeholder="Nome Completo" required>
				</div>
				<div class="form-group col-md-6">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" name="email" id="email"  placeholder="E-mail" required>
                </div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="senha">Senha</label> <input type="password"
						class="form-control" name="senha" id="senha"
						 placeholder="Insera uma senha para usar quando for fazer login" required>
				</div>
				<div class="form-group col-md-3">
					<label for="senha">Confirme sua Senha</label> <input type="password"
						class="form-control" name="senha" id="confirma_senha"
						 placeholder="Insera a senha novamente" required>
				</div>
				<div class="form-group col-md-6">
					<label for="cpf">CPF</label> <input type="text"
						class="form-control" name="cpf" id="cpf"
						 placeholder="Insira seu CPF sem o - " required>
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-warning" name="command"
						value="CriarCliente">Cadastrar!</button>
					<a href="Home.jsp" class="btn btn-default" style = "color: #f1faee" >Cancelar</a>
				</div>
			</div>
		</form>
		
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	var senha = document.getElementById("senha")
	  , confirma_senha= document.getElementById("confirma_senha");

	function validarSenha(){
	  if(senha.value != confirma_senha.value) {
		  confirma_senha.setCustomValidity("Senhas não coincidem");
	  } else {
		  confirma_senha.setCustomValidity('');
	  }
	}

	senha.onchange = validarSenha;
	confirma_senha.onkeyup = validarSenha;
	</script>

</body>
</html>
