package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Produto;

public class ProdutoDAO {
	
	/*static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		  }
	}
	
// Obtém conexão com o banco de dados
	public Connection obtemConexao() throws SQLException {
		return DriverManager
				.getConnection("jdbc:mysql://localhost/site_web?user=root&password=senha");
	}*/
	
	
	public int criar(Produto produto) {
		String sqlInsert = "INSERT INTO produto(nome, categoria, marca, estoque, preco, obs, link) VALUES (?, ?, ?, ?, ?, ?, ?)";
// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();

				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, produto.getNome());
			stm.setString(2, produto.getCategoria());
			stm.setString(3, produto.getMarca());
			stm.setInt(4,  produto.getEstoque());
			stm.setDouble(5, produto.getPreco());
			stm.setString(6, produto.getObs());
			stm.setString(7, produto.getLink());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produto.getId();
	}
	
	
	public void atualizar(Produto produto) {
		String sqlUpdate = "UPDATE produto SET id=?, categoria=?, marca=?, estoque=?, preco=?, obs=?, link=? WHERE nome=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();

				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setInt(1, produto.getId());
			stm.setString(2, produto.getCategoria());
			stm.setString(3, produto.getMarca());
			stm.setInt(4, produto.getEstoque());
			stm.setDouble(5, produto.getPreco());
			stm.setString(6,  produto.getObs());
			stm.setString(7,  produto.getLink());
			stm.execute();
				} catch (Exception e) {
					e.printStackTrace();
				  }
	}
	
	
	public void excluir(String nome) {
		String sqlDelete = "DELETE FROM produto WHERE nome = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setString(1, nome);
			stm.execute();
				} catch (Exception e) {
					e.printStackTrace();
				  }
	}
	
	
	public Produto carregar(String nome) {
		Produto produto = new Produto();
		String sqlSelect = "SELECT id, categoria, marca, estoque, preco, obs, link FROM produto WHERE produto.nome = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();

				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
					stm.setString(1, nome);
					try (ResultSet rs = stm.executeQuery();) {
						if (rs.next()) {	
							produto.setNome(nome);
							produto.setId(rs.getInt("id"));
							produto.setCategoria(rs.getString("categoria"));
							produto.setMarca(rs.getString("marca"));
							produto.setEstoque(rs.getInt("estoque"));
							produto.setPreco(rs.getDouble("preco"));
							produto.setObs(rs.getString("obs"));
							produto.setLink(rs.getString("link"));
						}
					} catch (SQLException e) {
						e.printStackTrace();
					  }
				} catch (SQLException e1) {
					System.out.print(e1.getStackTrace());
				  }
return produto;
	}
	
	public ArrayList<Produto> listarProduto() {
		Produto produto;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, categoria, marca, estoque, preco, obs, link FROM registro.produto";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					produto = new Produto();
					produto.setId(rs.getInt("id"));
					produto.setNome(rs.getString("nome"));
					produto.setCategoria(rs.getString("categoria"));
					produto.setMarca(rs.getString("marca"));
					produto.setEstoque(rs.getInt("estoque"));
					produto.setPreco(rs.getDouble("preco"));
					produto.setObs(rs.getString("obs"));
					produto.setLink(rs.getString("link"));
					lista.add(produto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public ArrayList<Produto> listarProdutos(String chave) {
		Produto produto;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, categoria, marca, estoque, preco, obs, link FROM produto where upper(nome) like ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					produto = new Produto();
					produto.setId(rs.getInt("id"));
					produto.setNome(rs.getString("nome"));
					produto.setCategoria(rs.getString("categoria"));
					produto.setMarca(rs.getString("marca"));
					produto.setEstoque(rs.getInt("estoque"));
					produto.setPreco(rs.getDouble("preco"));
					produto.setObs(rs.getString("obs"));
					produto.setLink(rs.getString("link"));
					lista.add(produto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

}
