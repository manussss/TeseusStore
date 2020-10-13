package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdmLogin;
import service.AdmLoginService;

public class CriarADM implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String aEmail = request.getParameter("aemail");
		String aSenha = request.getParameter("asenha");
		String aNome = request.getParameter("anome");
		String aId = request.getParameter("aid");
		int id = -1;
		try {
			id = Integer.parseInt(aId);
		} catch (NumberFormatException e) {

		}

		// instanciar o javabean
		AdmLogin admLogin = new AdmLogin();
		admLogin.setEmailAdm(aEmail);
		admLogin.setSenhaAdm(aSenha);
		admLogin.setNomeAdm(aNome);
		admLogin.setIdAdm(id);
		

		// instanciar o service
		AdmLoginService cs = new AdmLoginService();
		//exceção
		try {
			cs.criar(admLogin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		admLogin = cs.carregar(admLogin.getIdAdm());

		request.setAttribute("admLogin", admLogin);

		RequestDispatcher view = request.getRequestDispatcher("Home.jsp");
		//exceção
		try {
			view.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
