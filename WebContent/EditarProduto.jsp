<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Editar Produto</title>
<meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
            <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Modal -->
            <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="modalLabel">Excluir Produto</h4>
                        </div>
                        <div class="modal-body">
                            Deseja realmente excluir este produto?
                        </div>
                        <div class="modal-footer">
                            <form action="ManterProdutoController" method="post">
                                <input type="hidden" name="id" id="id_excluir" />
                                <button type="submit" class="btn btn-primary" name="command" value="ExcluirProduto">Sim</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal -->
            <!-- Barra superior com os menus de navegação -->
			<c:import url="Menu.jsp"/>
            <!-- Container Principal -->
            <div id="main" class="container">
                <form action="controller.do" method="post">
                    <div id="top" class="row">
                        <div class="col-md-3">
                            <h2>Produtos</h2>
                        </div>

                       

                        <div class="col-md-3">
                            <a href="ProdutoCadastro.jsp" class="btn btn-primary pull-right h2">Novo Produto</a>
                        </div>
                    </div>
                    <!-- /#top -->
                </form>
                </div>
                <hr />
                <c:if test="${not empty lista}">
                <div id="list" class="row">

                    <div class="table-responsive col-md-12">
                        <table class="table table-striped" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome do Produto</th>
                                    <th>Categoria</th>
                                    <th>Marca</th>
                                    <th>Estoque</th>
                                    <th>Preco</th>
                                    <th>Obs</th>
                                    <th class="actions">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
          					<c:forEach var="produto" items="${lista }">
                                       <tr>
                                            <td>
                                               ${produto.id }
                                            </td>
                                            <td>
                                                ${produto.nome }
                                            </td>
                                            <td>
                                                ${produto.categoria }
                                            </td>
                                            <td>
                                                ${produto.marca }
                                            </td>
                                            <td>
                                               ${produto.estoque }
                                            </td>
                                            <td>
                                               ${produto.preco }
                                            </td>
                                            <td>
                                               ${produto.obs }
                                            </td>
                                            <td class="actions">
                                                <a class="btn btn-success btn-xs" href="controller.do?command=VisualizarProduto&id=${produto.id }">Visualizar</a>
                                                <a class="btn btn-warning btn-xs" href="controller.do?command=EditarProduto&id=${produto.id }">Editar</a>
                                                <button id="btn${produto.id }%>" type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete-modal" data-cliente="${produto.id }">Excluir</button>
                                            </td>
                                        </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
                </c:if>
                <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script type="text/javascript">
                $("#delete-modal").on('show.bs.modal', function(event) {
                    var button = $(event.relatedTarget); //botao que disparou a modal
                    var recipient = button.data('produto');
                    $("#id_excluir").val(recipient);
                });
            </script>

</body>
</html>