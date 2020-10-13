package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdmLogin;
import model.Cliente;
import service.AdmLoginService;
import service.ClienteService;

public class LogoffAdm implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		AdmLogin admlogin = (AdmLogin)session.getAttribute("logadoAdm");
		AdmLoginService as = new AdmLoginService();
		
		if(as.validar(admlogin)) {
			
			session.setAttribute("logadoAdm", null);
			System.out.println("Logoff de Administrador efetuado com sucesso!");
		}
		
		response.sendRedirect("Login.jsp");
	}
}
