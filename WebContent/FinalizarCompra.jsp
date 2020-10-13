<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Finalizar Compra</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
	
</style>
</head>
<body>
<c:import url="Menu.jsp" />

<form action="controller.do" method="post"><div id="main" class="container">
<p style="color: white;	font-size: 30px;"><b>Finalizar Compra</b></p>
<hr style="border-top: 1px solid white;">
	<div id="produtos">
		<p Style="color:white; font-size:22px"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Produtos do Pedido</p>
		
		<div class="panel panel-default">
			<div class="panel-body" id="produtosPanel"></div>
		</div>
		<hr style="border-top: 1px solid white;">
	</div>
	<div id="dadosPessoais">
		<p Style="color:white; font-size:22px"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> Dados Pessoais</p>
		<hr style="border-top: 1px solid white;">
		
	</div>
	<div id="enderecoEntrega">
		<p Style="color:white; font-size:22px"><span class="glyphicon glyphicon-send" aria-hidden="true"></span> Endereço de Entrega</p>
	</div>
	
	<div id="botoes">
		<div class="row">
			<div class="form-group col-md-6" style="text-align: left;">
				<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span>  Finalizar Compra</button>
				<a href="Home.jsp" class="btn btn-default" onclick="localStorage.clear()" style="color: white">Cancelar</a>
			</div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript">

	var total = 0; // variável que retorna o valor total dos produtos que estão na LocalStorage.
	  var i = 0;
	  var valor = 0; // variável que irá receber o preço do produto convertido em Float.
	  for(i=1; i<=99; i++) // verifica até 99 produtos registrados na localStorage
	  {
		  var prod = localStorage.getItem("produto" + i + "");  
			 if(prod != null) 
			 {		
				  /*criando botoes
				  var aumentar = document.createElement("BUTTON");
				  var diminuir = document.createElement("BUTTON");
				  var excluir = document.createElement("BUTTON");
				  var id = localStorage.getItem("posicao" + i); */
				  
				  
				 // exibe os dados da lista dentro da div itens
				 var qtd=localStorage.getItem("qtd" + i)
				 var precoTotal=(parseFloat(localStorage.getItem("valor" + i)) * parseFloat(qtd))
				 document.getElementById("produtosPanel").innerHTML += qtd + " x ";
				 document.getElementById("produtosPanel").innerHTML += localStorage.getItem("produto" + i);
				 document.getElementById("produtosPanel").innerHTML += " R$: " + (precoTotal) + "  ";
				 document.getElementById("produtosPanel").innerHTML += "<hr>";
				 // calculando valor total
				 valor = parseFloat(precoTotal); // valor convertido com o parseFloat()
				 total = (total + valor ); // arredonda para 2 casas decimais com o .toFixed(2)
	 	 }
	  }
	  if (total == 0){
		//caso o carrinho estiver vazio (valor total=0), escreve "carrinho vazio"
		document.getElementById("produtosPanel").innerHTML +="Seu carrinho está vazio!";
		document.getElementById("produtosPanel").innerHTML += " ";
	  }
	  else{
		  //salva o total no localStorage
		  localStorage.setItem("total", total.toFixed(2));
		  // exibe o total dos produtos
		  document.getElementById("produtosPanel").innerHTML +="Total: <b>R$:" + total.toFixed(2) + "</b>"; 
		  document.getElementById("produtosPanel").innerHTML +="<br>Forma de Pagamento Selecionada: " + "<b>" +localStorage.getItem("pagamento") + "</b>";
		  
	  }
	  document.getElementById("finalizar").innerHTML +=
		"<input type='hidden' class='form-control' name='total' id='total' value="+ total+">"
	  	
	  
	 </script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>