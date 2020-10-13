package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	// singleton da conexão - thread safe
	private static final ThreadLocal<Connection> conn = new ThreadLocal<>();

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	// Obtém conexão com o banco de dados
	public static Connection obterConexao() throws SQLException {
		if (conn.get() == null) {
			conn.set(DriverManager.getConnection(
					"jdbc:mysql://localhost/registro?userTimezone=true&serverTimezone=UTC&useSSL=false&user=root&password=1234"));
		}
		return conn.get();
	}

	// Fecha a conexão - usado no servlet destroy
	public static void fecharConexao() throws SQLException {
		if (conn.get() != null) {
			conn.get().close();
			conn.set(null);
		}
	}
}