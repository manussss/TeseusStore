package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import service.ClienteService;

public class EditarCliente implements Command {

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
		
		cliente = cs.carregar(cliente.getId());
		request.setAttribute("cliente", cliente);
		view = request.getRequestDispatcher("EditarCliente.jsp");		
		
		view.forward(request, response);

	}

}
