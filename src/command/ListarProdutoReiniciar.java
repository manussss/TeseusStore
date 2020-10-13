package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;
import service.ProdutoService;

public class ListarProdutoReiniciar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoService ps = new ProdutoService();
		ArrayList<Produto> lista = ps.listarProdutos();
		HttpSession session = request.getSession();
		session.setAttribute("lista", lista);
	RequestDispatcher view = request.getRequestDispatcher("Home.jsp");
	view.forward(request, response);

	}

}
