package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import domain.Play;
import domain.Schedule;
import domain.Studio;
import idao.IScheduleDAO;
import model.dateChange.DateChange;
import util.DBUtil;

public class ScheduleDAO implements IScheduleDAO{

	public int insert(domain.Schedule schedule) {
		DateChange change = new DateChange();
		String time = schedule.getTime();
		java.util.Date time1 =  change.strChangeToUtil(time);
		Timestamp timesql = change.utilChangeToSql(time1);
		String time2 = schedule.getEndtime();
		java.util.Date time3 =  change.strChangeToUtil(time2);
		Timestamp time4 = change.utilChangeToSql(time3);
	//	System.out.println(timesql);
		String sql = "insert into schedule(schedule_name,studio_id, play_id,schedule_time,discount,price,status,isticket,end_time)"
				+ " values('"+schedule.getSchedule_name()+ "', '"+schedule.getStudio_id()+ "', '" + schedule.getPlay_id()+ "', '" + timesql+ "','"+ schedule.getDiscount()+ "','"+ schedule.getPrice()+ "','"+ schedule.getStatus()+ "','"+ schedule.getTicket_status()+ "','"+ time4 + "')";
		System.out.println(sql);
		DBUtil db = new DBUtil();
		int n = db.execCommand(sql);
		if (n > 0) {
			String sql2 = "select * from schedule  where schedule_name = '"+ schedule.getId() +"'";
			ResultSet rs = db.execQuery(sql2);
			int schedule_id = -1;
			try {
				while (rs.next()) {
					schedule_id = rs.getInt("schedule_id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			schedule.setId(schedule_id);
			return 1;
		}		
		int rst = db.update(sql);
		System.out.println(rst);
		if (rst != -1) {
			return 1;
		}
		
		return 0;
	}

	@Override
	public int update(Schedule schedule) {
		DateChange change = new DateChange();
		System.out.println(schedule.getTime());
		String time = schedule.getTime();
		java.util.Date time1 =  change.strChangeToUtil(time);
		Timestamp timesql = change.utilChangeToSql(time1);
		String time2 = schedule.getEndtime();
		java.util.Date time3 =  change.strChangeToUtil(time2);
		Timestamp time4 = change.utilChangeToSql(time3);
		String sql = "update schedule set " +  " schedule_name = '"+schedule.getSchedule_name()+"' , " + " studio_id = '"+schedule.getStudio_id()+"'," + 
		 "play_id= '"+schedule.getPlay_id()+"'," + "schedule_time = '"+timesql+"'," + "discount = '"+schedule.getDiscount()+"',"+
		"price='"+schedule.getPrice()+"'," + "status='"+schedule.getStatus()+"'" ;

		sql += " where  schedule_name = '"+schedule.getSchedule_name()+"'";
		System.out.println(sql);
		DBUtil db = new DBUtil();
		System.out.println(sql);
		return db.execCommand(sql);
	}

	@Override
	public int delete(int id) {
		String sql = "delete from  schedule ";
		sql += " where schedule_id = " + id;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}

	@Override
	public domain.Schedule select(int id) {
		String sql = "select * from schedule where  schedule= '"+ id +"'";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		Schedule schedule = null;
		schedule = new Schedule();
		DateChange change = new DateChange();
		try {
			while(rs.next()) {
				schedule.setId(rs.getInt(1));
				schedule.setSchedule_name(rs.getString(2));
				schedule.setStudio_id(rs.getInt(3));
				schedule.setPlay_id(rs.getInt(4));
				Timestamp date = rs.getTimestamp("schedule_time");
			//	System.out.println(rs.getDate("schedule_time").toString());
				System.out.println(date);
				java.util.Date date1 =change.sqlChangeToUtil(date);
				//System.out.println(date1);
				String date2 = change.utilChangeToStr(date1);
				schedule.setTime(date2);
				schedule.setDiscount(rs.getInt(6));
				schedule.setPrice(rs.getInt(7));
				schedule.setStatus(rs.getInt(8));
				schedule.setTicket_status(rs.getInt(9));
				
			}
		} catch (SQLException e) {
			System.out.println("catch");
			e.printStackTrace();
		}
		return schedule;
	}

//	@Override
//	public List<domain.Schedule> findByType(String status ) {
//		List<Schedule> list = null;
//		list = new ArrayList<Schedule>();
//		String sql = "select * from schedule where status like '%"+ status +"%'";
//		System.out.println(sql);
//		DBUtil util = new DBUtil();
//		ResultSet rs = util.execQuery(sql);
//		
//		Schedule schedule = new Schedule();
//		try {
//			while(rs.next()) {
//				schedule.setId(rs.getInt(1));
//				schedule.setStudio_id(rs.getInt(2));
//				schedule.setPlay_id(rs.getInt(3));
//				schedule.setTime(rs.getDate(4));
//				schedule.setDiscount(rs.getInt(5));
//				schedule.setPrice(rs.getInt(6));
//				schedule.setStatus(rs.getInt(7));
//				
//				list.add(schedule);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return list;
//	}

	@Override
	public List<domain.Schedule> findAll() {
		List<Schedule> list = null;
		list = new ArrayList<Schedule>();
		String sql = "select * from schedule";
		System.out.println(sql);
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		DateChange change = new DateChange();
	//	Schedule schedule = new Schedule();
		try {
			while(rs.next()) {
				Schedule schedule = new Schedule();
				schedule.setId(rs.getInt(1));
				schedule.setSchedule_name(rs.getString(2));
				schedule.setStudio_id(rs.getInt(3));
				schedule.setPlay_id(rs.getInt(4));
				Timestamp date = rs.getTimestamp("schedule_time");
			//	System.out.println(rs.getDate("schedule_time").toString());
				System.out.println(date);
				java.util.Date date1 =change.sqlChangeToUtil(date);
				//System.out.println(date1);
				String date2 = change.utilChangeToStr(date1);
				schedule.setTime(date2);
				schedule.setDiscount(rs.getInt(6));
				schedule.setPrice(rs.getInt(7));
				schedule.setStatus(rs.getInt(8));
				schedule.setTicket_status(rs.getInt(9));
				Timestamp end = (rs.getTimestamp("end_time"));
				java.util.Date date4 =change.sqlChangeToUtil(end);
				//System.out.println(date1);
				String date3 = change.utilChangeToStr(date4);
				schedule.setEndtime(date3);
				list.add(schedule);
				System.out.println("================================");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int delete(String sql) {
		System.out.println(sql);
		DBUtil db = new DBUtil();
		return db.execCommand(sql);

	}

	@Override
	public List<Schedule> findBySql(String sql) {
		List<Schedule> list = null;
		list = new ArrayList<Schedule>();
		DBUtil util = new DBUtil();
		ResultSet rs = util.execQuery(sql);
		DateChange change = new DateChange();
	//	Schedule schedule = new Schedule();
		try {
			while(rs.next()) {
				while(rs.next()) {
					Schedule schedule = new Schedule();
					schedule.setId(rs.getInt(1));
					schedule.setSchedule_name(rs.getString(2));
					schedule.setStudio_id(rs.getInt(3));
					schedule.setPlay_id(rs.getInt(4));
					Timestamp date = rs.getTimestamp("schedule_time");
				//	System.out.println(rs.getDate("schedule_time").toString());
					System.out.println(date);
					java.util.Date date1 =change.sqlChangeToUtil(date);
					//System.out.println(date1);
					String date2 = change.utilChangeToStr(date1);
					schedule.setTime(date2);
					schedule.setDiscount(rs.getInt(6));
					schedule.setPrice(rs.getInt(7));
					schedule.setStatus(rs.getInt(8));
					schedule.setTicket_status(rs.getInt(9));
					Timestamp end = (rs.getTimestamp("end_time"));
					java.util.Date date4 =change.sqlChangeToUtil(end);
					//System.out.println(date1);
					String date3 = change.utilChangeToStr(date4);
					schedule.setEndtime(date3);
					list.add(schedule);
					System.out.println("================================");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Schedule> select(String condt) {
		List<Schedule> list = null;
		list = new ArrayList<Schedule>();
			String sql = "select * from schedule ";
			condt.trim();
			if(!condt.isEmpty())
				sql+= " where "  + condt;
			System.out.println(sql);
			DBUtil db = new DBUtil();
			ResultSet rs = db.execQuery(sql);
			//System.out.print("sql:"+sql);
			
			DateChange change = new DateChange();
			try {
				while(rs.next()) {
					Schedule schedule = new Schedule();
					schedule.setId(rs.getInt(1));
					schedule.setSchedule_name(rs.getString(2));
					schedule.setStudio_id(rs.getInt(3));
					schedule.setPlay_id(rs.getInt(4));
					Timestamp date = rs.getTimestamp("schedule_time");
				//	System.out.println(rs.getDate("schedule_time").toString());
					System.out.println(date);
					java.util.Date date1 =change.sqlChangeToUtil(date);
					//System.out.println(date1);
					String date2 = change.utilChangeToStr(date1);
					schedule.setTime(date2);
					schedule.setDiscount(rs.getInt(6));
					schedule.setPrice(rs.getInt(7));
					schedule.setStatus(rs.getInt(8));
					schedule.setTicket_status(rs.getInt(9));
					Timestamp end = (rs.getTimestamp(10));
					System.out.println(end + "end=====================");
					java.util.Date date4 =change.sqlChangeToUtil(end);
					//System.out.println(date1);
					String date3 = change.utilChangeToStr(date4);
					schedule.setEndtime(date3);
					list.add(schedule);
					System.out.println("================================");
				}
				for (Schedule s : list) {
					System.out.println(s.getId());
					System.out.println(s.getSchedule_name());
					System.out.println(s.getPlay_id());
					System.out.println(s.getStudio_id());
					System.out.println(s.getTime());
					System.out.println(s.getDiscount());
					System.out.println(s.getPrice());
					System.out.println(s.getStatus());
					System.out.println(s.getTicket_status());
					System.out.println(s.getEndtime());
				}
				System.out.println("+++++++++++++++++++++++++++++++++++");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
	
}
