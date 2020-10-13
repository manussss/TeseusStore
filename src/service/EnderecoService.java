package service;

import java.util.ArrayList;

import dao.EnderecoDAO;
import model.Endereco;

public class EnderecoService {
	EnderecoDAO dao;
		 
	public EnderecoService(){
		dao = new EnderecoDAO();
	}
		
		public int criar(Endereco endereco) {
			int id = dao.criar(endereco);
			System.out.println("id :" + id);
			return id;
		}
		
		public void atualizar(Endereco endereco){
			dao.atualizar(endereco);
		}
		
		public void excluir(int cep){
			dao.excluir(cep);
		}
		
		public Endereco carregar(int cep){
			return dao.carregar(cep);
		}
		public ArrayList<Endereco> listarEndereco(){
			return dao.listarEndereco();
		}

	}

