package model;

public class ClienteEndereco {
	private int id_cliente;
	private static String cep_endereco;
	
	public ClienteEndereco(int id_cliente, String cep_endereco) {
		
		this.setCep_endereco(cep_endereco);
		this.setId_cliente(id_cliente);
		
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public static String getCep_endereco() {
		return cep_endereco;
	}

	public void setCep_endereco(String cep_endereco) {
		this.cep_endereco = cep_endereco;
	}
	
	@Override
	public String toString() {
		return "Cliente Endereco [IdCliente =" + id_cliente + ", IdProduto=" + cep_endereco + "]";	
	}
}

