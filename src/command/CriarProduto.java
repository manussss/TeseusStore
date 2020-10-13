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

public class CriarProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pNome = request.getParameter("nome");
        String pCategoria = request.getParameter("categoria");
		String pMarca = request.getParameter("marca");	
		int pEstoque = Integer.parseInt(request.getParameter("estoque"));
		double pPreco = Double.parseDouble(request.getParameter("preco"));
		String pObs = request.getParameter("obs");
		String plink = request.getParameter("link");
		
		Produto produto = new Produto();
        produto.setNome(pNome);
        produto.setCategoria(pCategoria);
        produto.setMarca(pMarca);
        produto.setEstoque(pEstoque);
        produto.setPreco(pPreco);
        produto.setObs(pObs);
        produto.setLink(plink);
        
        ProdutoService ps = new ProdutoService();
        RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
        ps.criar(produto);
        
        ArrayList<Produto> lista = new ArrayList<>();
		lista.add(produto);
		session.setAttribute("lista", lista);
		view = request.getRequestDispatcher("Home.jsp");
		view.forward(request, response);
		

	}

}
