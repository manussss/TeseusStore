<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>TESTE</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<style>
tr {
color: white;
font-size: 15px;
}
</style>


</head>
<body>

	<!--  TESTE  -->


	<!-- Modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalLabel">Excluir Pais</h4>
				</div>
				<div class="modal-body">Tem certeza que deseja excluir este
					pais?</div>
				<div class="modal-footer">
					<form action="controller.do" method="post">
						<input type="hidden" name="id" id="id_excluir" />
						<button type="submit" class="btn btn-primary" name="command"
							value="ExcluirPais">Sim</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:import url="Menu.jsp"></c:import>
	 <div id="main" class="container">
                <form action="controller.do" method="post">
                    <div id="top" class="row">
                        <div class="col-md-3">
                            <h2>Produtos</h2>
                        </div>

                        <div class="col-md-6">
                            <div class="input-group h2">
                                <input name="data[search]" class="form-control" id="search" type="text" placeholder="Pesquisar Produtos (deixe vazio para trazer todos)">
                                <span class="input-group-btn">
                <button class="btn btn-primary" type="submit" name="command" value="ListarProduto">
                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                                </span>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <a href="CadastroProduto.jsp" class="btn btn-primary pull-right h2">Novo Produto</a>
                        </div>
                    </div>
                    <!-- /#top -->
                </form>
                <hr />
                <c:if test="${not empty lista}">
                <div id="list" class="row">

                    <div class="table-responsive col-md-12">
                        <table class="table table-striped" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>                                    
                                    <th style="color: white" >Nome</th>
                                    <th>link</th>
                                    <th>categoria</th>
                                    <th>preco</th>
                                    <th class="actions">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
          					<c:forEach var="produto" items="${lista }">
                                       <tr>
                                       
                                            <td>
                                               ${produto.nome }
                                            </td>
                                            <td>
                                       ${produto.link }
                                       </td>
                                            <td>
                                                ${produto.categoria }
                                            </td>
                                            <td>
                                                ${produto.preco }
                                            </td>
                                         
                                            <td class="actions">
                                                <a class="btn btn-success btn-xs" href="controller.do?command=VisualizarProduto&nome=${produto.nome }">Visualizar</a>
                                                <a class="btn btn-warning btn-xs" href="controller.do?command=EditarProduto&nome=${produto.nome }">Editar</a>
                                                <button id="btn${produto.nome }%>" type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete-modal" data-cliente="${produto.nome }">Excluir</button>
                                            </td>
                                        </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- /#list -->

                <div id="bottom" class="row">
                    <div class="col-md-12">
                        <!-- paginação ainda não foi implementada -->
                        <ul class="pagination">
                            <li class="disabled"><a>&lt; Anterior</a>
                            </li>
                            <li class="disabled"><a>1</a>
                            </li>
                            <li><a href="#">2</a>
                            </li>
                            <li><a href="#">3</a>
                            </li>
                            <li class="next"><a href="#" rel="next">Próximo &gt;</a>
                            </li>
                        </ul>
                        <!-- /.pagination -->
                    </div>
                </div>
                </c:if>
                <!-- /#bottom -->
            </div>
            <!-- /#main -->
            
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            
            <script type="text/javascript">
                $("#delete-modal").on('show.bs.modal', function(event) {
                    var button = $(event.relatedTarget); //botao que disparou a modal
                    var recipient = button.data('pais');
                    $("#id_excluir").val(recipient);
                });
            </script>
            
</body>
</html>