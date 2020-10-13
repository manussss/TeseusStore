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


public class AlterarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cId = request.getParameter("id");
		String cNome = request.getParameter("nome");
		String cEmail = request.getParameter("email");
		String cSenha = request.getParameter("senha");
		String cCpf = request.getParameter("cpf");
		String cObs = request.getParameter("obs");
		
		int id = -1;
		
		try {
			id = Integer.parseInt(cId);
		} catch (NumberFormatException e) {

		}
		
		Cliente cliente = new Cliente();
		cliente.setId(id);
		cliente.setNome(cNome);
		cliente.setEmail(cEmail);
		cliente.setSenha(cSenha);
		cliente.setCpf(cCpf);
		cliente.setObs(cObs);
		
		ClienteService cs = new ClienteService();
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		cs.atualizar(cliente);
		ArrayList<Cliente> listaC = (ArrayList<Cliente>)session.getAttribute("listaC");
		int pos = busca(cliente, listaC);
		listaC.remove(pos);
		listaC.add(pos, cliente);
		session.setAttribute("listaC", listaC);
		request.setAttribute("cliente", cliente);
		view = request.getRequestDispatcher("VisualizarCliente.jsp");	
		
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
