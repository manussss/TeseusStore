package model;

public class AdmLogin {
	private int idAdm;
	private String nomeAdm;
	private String emailAdm;
	private String senhaAdm;

	public AdmLogin(int idAdm, String nomeAdm, String emailAdm, String senhaAdm) {
		this.idAdm = idAdm;
		this.nomeAdm = nomeAdm;
		this.emailAdm = emailAdm;
		this.senhaAdm = senhaAdm;
	}

	public AdmLogin() {
	}

	public int getIdAdm() {
		return idAdm;
	}

	public void setIdAdm(int idAdm) {
		this.idAdm = idAdm;
	}

	public String getNomeAdm() {
		return nomeAdm;
	}

	public void setNomeAdm(String nomeAdm) {
		this.nomeAdm = nomeAdm;
	}

	public String getEmailAdm() {
		return emailAdm;
	}

	public void setEmailAdm(String emailAdm) {
		this.emailAdm = emailAdm;
	}

	public String getSenhaAdm() {
		return senhaAdm;
	}

	public void setSenhaAdm(String senhaAdm) {
		this.senhaAdm = senhaAdm;
	}

	@Override
	public String toString() {
		return "Login Administrado [Id=" + idAdm + ", Nome do Administrador=" + nomeAdm + ", Email do Administrador="
				+ emailAdm + "]";
	}
}
