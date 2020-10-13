<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Endereços</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<c:import url="Menu.jsp" />
	<div class="container">
		<c:if test="${not empty listaE}">

			<div class="row mb-5">
				<c:forEach var="endereco" items="${listaE }">
					<form action="controller.do" method="get">
						<div class="col-sm-4" align="center">
							<div class="card" style="width: 35rem;">
								<div class="card-body">
									<h4 class="card-title">${endereco.rua }, ${endereco.num }</h4>
									<h5 class="card-subtitle text-muted">CEP: ${endereco.cep}
										TEL: ${endereco.tel}</h5>
									<div class="card-body">
										<div class="col-md-3">
											<div id="actions" class="row md-col-12">
												<button type="submit" class="btn btn-primary" name="command"
													value="CriarEndereco">
													<span class="glyphicon glyphicon-upload"></span>Cadastrar Novo Endereço
												</button>
												<a href="Home.jsp" class="btn btn- default"><span
													class="glyphicon glyphicon-remove"></span>Cancelar</a>
											</div>

										</div>
									</div>
								</div>

							</div>

						</div>
					</form>
				</c:forEach>
			</div>
		</c:if>
	</div>

</body>
</html>