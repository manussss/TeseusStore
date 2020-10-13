package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdmLogin;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "/EditarProduto.jsp" })
public class LoginFilterADM implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		AdmLogin logado = (AdmLogin) session.getAttribute("logadoAdm");
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String comando = req.getParameter("command");
		if (comando == null) {
			comando = "";
		}

		if (logado == null && !uri.equals(path + "/AdmLogin.jsp") && !comando.equals("LoginAdm")) {
			((HttpServletResponse) response).sendRedirect(path + "/AdmLogin.jsp");
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
