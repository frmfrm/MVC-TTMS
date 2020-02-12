package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.Play;
import domain.User;
import idao.IPlayDAO;
import util.DBUtil;

public class PlayDAO implements IPlayDAO{

	@Override
	public int insert(Play play) {
		try {
			String sql = "insert into play(play_name,play_introduction,play_image,play_length,play_ticket_price,play_status,play_type)"
					+ " values('"+play.getName()+"','"+play.getIntroduction()+"','"+play.getImage()+"','"+play.getLength()+"','"+play.getTicketPrice()+"','"+play.getStatus()+"','"+play.getType()+"')";
			DBUtil db = new DBUtil();
			System.out.println(sql);
			ResultSet rst = db.getInsertObjectIDs(sql);
			if (rst!=null && rst.first()) {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int insertdetail(Play play) {
		String sql = "insert into playdetail(director,mainactor,playintro,play_id)"
				+ " values('"+play.getDirector()+"','"+play.getMainactor()+"','"+play.getDetailintro()+"','"+play.getId()+"')";
		DBUtil db = new DBUtil();
		System.out.println(sql);
		
		return db.execCommand(sql);
		}
	
	@Override
	public int update(Play play) {
		String sql = "update play set " + " play_id ='" + play.getId()
		+ "', "  + "play_name = '"+play.getName()+"'," + "play_introduction='"+play.getIntroduction()+"',"+
		"play_image='"+play.getImage()+"'," + "play_length='"+play.getLength()+"'," + "play_ticket_price='"+play.getTicketPrice()+"'," +
		 "play_status='"+play.getStatus()+"'," + "play_type='"+play.getType()+"'";

		sql += " where play_id = " + play.getId();
		System.out.println(sql);
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
		
	}

	@Override
	public int updatedetail(Play play) {
		String sql = "update playdetail set " 
		+ "mainactor = '"+play.getMainactor()+"'," + "director='"+play.getDirector()+"',"+
		"playintro='"+play.getDetailintro()+"'";

		sql += " where play_id = " + play.getId();
		System.out.println(sql);
		DBUtil db = new DBUtil();
		
		return db.execCommand(sql);
		
	}
	
	@Override
	public int delete(int id) {
		String sql = "delete from  play ";
		sql += " where play_id = " + id;
		System.out.println(sql);
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
		
	}

	@Override
	public int deletedetail(int id) {
		String sql = "delete from  playdetail ";
		sql += " where play_id = " + id;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}
	
	@Override
	public Play select(String name) {
		String sql = "select * from play where play_name = '"+ name +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		Play play = null;
		play = new Play();
		try {
			while(rs.next()) {
				
			play.setId(rs.getInt("play_id"));
			play.setTypeId(rs.getInt("play_type_id"));
			play.setLangId(rs.getInt("play_lang_id"));
			play.setName(rs.getString("play_name"));
			play.setIntroduction(rs.getString("play_introduction"));
			play.setImage(rs.getString("play_image"));
			play.setLength(rs.getInt("play_length"));
			play.setTicketPrice(rs.getFloat("play_ticket_price"));
			play.setStatus(rs.getInt("play_status"));
			play.setType(rs.getString("play_type"));
			
		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return play;
	}

	@Override
	public Play selectdetail(int id) {
		String sql = "select * from playdetail where play_id = '"+ id +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		Play play = null;
		play = new Play();
		try {
			while(rs.next()) {
			play.setDirector(rs.getString("director"));	
			play.setMainactor(rs.getString("mainactor"));
			play.setDetailintro(rs.getString("playintro"));
		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return play;
	}
	
	@Override
	public List<Play> findByType(String type) {
		List<Play> list = null;
		list = new ArrayList<Play>();
		String sql = "select * from play where play_type like '%"+type+"%'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		
		try {
			if(rs!=null) {
			
			while(rs.next()) {
				Play play = new Play();
			play.setId(rs.getInt("play_id"));
			play.setTypeId(rs.getInt("play_type_id"));
			play.setLangId(rs.getInt("play_lang_id"));
			play.setName(rs.getString("play_name"));
			play.setIntroduction(rs.getString("play_introduction"));
			play.setImage(rs.getString("play_image"));
			play.setLength(rs.getInt("play_length"));
			play.setTicketPrice(rs.getFloat("play_ticket_price"));
			play.setStatus(rs.getInt("play_status"));
			play.setType(rs.getString("play_type"));
			
			list.add(play);
		}
	}
		} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Play> findAll() {
		List<Play> list = null;
		list = new ArrayList<Play>();
		String sql = "select * from play";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		
		try {
			if(rs!=null) {
			
			while(rs.next()) {
			Play play = new Play();
			play.setId(rs.getInt("play_id"));
			play.setTypeId(rs.getInt("play_type_id"));
			play.setLangId(rs.getInt("play_lang_id"));
			play.setName(rs.getString("play_name"));
			play.setIntroduction(rs.getString("play_introduction"));
			play.setImage(rs.getString("play_image"));
			play.setLength(rs.getInt("play_length"));
			play.setTicketPrice(rs.getFloat("play_ticket_price"));
			play.setStatus(rs.getInt("play_status"));
			play.setType(rs.getString("play_type"));
			
			list.add(play);
		}
			}
			} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int selectByid(int id) {
		String sql = "select * from play where play_id = '"+ id +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		Play play = null;
		play = new Play();
		try {
			while(rs.next()) {
				if(rs.getInt(1) == id) {
					System.out.println("==================时长：" + rs.getInt("play_length"));
					return rs.getInt("play_length");	
				}

		}} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		return 0;
		
}


	

	

	
	
}
