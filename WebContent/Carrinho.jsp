<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="service.ProdutoService"%>
<%@page import="model.Produto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrinho</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<style>
.footerCa {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: black;
  color: white;
  text-align: center;
  padding: 10px;
  margin-top: 10px;
}
hr { display: block; height: 2px;
    border: 0; border-top: 2px solid black;
    margin: 1em 0; padding: 0; }
label {
    /* Other styling... */
    text-align: right;
    clear: both;
    float:left;
    margin-right:15px;
    
 
}

table, th, td {
  border: 1px solid black;
  
}

 #panel { 
heitgh:800px;
margin-bottom: 0px;
 }
 #page-container {
  position: relative;
  min-height: 100vh;
}
 #tab{
 padding-bottom: 2.5rem;
 } 
 
</style>
<body>
<c:import url="Menu.jsp" />


<div  id="page-container"> 
	<div id="tab" class="container">
		<div class="panel panel-default" >
		  <!-- Default panel contents -->
		  <div class="panel-heading panel.h1 text-center " ><b>Produtos </b></div>
		  <div id="panel" class="panel-body" style="font-size: 15px;">
			   <div id="itens" style="font-size: 15px; text-align:left"> 
			  
			   </div>
			  <div style="font-size: 15px;"><span id="total"></span></div>
			  <button type="button" class="btn btn-warning" onclick=" localStorage.clear(); location.reload();"> Limpar carrinho </button>
		  </div>
		  
	
		 
		  
		</div>
	</div>



	<!-- <form action="controller.do" method="post"> -->
		<div class="footerCa">
		
			<!-- <div  id="main" class="container" >
				<div class="form-group col-md-5" style="display:flex; flex-direction: row; justify-content: center; align-items: center">
								<label for="cep">CEP:</label> <input type="text"
									class="form-control" name="cep" id="cep" maxlength="9"
									placeholder="Digite o seu CEP">
								
				</div>
				<div class="form-group col-md-1" style="display:flex; flex-direction: row; justify-content: center; align-items: center">
								<button type="submit" class="btn btn-primary" name="frete"
								value="frete" style="height:30px;width:109px"> Calcular Frete</button>
								
				</div>
				<div class="form-group col-md-6" style="display:flex; flex-direction: row; justify-content: center; align-items: left" id="finalizar">
					<label for="cupom">Cupom de Desconto:</label> 
					<input type="text" class="form-control" name="cupom" id="cupom" maxlength="12" placeholder="Digite o seu cupom">
					<input type="hidden" class="form-control" name="command" id="command" value="FinalizarCompra">
									
				</div>
				<br>
				<div class="form-group col-md-6" id="total">
				</div> -->
				
				<div class="form-group col-md-6" style="text-align:center;">
					<a href="FormasPagamento.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-usd"></span> Finalizar Compra</a>
							<a href="index.jsp" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</a>
				</div>
			</div>
		</div>
	<!-- </form> -->
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>	
function Aumentar(i){
	localStorage.setItem("qtd" + i,parseInt(localStorage.getItem("qtd" + i))+1);
	location.reload();
}
</script>
<script>
function Excluir(i){
	localStorage.removeItem("qtd" + i);
    localStorage.removeItem("produto" + i);
    localStorage.removeItem("valor" + i);
    $(this).button('loading');
    location.reload();	
}
</script>
<script>
function Diminuir(i){
	if(localStorage.getItem("qtd" + i) == 1){
		Excluir(i);
	}
	else{
		localStorage.setItem("qtd" + i,parseInt(localStorage.getItem("qtd" + i))-1);
		location.reload();		
	}
	
}
</script>
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
				 document.getElementById("itens").innerHTML += qtd + " x ";
				 document.getElementById("itens").innerHTML += localStorage.getItem("produto" + i);
				 document.getElementById("itens").innerHTML += " ";
				 document.getElementById("itens").innerHTML += "R$: " + (precoTotal) + "  ";
				 document.getElementById("itens").innerHTML += 
			     "<button type='button' color='black' class='btn btn-primary' id='aumentar' onclick='Aumentar("+i+")' style='color: white; font-weight: bold;'>+</button>"
				 document.getElementById("itens").innerHTML +=
			     "<button type='button' color='black' class='btn btn-primary' id='diminuir' onclick='Diminuir("+i+")'color: white; font-weight: bold; '>-</button>"
				 document.getElementById("itens").innerHTML +=
				 "<button type='button' color='black' class='btn btn-danger' id='remover' onclick='Excluir("+i+")' style='color: white; '>Remover</button><hr>"
				 // calculando valor total
				 valor = parseFloat(precoTotal); // valor convertido com o parseFloat()
				 total = (total + valor ); // arredonda para 2 casas decimais com o .toFixed(2)
	 	 }
	  }
	  if (total == 0){
		//caso o carrinho estiver vazio (valor total=0), escreve "carrinho vazio"
		document.getElementById("itens").innerHTML +="Seu carrinho está vazio!";
		document.getElementById("total").innerHTML += " ";
	  }
	  else{
		  //salva o total no localStorage
		  localStorage.setItem("total", total.toFixed(2));
		  // exibe o total dos produtos
		  document.getElementById("total").innerHTML = "Total: <b>R$:" + total.toFixed(2) + "</b>";  
	  }
	  document.getElementById("finalizar").innerHTML +=
		"<input type='hidden' class='form-control' name='total' id='total' value="+ total+">"
	  	
	  
	 </script>
</body>
</html>