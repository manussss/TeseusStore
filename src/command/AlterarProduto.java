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

public class AlterarProduto implements Command {

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
		String nome = "-1";
		try {
			nome = (pNome);
		}catch(Exception e) {
			
		}
		
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
		
        ps.atualizar(produto);
        
        ArrayList<Produto> lista = (ArrayList<Produto>)session.getAttribute("lista");
		int pos = busca(produto, lista);
		lista.remove(pos);
		lista.add(pos, produto);
		session.setAttribute("lista", lista);
		request.setAttribute("produto", produto);
		view = request.getRequestDispatcher("EditarProduto.jsp");			

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
