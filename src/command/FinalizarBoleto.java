package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinalizarBoleto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String pPreco = request.getParameter("total");
		
		
	    RequestDispatcher view = request.getRequestDispatcher("FinalizarCompra.jsp");
	    view.forward(request, response);	
		
        
	}

}
