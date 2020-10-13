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

public class CriarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cNome = request.getParameter("nome");
		String cEmail = request.getParameter("email");
		String cSenha = request.getParameter("senha");	
		String cCpf = request.getParameter("cpf");
		String cObs = request.getParameter("obs");
		
        //instanciar o javabean
        Cliente cliente = new Cliente();
        cliente.setNome(cNome);
        cliente.setEmail(cEmail);
        cliente.setSenha(cSenha);
        cliente.setCpf(cCpf);
        cliente.setObs(cObs);
                
        //instanciar o service
        ClienteService cs = new ClienteService();
        

		HttpSession session = request.getSession();
		
        cs.criar(cliente);
        ArrayList<Cliente> listaC = new ArrayList<>();
		listaC.add(cliente);
		session.setAttribute("listaC", listaC);
		
		cs.validar(cliente);
			session.setAttribute("logado", cliente);
			System.out.println("Logou " + cliente.getEmail() + "-" +  cliente.getSenha());
		
		response.sendRedirect("Home.jsp");
        
        
	}

}
