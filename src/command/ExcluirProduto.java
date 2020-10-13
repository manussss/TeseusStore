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

public class ExcluirProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pNome = request.getParameter("nome");
		String nome = "-1";
		try {
			nome = (pNome);
		}catch(Exception e) {
			
		}
		
		Produto produto = new Produto();
		produto.setNome(nome);
		
		ProdutoService ps = new ProdutoService();
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
   
        
		ps.excluir(produto.getNome());
		ArrayList<Produto> lista = (ArrayList<Produto>)session.getAttribute("lista");
		lista.remove(busca(produto, lista));
		session.setAttribute("lista", lista);
		view = request.getRequestDispatcher("Home.jsp");		

	}
		public int busca(Produto produto, ArrayList<Produto> lista) {
			Produto to;
				for(int i = 0; i < lista.size(); i++){
					to = lista.get(i);
					if(to.getId() == produto.getId()){
				return i;
					}
				}
					return -1;		
	
		}


}
