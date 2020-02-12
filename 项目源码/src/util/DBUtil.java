package util;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	private final String URL = "jdbc:mysql://localhost:3306/ttms?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	private final String USERNAME = "root";
	private final String PASSWORD = "include";
	private Connection conn = null;

	private Statement sta = null;

	private ResultSet rs = null;

	private Connection createConn() {
		Connection conn = null;
		try {
			Class.forName("org.gjt.mm.mysql.Driver"); //classLoader,加载对应驱动
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	
	// 查询并得到结果集
	public ResultSet execQuery(String sql) {
		ResultSet set = null;
		try {
			Connection conn = createConn();
			Statement stmt = conn.createStatement();
			set = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return set;
	}
	
	

	// 插入一条新纪录，并获取标识列的值
	public ResultSet getInsertObjectIDs(String insertSql) {
		ResultSet rst = null;
		try {
			Connection conn = createConn();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(insertSql, Statement.RETURN_GENERATED_KEYS);
			rst = stmt.getGeneratedKeys();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rst;
	}

	// 插入、更新、删除
	public int execCommand(String sql) {
		int flag = 0;
		try {
			Connection conn = createConn();
			Statement stmt = conn.createStatement();
			flag = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 释放资源
	public void closeDB(Object obj) {
		try {
			if (obj instanceof Connection) {
				Connection con = (Connection) obj;
				con.close();
			}
			if (obj instanceof Statement) {
				Statement sta = (Statement) obj;
				sta.close();
			}
			if (obj instanceof ResultSet) {
				ResultSet rst = (ResultSet) obj;
				rst.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int update(String sql) {
		int flag = 0;
		try {
			Connection conn = createConn();
			Statement stmt = conn.createStatement();
			flag = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	
}
