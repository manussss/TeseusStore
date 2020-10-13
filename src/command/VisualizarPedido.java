package command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;

public class VisualizarPedido implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int pid = Integer.parseInt (request.getParameter("id"));
		 String pnome = request.getParameter("nome");
		 int pidProduto = Integer.parseInt(request.getParameter("idProduto"));
		 int pidCliente = Integer.parseInt(request.getParameter("idCliente"));
		 int pquantidade = Integer.parseInt(request.getParameter("quantidade"));
		 
		 String pdata = request.getParameter("data");
		 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		 Date pdt = null;
		try {
			pdt = formato.parse(pdata);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String pobs = request.getParameter("obs");
		 
		 Pedido pedido = new Pedido();
	        pedido.setId(pid);
	        pedido.setNome(pnome);
	        pedido.setIdProduto(pidProduto);
	        pedido.setIdCliente(pidCliente);
	        pedido.setQuantidade(pquantidade);
	        pedido.setData(pdt);
	        pedido.setObs(pobs);
	        
	        PedidoService ps = new PedidoService();
			ps.criar(pedido);
			pedido = ps.carregar(pedido.getId
					());
			
			request.setAttribute("pedido", pedido);
			
			RequestDispatcher view = 
			        request.getRequestDispatcher("Pedido.jsp");
			        view.forward(request, response);
	}

}
