package model;

public class Produto {
	private int id;
	private String nome;
	private String categoria;
	private String marca;
	private int estoque;
	private double preco;
	private String obs;
	private String link;
	
	//construtores 
	public Produto() {
		
	}
	
	public Produto(int id, String nome, String categoria, String marca, int estoque, double preco, String obs, String link) {
		this.id = id;
		this.nome = nome;
		this.categoria = categoria;
		this.marca = marca;
		this.estoque = estoque;
		this.preco = preco;
		this.obs = obs;
		this.setLink(link);
	}
	
	//setters
	public void setId(int id) {
		this.id = id;
		
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public void setEstoque(int estoque) {
		this.estoque = estoque;
	}
	
	public void setPreco(double preco) {
		this.preco = preco;
	}
	
	public void setObs(String obs) {
		this.obs = obs;
	}
	//getters
	public int getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
	public String getCategoria() {
		return categoria;
	}
	public String getMarca() {
		return marca;
	}
	public int getEstoque() {
		return estoque;
	}
	public double getPreco() {
		return preco;
	}
	public String getObs() {
		return obs;
	}

	
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Produto [Id= " + id + ", Nome= " + nome + ", Categoria= " + categoria + ", Marca= " + marca + ", Estoque= " + estoque
				+ ", Preco= " + preco + ", Obs= " + obs + "]";
	}
	
}
