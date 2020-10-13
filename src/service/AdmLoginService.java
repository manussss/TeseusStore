package service;

import model.AdmLogin;
import dao.AdmLoginDAO;

public class AdmLoginService {

	AdmLoginDAO dao = new AdmLoginDAO();

	public int criar(AdmLogin admLogin) throws Exception {		
		return dao.criar(admLogin);
	}

	public void atualizar(AdmLogin admLogin) {
		dao.atualizar(admLogin);
	}

	public void excluir(int idAdm) {
		dao.excluir(idAdm);
	}

	public AdmLogin carregar(int idAdm) {
		return dao.carregar(idAdm);
	}
	public boolean validar(AdmLogin admLogin) {
		return dao.validar(admLogin);
		
	}

}
