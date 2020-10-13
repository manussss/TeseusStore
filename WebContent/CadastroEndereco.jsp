<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastrar Endereço</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Cadastre seu endereço aqui!</h3>
		<!-- Formulario para inclusao de endereço -->
		<form action="controller.do" method="post">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-6">
					<label for="cep">CEP</label> <input type="text"
						class="form-control" name="cep" id="cep" maxlength="9"
						onblur="pesquisacep(cep)" placeholder="CEP">
				</div>
				<div class="form-group col-md-6">
                    <label for="rua">Rua</label>
                    <input type="text" class="form-control" name="rua" id="rua"  placeholder="Rua">
                </div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="comp">Complemento</label> <input type="text"
						class="form-control" name="comp" id="comp"
						 placeholder="Casa/Apartamento">
				</div>
				<div class="form-group col-md-6">
					<label for="bairro">Bairro</label> <input type="text"
						class="form-control" name="bairro" id="bairro"
						 placeholder="Bairro">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="cidade">Cidade</label> <input type="text"
						class="form-control" name="cidade" id="cidade"
						 placeholder="Cidade">
				</div>
				<div class="form-group col-md-6">
                    <label for="uf">UF</label>
                    <input type="text" class="form-control" name="uf" id="uf"  placeholder="Rua">
                </div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="num">Número</label> <input type="text"
						class="form-control" name="num" id="num"
						 placeholder="Número da risidência">
				</div>
				<div class="form-group col-md-6">
					<label for="tel">Telefone</label> <input type="number"
						class="form-control" name="tel" id="tel"
						 placeholder="Telefone Celular">
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-warning" name="command"
						value="CriarEndereco">Cadastrar Endereço</button>
					<a href="Home.jsp" class="btn btn-default" style = "color: #f1faee">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script>
		function limpa_formulário_cep() {
			//Limpa valores do formulário de cep.
			document.getElementById('rua').value = ('');
			document.getElementById('bairro').value = ('');
			document.getElementById('cidade').value = ('');
			document.getElementById('uf').value = ('');
		}

		function meu_callback(conteudo) {
			if (!('erro' in conteudo)) {
				//Atualiza os campos com os valores.
				document.getElementById('rua').value = (conteudo.logradouro);
				document.getElementById('bairro').value = (conteudo.bairro);
				document.getElementById('cidade').value = (conteudo.localidade);
				document.getElementById('uf').value = (conteudo.uf);
			} //end if.
			else {
				//CEP não Encontrado.
				limpa_formulário_cep();
				alert('CEP não encontrado.');
			}
		}

		function pesquisacep(valor) {

			var cep = valor.value.replace(/\D/g, '');

			//Verifica se campo cep possui valor informado.
			if (cep != '') {

				//Expressão regular para validar o CEP.
				var validacep = /^[0-9]{8}$/;

				//Valida o formato do CEP.
				if (validacep.test(cep)) {

					//Preenche os campos com '...' enquanto consulta webservice.
					document.getElementById('rua').value = '...';
					document.getElementById('bairro').value = '...';
					document.getElementById('cidade').value = '...';
					document.getElementById('uf').value = '...';

					//Cria um elemento javascript.
					var script = document.createElement('script');
					//document.write(cep);

					//Sincroniza com o callback.
					script.src = 'https://viacep.com.br/ws/' + cep
							+ '/json/?callback=meu_callback';

					//Insere script no documento e carrega o conteúdo.
					document.body.appendChild(script);

				} //end if.
				else {
					//cep é inválido.
					limpa_formulário_cep();
					alert('Formato de CEP inválido.');
				}
			} //end if.
			else {
				//cep sem valor, limpa formulário.
				limpa_formulário_cep();
			}
		};
	</script>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>