package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdmLogin;
import service.AdmLoginService;

public class LoginAdm implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String aEmail = request.getParameter("email");
		String aSenha = request.getParameter("senha");
		
		AdmLogin admLogin = new AdmLogin();
		admLogin.setEmailAdm(aEmail);
		admLogin.setSenhaAdm(aSenha);
		
		AdmLoginService cs = new AdmLoginService();
		if(cs.validar(admLogin)) {
			HttpSession session = request.getSession();
			session.setAttribute("logadoAdm", admLogin);
			System.out.println("Logou " + admLogin.getEmailAdm() + "-" +  admLogin.getSenhaAdm());
		}else {
			System.out.println("Não Logou " + admLogin);
			throw new ServletException("Usuário/Senha inválidos");
		}
		
		response.sendRedirect("Home.jsp");		
	}

}
