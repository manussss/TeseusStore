package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;

public class FazerLogin implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cEmail = request.getParameter("email");
		String cSenha = request.getParameter("senha");
		
		Cliente cliente = new Cliente();
		cliente.setEmail(cEmail);
		cliente.setSenha(cSenha);
		
		ClienteService cs = new ClienteService();
		if(cs.validar(cliente)) {
			cliente = cs.carregar(cliente.getEmail(), cliente.getSenha());
			HttpSession session = request.getSession();
			session.setAttribute("logado", cliente);
			System.out.println("Logou " + cliente.getEmail() + "-" +  cliente.getSenha());
		}else {
			System.out.println("Não Logou " + cliente.getEmail() + "-" +  cliente.getSenha());
			throw new ServletException("Usuário/Senha inválidos");
		}
		
		response.sendRedirect("Home.jsp");

	}

}
