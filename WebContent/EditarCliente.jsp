<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Alterar País</title>

            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
        </head>

        <body>
                <!-- Barra superior com os menus de navegação -->
				<c:import url="Menu.jsp"/>
                <!-- Container Principal -->
                <div id="main" class="container">
                    <h3 class="page-header">Alterar Cliente #${cliente.id }</h3>
                    <!-- Formulario para alteração de clientes -->
                    <form action="controller.do" method="post">
                        <!-- area de campos do form -->
                        <input type="hidden" name="id" value="${cliente.id }" />
                        <div class="row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Completo</label> <input type="text"
						class="form-control" name="nome" id="nome"
						 placeholder="Nome Completo" required value="${cliente.nome }">
				</div>
				<div class="form-group col-md-6">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" name="email" id="email"  placeholder="E-mail" required value="${cliente.email }">
                </div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="senha">Senha</label> <input type="password"
						class="form-control" name="senha" id="senha"
						 placeholder="Insera uma senha para usar quando for fazer login" required value="${cliente.senha }">
				</div>
				<div class="form-group col-md-3">
					<label for="senha">Confirme sua Senha</label> <input type="password"
						class="form-control" name="senha" id="confirma_senha"
						 placeholder="Insera a senha novamente" required value="${cliente.senha }">
				</div>
				<div class="form-group col-md-6">
					<label for="cpf">CPF</label> <input type="text"
						class="form-control" name="cpf" id="cpf"
						 placeholder="Insira seu CPF sem o - " required value="${cliente.cpf }">
				</div>
				<div class="form-group col-md-12">
					<label for="obs">Observação</label> <input type="text"
						class="form-control" name="obs" id="obs"
						 placeholder="Adicione uma observação sobre o cliente" required value="${cliente.obs }">
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-warning" name="command"
						value="AlterarCliente">Salvar!</button>
					<a href="ListarClientes.jsp" class="btn btn-default" style = "color: #f1faee" >Voltar</a>
				</div>
			</div>
		</form>
		
	</div>

</body>
</html>