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

public class ListarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String chave = request.getParameter("data[search]");
		ClienteService cs = new ClienteService();
		ArrayList<Cliente> listaC = null;
		HttpSession session = request.getSession();

			if (chave != null && chave.length() > 0) {
				listaC = cs.listarClientes(chave);
			} else {
				listaC = cs.listarClientes();
			}
			session.setAttribute("listaC", listaC);
		

		RequestDispatcher dispatcher = request
		.getRequestDispatcher("ListarClientes.jsp");
		dispatcher.forward(request, response);

	}

}