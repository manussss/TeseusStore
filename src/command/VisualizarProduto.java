package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class VisualizarProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pNome = request.getParameter("nome");
		
		//instanciando
		ProdutoService ps = new ProdutoService();
		Produto produto = new Produto();
		produto = ps.carregar(pNome);
				
		request.setAttribute("produto", produto);
		RequestDispatcher view = 
	    request.getRequestDispatcher("Produto.jsp");
        view.forward(request, response);
	}

}
