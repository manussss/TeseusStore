package service;

import model.Produto;
import java.util.ArrayList;
import dao.ProdutoDAO;

public class ProdutoService {
	ProdutoDAO dao;
	
	public ProdutoService(){
		dao = new ProdutoDAO();
	}
	
	public int criar(Produto produto) {
		return dao.criar(produto);
	}
	public void atualizar(Produto produto) {
		dao.atualizar(produto);
	}
	public void excluir(String nome) {
		dao.excluir(nome);
	}
	public Produto carregar(String nome) {
		return dao.carregar(nome);
	}
	public ArrayList<Produto> listarProdutos(){
		return dao.listarProduto();
	}
	public ArrayList<Produto> listarProdutos(String chave){
		return dao.listarProdutos(chave);
	}
}
