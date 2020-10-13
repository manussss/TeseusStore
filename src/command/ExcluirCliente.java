package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;


public class ExcluirCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pId = request.getParameter("id");
		int id = -1;
		try {
			id = Integer.parseInt(pId);
		} catch (NumberFormatException e) {

		}
		
		Cliente cliente = new Cliente();
		cliente.setId(id);
		
		ClienteService cs = new ClienteService();
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		cs.excluir(cliente.getId());
		ArrayList<Cliente> listaC = (ArrayList<Cliente>)session.getAttribute("listaC");
		listaC.remove(busca(cliente, listaC));
		session.setAttribute("listaC", listaC);
		view = request.getRequestDispatcher("ListarClientes.jsp");	
		
		view.forward(request, response);

	}
	
	public int busca(Cliente cliente, ArrayList<Cliente> listaC) {
		Cliente to;
		for(int i = 0; i < listaC.size(); i++){
			to = listaC.get(i);
			if(to.getId() == cliente.getId()){
				return i;
			}
		}
		return -1;
	}

}
