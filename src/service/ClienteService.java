package service;

import model.Cliente;

import java.util.ArrayList;

import dao.ClienteDAO;

public class ClienteService {
	ClienteDAO dao = new ClienteDAO();
	
	public int criar(Cliente cliente) {
		return dao.criar(cliente);
	}
	
	public void atualizar(Cliente cliente) {
		dao.atualizar(cliente);
	}
	public void excluir(int id) {
		dao.excluir(id);
	}
	public Cliente carregar(int id) {
		return dao.carregar(id);
	}
	public ArrayList<Cliente> listarClientes(){
		return dao.listarClientes();
	}
	public ArrayList<Cliente> listarClientes(String chave){
		return dao.listarClientes(chave);
	}
	
	public boolean validar(Cliente cliente) {
		return dao.validar(cliente);
		
	}
	public Cliente carregar(String email, String senha) {
		return dao.carregar(email, senha);
	}
}
