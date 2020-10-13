package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Endereco;

public class EnderecoDAO {
	public int criar(Endereco endereco) {
		String sqlInsert = "INSERT INTO endereco(cep, rua, comp, num, tel, bairro, cidade, uf) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setInt(1, endereco.getCep());
			stm.setString(2, endereco.getRua());
			stm.setString(3, endereco.getComp());
			stm.setString(4, endereco.getNum());
			stm.setInt(5, endereco.getTel());
			stm.setString(6, endereco.getBairro());
			stm.setString(7, endereco.getCidade());
			stm.setString(8, endereco.getUf());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) { 
				if (rs.next()) {
					endereco.setId(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return endereco.getId();
	}

	public void atualizar(Endereco endereco) {
		String sqlUpdate = "UPDATE endereco SET rua=?, comp=?, num=?, tel=?, bairro=?, cidade=?, uf=?, cep=? WHERE id=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, endereco.getRua());
			stm.setString(2, endereco.getComp());
			stm.setString(3, endereco.getNum());
			stm.setInt(4, endereco.getTel());
			stm.setString(5, endereco.getBairro());
			stm.setString(6, endereco.getCidade());
			stm.setString(7, endereco.getUf());
			stm.setInt(8, endereco.getCep());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM endereco WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Endereco carregar(int id) {
		Endereco endereco = new Endereco();
		endereco.setCep(id);
		String sqlSelect = "SELECT id, cep, rua, comp, num, tel, bairro, cidade, uf FROM endereco WHERE endereco.id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, endereco.getCep());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					endereco.setRua(rs.getString("id"));
					endereco.setRua(rs.getString("cep"));
					endereco.setRua(rs.getString("rua"));
					endereco.setComp(rs.getString("comp"));
					endereco.setNum(rs.getString("num"));
					endereco.setTel(rs.getInt("tel"));
					endereco.setBairro(rs.getString("bairro"));
					endereco.setCidade(rs.getString("cidade"));
					endereco.setUf(rs.getString("uf"));
				} else {
					endereco.setCep(0);
					endereco.setRua(null);
					endereco.setComp(null);
					endereco.setNum(null);
					endereco.setTel(0);
					endereco.setBairro(null);
					endereco.setCidade(null);
					endereco.setUf(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return endereco;
	}
	
	public ArrayList<Endereco> listarEndereco() {
		Endereco endereco;
		ArrayList<Endereco> listaE = new ArrayList<>();
		String sqlSelect = "SELECT cep, rua, comp, num, tel, bairro, cidade, uf FROM registro.endereco";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					endereco = new Endereco();
					endereco.setCep(rs.getInt("cep"));
					endereco.setRua(rs.getString("rua"));
					endereco.setComp(rs.getString("comp"));
					endereco.setNum(rs.getString("num"));
					endereco.setTel(rs.getInt("tel"));
					endereco.setBairro(rs.getString("bairro"));
					endereco.setCidade(rs.getString("cidade"));
					endereco.setUf(rs.getString("uf"));
					listaE.add(endereco);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return listaE;
	}

}


