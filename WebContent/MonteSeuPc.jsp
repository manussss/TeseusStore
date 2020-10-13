<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	
	<link href= "css/bootstrap.min.css" rel="stylesheet" >
	
	<title>Monte seu PC</title>
	<style type= "text/css">
		.btn-group {
			padding: 8px;
		}
		.dropdown-item {
			margin-bottom: 8px;
		}
	</style>
	
	</head>
<body>
	<c:import url= "Menu.jsp"/>
	<ul>
		<li>
			<!-- Example single danger button -->
			<!-- Processador -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Processador
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a>  -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Placa m�e -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Placa m�e
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Mem�ria -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Mem�ria
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Placa de v�deo -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Placa de v�deo
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- HD -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	HD
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Cooler -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Cooler
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Fonte-->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Fonte
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Gabinete -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Gabinete
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
		<li>
			<!-- Monitor -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	Monitor
			  	</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Produto1</a>
			    	<a class="dropdown-item" href="#">Produto2</a>
			    	<a class="dropdown-item" href="#">Produto3</a>
			    	<div class="dropdown-divider"></div>
			    	<!-- <a class="dropdown-item" href="#">Separated link</a> -->
			  	</div>
			</div>
		</li>
	</ul>
<script src="js/jquery.min.js"> </script>
<script src="js/bootstrap.min.js"> </script>	
</body>
</html>