<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro de Produtos</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Cadastre um produto novo aqui!</h3>
		<!-- Formulario para inclusao de produtos -->
		<form action="controller.do" method="post">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-6">
					<label for="nome">Nome</label> <input type="text"
						class="form-control" name="nome" id="nome" required
						maxlength="100" placeholder="nome produto">
				</div>
				<div class="form-group col-md-6">
                    <label for="preco">R$</label>
                    <input type="number" class="form-control" name="preco" id="preco"  placeholder="00,00">
                </div>
			</div>
			<div class="row">
			<div class="form-group col-md-6">
				<label for="categoria">Escolha uma categoria</label> <select
					class="form-control" name = "categoria" id="categoria" >
					<option></option>
					<option>Teclado</option>
					<option>Mouse</option>
					<option>Monitor</option>
					<option>Memória RAM</option>
					<option>Placa-mãe</option>
					<option>Placa de vídeo</option>
					<option>Cooler</option>
					<option>Processador</option>
					<option>Gabinete</option>
					<option>Fonte</option>
					<option>HD</option>
					<option>SSD</option>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="marca">Escolha uma marca</label> <select
					class="form-control" name = "marca" id="marca">
					<option></option>
					<option>Samsung</option>
					<option>Intel</option>
					<option>Acer</option>
					<option>Asus</option>
					<option>Aerocool</option>
					<option>Gigabyte</option>
					<option>LG</option>
					<option>HyperX</option>
					<option>Kingston</option>
					<option>Seagate</option>
					<option>AMD</option>
				</select>
			</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="estoque">Quantidade Estoque</label> <input type="number"
						class="form-control" name="estoque" id="estoque"
						 placeholder="">
				</div>
				<div class="form-group col-md-6">
					<label for="obs">Observação</label> <input type="text"
						class="form-control" name="obs" id="obs"
						 placeholder="Caso precise,adicione algum detalhe sobre o produto">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-10">
					<label for="link">Link</label> <input type="text"
						class="form-control" name="link" id="link" required
						 placeholder="Insira o link aqui trocando o 'open' por 'uc'">
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-primary" name="command"
						value="CriarProduto">Cadastrar Produto</button>
					<a href="index.jsp" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>