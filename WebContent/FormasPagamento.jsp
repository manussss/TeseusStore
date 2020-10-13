<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escolha a forma de pagamento</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
h1{
color: white;
font-size: 20px;
}

/* .collapse.show {
  visibility: visible;
}
@media (max-width: 2000px) {
    .navbar-header {
        float: none;
    }
    .navbar-toggle {
        display: block;
    }
    .navbar-collapse {
        border-top: 1px solid transparent;
        box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
    }
    .navbar-collapse.collapse {
        display: none!important;
    }
    .navbar-nav {
        float: none!important;
        margin: 7.5px -15px;
    }
    .navbar-nav>li {
        float: none;
    }
    .navbar-nav>li>a {
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .navbar-text {
        float: none;
        margin: 15px 0;
    }
    /* since 3.1.0 */
    .navbar-collapse.collapse.in { 
        display: block!important;
    }
    .collapsing {
        overflow: hidden!important;
    } */
    
}
/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  /* border: 1px solid #ccc;
  border-top: none; */
  background-color: #04191C;
}
label{
	color: white;
}
</style>
</head>
<body>
<c:import url="Menu.jsp" />
<p style="color: white;	font-size: 30px;"><b>Forma de Pagamento</b></p>
<hr style="border-top: 1px solid white;">

<!-- link pras tabs  -->
<div id="main" class="container ">
	<div class="row">
		<div class="tab form-group col-md-12" style="background-color:white;">
		  <button class="tablinks" onclick="openPagamento(event, 'Boleto'); pagBoleto();" id="aberto"><span class="glyphicon glyphicon-barcode" aria-hidden="true"></span> Boleto Bancário</button>
		  <button class="tablinks" onclick="openPagamento(event, 'Cartao'); pagCartao();"><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> Cartão de Crédito</button>
		</div>
	</div>
	<!--  oq tem dentro das tabs -->
	<!-- dentro do boleto -->
	<div id="Boleto" class="tabcontent form-group col-md-12">
		<form action="controller.do" method="post">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-3">
					<label for="total">Valor da Compra</label> <input type="text"
						class="form-control" name="total" id="totalBoleto" readonly
						required>
				</div>
			</div>
			<hr>
			<div id="actions" class="row">
				<div class="col-md-12">
					<input type="hidden" class="form-control" name="command" id="command" value="MeuPrimeiroBoleto">
					<input type="hidden" class="form-control" name="tipo" id="tipo">
					<button class="btn btn-primary" type="submit" name="command" value="MeuPrimeiroBoleto">Gerar boleto</button>
	  				<button type="submit" id="command"  name="command" value="MeuPrimeiroBoleto" class="btn btn-primary">Pagar com Boleto Bancário</button>
					<a href="Home.jsp" class="btn btn-default" onclick="localStorage.clear()" style="color: white">Cancelar</a>
				</div>
			</div>
			<div id="actions" class="row">
				<div class="col-md-12">
				<br>
				<p style="color: white; font-size: 13px;">O pagamendo do boleto podera ser efetuado em qualquer Banco ou Casa Lotérica em qualquer lugar do Brasil, sem necessidade de confirmação do pagamento.
				 </p>
				</div>
			</div>
		</form>
	</div>
	<!-- dentro do cartao -->
	<div id="Cartao" class="tabcontent">
	  <form action="controller.do" method="post">
			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-3">
					<label for="total">Valor da Compra</label> <input type="text"
						class="form-control" name="total"  id="totalCartao" readonly
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="nome">Nome</label> <input type="text"
						class="form-control" name="nome" id="nome" placeholder="Nome como escrito no cartão"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="numero">Número do cartão</label> <input type="text"
						class="form-control" name="numero" id="numero" maxlength="16"
						placeholder="Somente números (sem espaços)"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="validade">Validade</label> <input type="text"
						class="form-control" name="validade" id="validade" placeholder="(mm/aa)" maxlength="5"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="codigo">Código de segurança</label> <input type="text"
						class="form-control" name="codigo" id="codigo" maxlength="4" placeholder="xxxx"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="cpf">CPF do proprietário do cartão</label> <input type="text"
						class="form-control" name="cpf" id="cpf" placeholder="Somente números(sem espaço)" maxlength="11"
						required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label for="data">Data de nascimento</label> <input type="text"
						class="form-control" name="data" id="data"
						placeholder="(dd/mm/aa)" maxlength="8"
						required>
				</div>
			</div>
			<hr>
			<div id="actions" class="row">
				<div class="col-md-12">
					<input type="hidden" class="form-control" name="command" id="command" value="FinalizarCartao">
	  				<button type="submit" class="btn btn-primary">Pagar com Cartão de Crédito</button>
					<a href="Home.jsp" class="btn btn-default" onclick="localStorage.clear()" style="color: white">Cancelar</a>
				</div>
			</div>
		</form>
	  
	</div>
</div>

<script>
function openPagamento(evt, pag) {
	  // declarando variaveis
	  var i, tabcontent, tablinks;

	  // pegando tds elementos com class="tabcontent" e escondendo eles
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	// Pegando tds os elementos com class="tablinks" e removendo a class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // mostrando a tab atual, e add um "active" class para o botao q abriu a tab
	  document.getElementById(pag).style.display = "block";
	  evt.currentTarget.className += " active";
	}
</script>
<script>
 function pagBoleto(){
	localStorage.setItem("pagamento","Boleto Bancário")
 }
</script>
<script>
 function pagCartao(){
	localStorage.setItem("pagamento","Cartão de Crédito")
 }
</script>
<script>

	//colocando o valor da compra nos campos total
	var total = localStorage.getItem("total");
	document.getElementById("totalBoleto").value=total;
	document.getElementById("totalCartao").value=total;
	//fazendo o boleto começar aberto
	document.getElementById("aberto").click();
</script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>