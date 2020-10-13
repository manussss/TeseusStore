package command;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CriarBoleto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*String pnomeCedente = request.getParameter("nomeCedente");
		String pcnpjCedente = request.getParameter("cnpjCedente");
		String pnomeSacado = request.getParameter("nomeCliente");
		String pcpfCliente = request.getParameter("cpfCliente");*/
		
		try {			
			MeuPrimeiroBoleto boletos = new MeuPrimeiroBoleto();
			boletos.executar(request, response);
			System.out.println("Enviado com sucesso");
		}catch (Exception e) {
			System.out.println("Erro ao enviar");
		}
		
		response.sendRedirect("index.jsp");
	}

}
