<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="service.ProdutoService"%>
<%@page import="model.Produto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produto</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
.container{
	margin-top:110px;
}
.newarrival{
	background: green;
	width:50px;
	color:white;
	font-size:12px;
	font-weigth: bold;
}
#imagem{
	margin-left:60px;
}
h1{
 	color:black;
}
p{
	font-size:14px;
}
.price{
	color:green;
	font-size:26px;
	font-weight:bold;
	padding-top:20px;
	
}
label{
	font-size:14px;
}
input{
	border:1px solid black;
	font-weight:bold;
	text-align:center;
	width:30px;
}
.btn{
	background:blue;
	color:black;
	font-size:16px;
	margin-left:20px;
}
div {
	margin-left: 20px;
	margin-bottom: 10px;
}
</style>
</head>
<body>

<c:import url="Menu.jsp" />
<%
//ProdutoService service = new ProdutoService();
//Produto produto = new Produto();
//produto = service.carregar("Placa de Video RTX2080 4GB");
//request.setAttribute("produto", produto);
%>

	<div class="Container">
	
		<div class="row">
			<div id="imagem" class="cold-md-5" >
					<img src="${produto.link}" alt="imagemProduto" class="img-thumbnail"  height="500" width="500">
			</div>		
			
			<div class="col-md-7" id="labels" style="background-color: AliceBlue; border:1px solid black; border-radius: 4px;">
				<p class="newarrival text-center">NEW</p>
				<h1>${produto.nome}</h1>
				<p class="price">R$:${produto.preco}</p>
				<p><b>Estoque: </b> ${produto.estoque}</p>
				<p><b>Categoria:</b> ${produto.categoria}</p>
				<p><b>Marca: </b>  ${produto.marca}</p>
				<p><b>Descrição:</b> ${produto.obs} ></p>
				<label>Quantidade:</label>
				<input type="text" id="qtd1" value="1" maxlength="3">
				<button type="button"  id="adicionar1" id="produto1" onclick="AddCarrinho('${produto.nome}', document.getElementById('qtd1').value,${produto.preco}, ${produto.id})"> Add ao carrinho</button>
				
			</div>
		</div>
	</div>



<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
function AddCarrinho(produto, qtd, valor, posicao)
{ 
localStorage.setItem("produto" + posicao, produto);
localStorage.setItem("qtd" + posicao, qtd);
valor = valor * qtd;
localStorage.setItem("valor" + posicao, valor);
alert("Produto adicionado ao carrinho!");
}
</script>
</body>
</html>