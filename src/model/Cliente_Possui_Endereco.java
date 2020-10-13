package model;

public class Cliente_Possui_Endereco {
	private int id_possui;
	private int id_clientes;
	private int id_enderecos;
	
public Cliente_Possui_Endereco() {
		
	}
	
	public Cliente_Possui_Endereco(int id_possui, int id_clientes, int id_enderecos) {
		
		id_possui = this.id_possui;
		id_clientes = this.id_clientes;
		id_enderecos = this.id_enderecos;
		
	}

	public int getId_possui() {
		return id_possui;
	}

	public void setId_possui(int id_possui) {
		this.id_possui = id_possui;
	}

	public int getId_clientes() {
		return id_clientes;
	}

	public void setId_clientes(int id_clientes) {
		this.id_clientes = id_clientes;
	}

	public int getId_enderecos() {
		return id_enderecos;
	}

	public void setId_enderecos(int id_enderecos) {
		this.id_enderecos = id_enderecos;
	}
	
	@Override
	public String toString() {
		return "Cliente_Possui_Endereco [Id_Clientes =" + id_clientes + ", Id_Produto=" + id_enderecos + "]";	
	}
}

