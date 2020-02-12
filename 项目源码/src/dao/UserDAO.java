package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import domain.Studio;
import domain.User;
import idao.IUserDAO;
import util.DBUtil;

public class UserDAO implements IUserDAO{

	@Override
	public int insert(User user) {
		try {
			String sql = "insert into user(user_name, user_password,user_status)"
					+ " values('"
					+ user.getName()
					+ "', "
					+ " '"+ user.getPassword()
					+"', "
					+" '" + user.getStatus()
					+"')";
			System.out.println(sql);
			DBUtil db = new DBUtil();
			ResultSet rst = db.getInsertObjectIDs(sql);
			if (rst!=null && rst.first()) {
				user.setId(rst.getInt(1));
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	

	@Override
	public int insertDetail(User user) {
		String sql = "insert into userdetail(user_id)"
				+ " values('"
				+ user.getId()
				+"' )";
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
		
	}
	

	

	@Override
	public int update(User user) {
		String sql = "update user set " + " user_name ='" + user.getName()
		+ "', " + " user_password = '" + user.getPassword() 
		+ "' ";
		
		sql += " where user_id = " + user.getId();
		
		System.out.println(sql);
		
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
	}
	
	
	
	@Override
	public int updateDetail(User user) {
		String sql = "update userdetail set " + " user_telNum ='" + user.getUser_telNum()
		+ "', " + " user_address = '" + user.getUser_address()
		+ "', " + " user_bankcarid = '" + user.getUser_bankcarid()
		+ "', " + " user_sex = '" + user.getUser_sex()
		+ "', " + " user_age = '" + user.getUser_age()
		+ "' ";
		
		sql += " where user_id = " + user.getId();
		System.out.println(sql);
		
		
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
	
	}

	@Override
	public int updatestatus(String status,int id) {
		String sql = "update user set " + " user_status ='" + status
		+ "' ";
		
		sql += " where user_id = " + id;
		
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
	}
	
	@Override
	public int delete(int ID) {
		String sql = "delete from  user ";
		sql += " where user_id = " + ID;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}

	@Override
	public User select(User user) {
		
		
		String sql = "select * from user where user_name = '"+ user.getName() +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		System.out.println(rs + "ooo");
		User user1 = new User();
		try {
			while(rs.next()) {
			user1.setId(rs.getInt(1));
			user1.setName(rs.getString(2));
			user1.setPassword(rs.getString(3));
			user1.setStatus(rs.getString(4));
			System.out.println(user1.getName() + user1.getPassword() + "ppp");
		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return user1;
	}


	@Override
	public User selectuser(int id) {
		String sql = "select * from user where user_id = '"+ id +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		User user1 = new User();
		try {
			while(rs.next()) {
			user1.setName(rs.getString(2));
			user1.setPassword(rs.getString(3));
			user1.setStatus(rs.getString(4));
			System.out.println(user1.getName() + user1.getPassword() + "ppp");
		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return user1;
		
	}


	@Override
	public User selectUserdetail(int id) {
		String sql = "select * from userdetail where user_id = '"+ id +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		User user1 = new User();
		try {
			while(rs.next()) {
			user1.setUser_telNum(rs.getString(1));
			user1.setUser_address(rs.getString(2));
			user1.setUser_bankcarid(rs.getString(3));
			user1.setUser_paypwd(rs.getString(4));
			System.out.println(user1.getName() + user1.getPassword() + "ppp");
		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return user1;
	}


	

	


}
