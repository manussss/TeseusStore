<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
<script type="text/javascript" charset="utf8"
	src="/DataTables/datatables.js"></script>


<link href="css/addons/datatables.min.css" rel="stylesheet">
<script type="text/javascript" src="js/addons/datatables.min.js"></script>

<style>
/* Estilo do Rodapé*/
.footerHome {
	possition: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 260px;
	background-color: #2E3B56;
	text-align: center;
	padding: 10px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<c:import url="Menu.jsp" />
	<div class="container">
		<div id="carouselSite" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://drive.google.com/uc?id=1OBOcHqJ9sHLKQVMOLLjqpOlN1q3Ekudk"
						width="100%" height="200">
				</div>
				<div class="carousel-item">
					<img
						src="https://drive.google.com/uc?id=1zhtjph87Lb4Z1isyDF377-FiGhNcDsHw"
						width="100%" height="200">
				</div>
				<div class="carousel-item">
					<img
						src="https://drive.google.com/uc?id=1Vn0zrmkQcYbVo_I7TbEX-6Wsrq3RaP-W"
						width="100%" height="200">
				</div>
			</div>
			<a class="left carousel-control" href="#carouselSite" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carouselSite" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" class="seta-slide"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<hr />
	<div class="container">
		<c:if test="${not empty lista}">

			<div class="row mb-5">
				<c:forEach var="produto" items="${lista }">
					<table id="myTable">
						<div class="col-sm-4" align="center">
							<div class="card" style="width: 35rem;">
								<a type="submit" name="command" value="Produto"> <img
									class="card-img-top" src="${produto.link }"></a>
								<div class="card-body">
									<h4 class="card-title">${produto.nome }</h4>
									<hr>
									<h5 class="card-subtitle text-muted">${produto.categoria}
										R$ ${produto.preco}</h5>
									<div class="card-body">
										<div class="col-md-3">
											<input type="hidden" class="form-control" name="command"
												id="command" value="VisualizarProduto"> <input
												type="hidden" class="form-control" name="nome" id="nome"
												value="${produto.nome}"> <a type="submit"
												class="btn btn-warning" name="produto"
												href="controller.do?command=VisualizarProduto&nome=${produto.nome}">Confira
												aqui!</a> <br>
										</div>
									</div>
								</div>

							</div>

						</div>
					</table>
				</c:forEach>
			</div>






			<!-- /#list -->

			<div id="bottom" class="row" align="center">
				<div class="col-md-4">
					<!-- paginação ainda não foi implementada -->
					<ul class="pagination">
						<li class="disabled"><a>&lt; Anterior</a></li>
						<li class="disabled"><a>1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
					</ul>
					<!-- /.pagination -->
				</div>
			</div>
			<!--  -->
		</c:if>
	</div>

	<!-- Rodapé -->
	<div class="footerHome">
		<div class="container">
			<div class="row text-center text-xs-center ">
				<div style="padding-right: 275px;">
					<h1>Links</h1>
					<ul class="list-unstyled quick-links">
						<li><h5>
								<a href="https://www.usjt.br/">Universidade São Judas Tadeu</a>
							</h5></li>
						<li><h5>
								<a href="##">Sobre Nós</a>
							</h5></li>
						<li><h5>
								<a href="##">GitHub</a>
							</h5></li>
						<li><h5>
								<a href="##">Facebook</a>
							</h5></li>
						<li><h5>
								<a href="##">Contato (11)958478233</a>
							</h5></li>

					</ul>
					<ul class="list-unstyled quick-links">
						<li><h5>
								<a href="LoginAdm.jsp">Caso seja um administrador</a>
							</h5></li>
					</ul>
				</div>
				<div style="padding-right: 135px;">
					<h1>Veja também</h1>
					<ul class="list-unstyled quick-links">
						<li><a href="##"></a></li>
						<li><a href="##"></a></li>
						<li><a href="##"></a></li>
						<li><a href="##"></a></li>
					</ul>
				</div>
				<div>
					<div>
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.4589606560016!2d-46.5997927853841!3d-23.551954367129266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9371b05154fa2b95%3A0x6187fb9a20469948!2sUniversidade%20S%C3%A3o%20Judas%20-%20Unidade%20Mooca!5e0!3m2!1spt-BR!2sbr!4v1588961331556!5m2!1spt-BR!2sbr"
							width="300" height="200" frameborder="0" style="border: 0;"
							allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
					</div>
				</div>
			</div>
		</div>
		<p class="text-muted">Obrigado a todos pela atenção</p>
	</div>

	<!-- /#bottom -->

	<!-- Scripts para paginação -->

	<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
		});
	</script>

	<!-- Scripts para o carousel funcionar devidamente  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
