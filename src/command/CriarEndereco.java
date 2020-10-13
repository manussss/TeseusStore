package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Cliente_Possui_Endereco;
import model.Endereco;
import service.EnderecoService;
import service.ClienteService;
import service.Cliente_Possui_EnderecoService;

public class CriarEndereco implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			String eBairro = request.getParameter("bairro");
			int eCep = Integer.parseInt(request.getParameter("cep"));
			String eCidade = request.getParameter("cidade");
			String eComp = request.getParameter("comp");
			String eUf = request.getParameter("uf");
			String eNum = request.getParameter("num");
			String eRua = request.getParameter("rua");
			int eTel = Integer.parseInt(request.getParameter("tel"));
			
			//instanciando javabean
			Endereco endereco = new Endereco();
			endereco.setBairro(eBairro);
			endereco.setCep(eCep);
			endereco.setCidade(eCidade);
			endereco.setComp(eComp);
			endereco.setUf(eUf);
			endereco.setNum(eNum);
			endereco.setRua(eRua);
			endereco.setTel(eTel);
			
			//instanciando service
			EnderecoService es = new EnderecoService();
			
			RequestDispatcher view = null;
			HttpSession session = request.getSession();

			es.criar(endereco);
			
			ArrayList<Endereco> listaE = new ArrayList<>();
			listaE.add(endereco);
			session.setAttribute("listaE", listaE);
			view = request.getRequestDispatcher("VisualizarEndereco.jsp");
			view.forward(request, response);;
				
	}

}
