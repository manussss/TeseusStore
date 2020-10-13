package service;

import dao.Cliente_Possui_EnderecoDAO;
import dao.EnderecoDAO;
import model.Cliente;
import model.Cliente_Possui_Endereco;
import model.Endereco;

public class Cliente_Possui_EnderecoService {
	Cliente_Possui_EnderecoDAO dao = new Cliente_Possui_EnderecoDAO();
	
	public int criar(int clienteId, Endereco endereco) {
		EnderecoDAO enderecoDao = new EnderecoDAO();
		return dao.criar(clienteId, enderecoDao.criar(endereco));
	}
	
	public void atualizar(Cliente cliente, Endereco endereco) {
		dao.atualizar(cliente, endereco);
	}
	public void excluir(int id) {
		dao.excluir(id);
	}
	public Cliente_Possui_Endereco carregar(int id_possui) {
		return dao.carregar(id_possui);
	}

}
