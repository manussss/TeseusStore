package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Cliente;
import model.Cliente_Possui_Endereco;
import model.Endereco;

public class Cliente_Possui_EnderecoDAO {
	
	public int criar(int clienteId, int enderecoId) {
		String sqlInsert = "INSERT INTO cliente_possui_endereco(id_clientes, id_enderecos) VALUES (?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		Cliente_Possui_Endereco possui = new Cliente_Possui_Endereco();
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setInt(1, clienteId);
			stm.setInt(2, enderecoId);
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					
					possui.setId_possui(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return possui.getId_possui();
	}
	
	public void atualizar(Cliente cliente, Endereco endereco) {
		String sqlUpdate = "UPDATE cliente_possui_endereco SET id_enderecos=?, id_clientes=?, WHERE id_possui=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setInt(1, endereco.getId());
			stm.setInt(2, cliente.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(int id_possui) {
		String sqlDelete = "DELETE FROM cliente_possui_endereco WHERE id_possui = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id_possui);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Cliente_Possui_Endereco carregar(int id_possui) {
		Cliente_Possui_Endereco possui = new Cliente_Possui_Endereco();
		possui.setId_possui(id_possui);
		String sqlSelect = "SELECT id, id_clientes, id_enderecos FROM endereco WHERE endereco.id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, possui.getId_possui());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					possui.setId_possui(rs.getInt("id"));
					possui.setId_clientes(rs.getInt("id_clientes"));
					possui.setId_enderecos(rs.getInt("id_enderecos"));
				} else {
					possui.setId_possui(-1);
					possui.setId_clientes(-2);
					possui.setId_enderecos(-3);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return possui;
	}


}
