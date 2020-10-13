package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.AdmLogin;

public class AdmLoginDAO {
	public int criar(AdmLogin admLogin) {
		String sqlInsert = "INSERT INTO adm(id, nome, email, senha) VALUES (?, ?, ?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setInt(1, admLogin.getIdAdm());
			stm.setString(2, admLogin.getNomeAdm());
			stm.setString(3, admLogin.getEmailAdm());
			stm.setString(4, admLogin.getSenhaAdm());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					admLogin.setIdAdm(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admLogin.getIdAdm();
	}

	public void atualizar(AdmLogin admLogin) {
		String sqlUpdate = "UPDATE adm SET nome=?, email=?, senha=? WHERE id=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, admLogin.getNomeAdm());
			stm.setString(2, admLogin.getEmailAdm());
			stm.setString(3, admLogin.getSenhaAdm());
			stm.setInt(4, admLogin.getIdAdm());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int idAdm) {
		String sqlDelete = "DELETE FROM adm WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idAdm);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public AdmLogin carregar(int idAdm) {
		AdmLogin admLogin = new AdmLogin();
		admLogin.setIdAdm(idAdm);
		String sqlSelect = "SELECT nome, email, senha FROM adm WHERE adm.id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obterConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, admLogin.getIdAdm());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					admLogin.setNomeAdm(rs.getString("nome"));
					admLogin.setEmailAdm(rs.getString("email"));
					admLogin.setSenhaAdm(rs.getString("senha"));
				} else {
					admLogin.setIdAdm(-1);
					admLogin.setNomeAdm(null);
					admLogin.setEmailAdm(null);
					admLogin.setSenhaAdm(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return admLogin;
	}
public boolean validar(AdmLogin admLogin) {
		
		String sqlSelect = "select email, senha from adm where email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obterConexao();
			try(PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setString(1, admLogin.getEmailAdm());
				stm.setString(2, admLogin.getSenhaAdm());
				try (ResultSet rs = stm.executeQuery();){
					if(rs.next()) {
						
						return true;
					}else {
						
						return false;
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}catch (SQLException e1) {
				System.out.println(e1.getStackTrace());
			}
		}catch(SQLException e2) {
			e2.getStackTrace();
		}
		return false;
	}
}
