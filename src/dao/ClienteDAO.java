package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Cliente;

public class ClienteDAO {
	public int criar(Cliente cliente) {
		String sqlInsert = "INSERT INTO cliente(nome, email, senha, cpf, obs) VALUES (?, ?, ?, ?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setString(1, cliente.getNome());
			stm.setString(2, cliente.getEmail());
			stm.setString(3, cliente.getSenha());
			stm.setString(4, cliente.getCpf());
			stm.setString(5, cliente.getObs());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					cliente.setId(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cliente.getId();
	}

	public void atualizar(Cliente cliente) {
		String sqlUpdate = "UPDATE cliente SET nome=?, email=?, senha=?, cpf=?, obs=? WHERE id=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, cliente.getNome());
			stm.setString(2, cliente.getEmail());
			stm.setString(3, cliente.getSenha());
			stm.setString(4, cliente.getCpf());
			stm.setString(5, cliente.getObs());
			stm.setInt(6, cliente.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM registro.cliente WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Cliente carregar(int id) {
		Cliente cliente = new Cliente();
		cliente.setId(id);
		String sqlSelect = "SELECT nome, cpf, email, senha, obs FROM registro.cliente WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, cliente.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					cliente.setSenha(rs.getString("senha"));
					cliente.setObs(rs.getString("obs"));
				} else {
					cliente.setId(-1);
					cliente.setNome(null);
					cliente.setCpf(null);
					cliente.setEmail(null);
					cliente.setSenha(null);
					cliente.setObs(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return cliente;
	}

	public ArrayList<Cliente> listarClientes() {
		Cliente cliente;
		ArrayList<Cliente> listaC = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, cpf, email FROM registro.cliente";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					cliente = new Cliente();
					cliente.setId(rs.getInt("id"));
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					listaC.add(cliente);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return listaC;
	}

	public ArrayList<Cliente> listarClientes(String chave) {
		Cliente cliente;
		ArrayList<Cliente> listaC = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, cpf, email FROM cliente where upper(nome) like";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					cliente = new Cliente();
					cliente.setId(rs.getInt("id"));
					cliente.setNome(rs.getString("nome"));
					cliente.setCpf(rs.getString("cpf"));
					cliente.setEmail(rs.getString("email"));
					listaC.add(cliente);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return listaC;
	}

	public boolean validar(Cliente cliente) {

		String sqlSelect = "select email, senha from cliente where email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obterConexao();
			try (PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setString(1, cliente.getEmail());
				stm.setString(2, cliente.getSenha());
				try (ResultSet rs = stm.executeQuery();) {
					if (rs.next()) {

						return true;
					} else {

						return false;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				System.out.println(e1.getStackTrace());
			}
		} catch (SQLException e2) {
			e2.getStackTrace();
		}
		return false;
	}

	public Cliente carregar(String email, String senha) {
		Cliente cliente = new Cliente();
		cliente.setEmail(email);
		cliente.setSenha(senha);
		String sqlSelect = "select id, nome, cpf, email, senha from cliente where email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obterConexao();
			try (PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setString(1, email);
				stm.setString(2, senha);
				try (ResultSet rs = stm.executeQuery();) {
					if (rs.next()) {
						cliente.setId(rs.getInt("id"));
						cliente.setNome(rs.getString("nome"));
						cliente.setCpf(rs.getString("cpf"));
						cliente.setEmail(rs.getString("email"));
						cliente.setSenha(rs.getString("senha"));
					} else {
						cliente.setId(-1);
						cliente.setNome(null);
						cliente.setCpf(null);
						cliente.setEmail(null);
						cliente.setSenha(null);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				System.out.println(e1.getStackTrace());
			}
		} catch (SQLException e2) {
			e2.getStackTrace();
		}
		return cliente;
	}
}
