<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ops! Não encontramos</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="img/Cinza.jpg">

	<c:import url="Menu.jsp" />
	<hr>

	<div id="main" class="container">
		<font style="font-family: Arial" size="4">
			<p>Ops! Nenhum resultado encontrado para sua busca.</p> <br> <span
			class="glyphicon glyphicon-repeat"> Verifique os termos
				digitados.</span><br>
		<br> <span class="glyphicon glyphicon-repeat"> Tente
				utilizar palavras-chave.</span>
		</font>

		<div style="margin: 0 auto; width: 10%;">
			<img src="img/OUTRO.png" style="width: 60px;">

		</div>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>