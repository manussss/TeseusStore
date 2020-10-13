package model;

public class Endereco {
	private int id;
	private int cep;
	private String rua;
	private String num;
	private String comp;
	private String bairro;
	private String cidade;
	private String uf;
	private int tel;
	
	public Endereco() {
		
		
	}
	
	//construtores
	public Endereco(int id, String uf, String cidade, String bairro, int tel, String comp, String num,
		String rua, int cep) {
		
		this.id =id;
		this.uf = uf;
		this.cidade = cidade;
		this.bairro = bairro;
		this.tel = tel;
		this.comp = comp;
		this.num = num;
		this.rua = rua;
		this.cep = cep;
	}

	//setters
	
	public void setUf(String uf) {
		this.uf = uf;
	}
	
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public void setTel(int tel) {
		this.tel = tel;
	}
	
	public void setComp(String comp) {
		this.comp = comp;
	}
	
	public void setNum(String num) {
		this.num = num;
	}
	
	public void setRua(String rua) {
		this.rua = rua;
	}
	
	public void setCep(int cep) {
		this.cep = cep;
	}
	//getters
	
	public String getUf() {
		return uf;
	}
	public String getCidade() {
		return cidade;
	}
	public String getBairro() {
		return bairro;
	}
	public int getTel() {
		return tel;
	}
	public String getComp() {
		return comp;
	}
	public String getNum() {
		return num;
	}
	public String getRua() {
		return rua;
	}
	public int getCep() {
		return cep;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Endereco [estado=" + uf + ", cidade=" + cidade + ", bairro=" + bairro
				+ ", tel=" + tel + ", comp=" + comp + ", num=" + num + ", rua=" + rua + ", cep=" + cep + "]";
	}
	
}
