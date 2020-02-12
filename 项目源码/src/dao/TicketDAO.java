package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.Seat;
import domain.Ticket;
import domain.User;
import idao.IticketDAO;
import util.DBUtil;

/**
 * Created by zhoupan on 17-5-31.
 */
public class TicketDAO implements IticketDAO{
    @Override
    public int insert(Ticket ticket) {
        int flag = 0;
        if (ticket == null) {
            return flag;
        }else {
        	 String sql = "insert into ticket(seat_id,studio_id,ticket_price,ticket_status,schedule_id) VALUES ('"+ ticket.getSeatId()+"','"+ ticket.getStudioId()+"','"+ ticket.getPrice()+"','"+ ticket.getStatus()+"','"+ticket.getScheduleId()+"')";
             DBUtil dbUtil = new DBUtil();
             System.out.println(sql);
     		if(dbUtil.update(sql) > 0) {
     			flag = 1;
     		}
        }
        return flag;

    }
   
    
    
    public int selectBy(int seatid,int scheduleid,int studio) {
    	String sql = "select ticket_id from ticket where "
    			+ "seat_id= '"+seatid+"' "
    			+ " and schedule_id= '"+scheduleid+"'"
    			+ " and studio_id= '"+studio+"'";
    	System.out.println(sql);
    	DBUtil db = new DBUtil();
    	ResultSet rst = db.execQuery(sql);
		int ticket_id =0;
		try {
			if (rst!=null) {
				while(rst.next()){
					ticket_id = rst.getInt("ticket_id");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ticket_id;
    	
    	
    }
    

    @Override
    public boolean delete(int schedule_id) {
        boolean rtu = false;
        String sql = "delete from  ticket ";
		sql += " where schedule_id = " + schedule_id;
		DBUtil db = new DBUtil();
		if(db.update(sql)>0) {
			rtu = true;
		}
        return rtu;
    }

    @Override
    public int update(Ticket ticket) {
       
        String sql = "update ticket set " + " ticket_status ='" + ticket.getStatus()
		+"'";

		sql += " where ticket_id = '" + ticket.getId() +"'";
		System.out.println(sql);
		DBUtil db = new DBUtil();
		return db.update(sql);
    }

    @Override
    public Ticket getTicketByID(int ticket_id) {
    	
    	
        return null;
    }

    @Override
    public ArrayList<Ticket> getTicketByPage(int page) {
        return null;
    }

    @Override
    public ArrayList<Ticket> getTicketBySchedule(int schedule_id) {
        ArrayList<Ticket> list = new ArrayList<>();
//        Connection conn = ConnectionManager.getInstance().getConnection();
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
//            String sql = "select * from ticket where schedule_id = ?";
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, schedule_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Ticket ticket = new Ticket();
//                ticket.setId(rs.getInt("id"));
//                ticket.setSchedule_id(rs.getInt("schedule_id"));
//                ticket.setSeat_id(rs.getInt("seat_id"));
//                ticket.setPlay_id(rs.getInt("play_id"));
//                ticket.setPrice(rs.getFloat("price"));
//                ticket.setStatus(rs.getInt("status"));
//                ticket.setLocktime(rs.getString("locktime"));
//                // 将该用户信息插入列表
//                list.add(ticket);
//            }
//            return list;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            ConnectionManager.close(rs, ps, conn);
           return list;
//        }
    }

    @Override
    public ArrayList<Ticket> getTicketByPlay(int play_id) {
        return null;
    }

    @Override
    public ArrayList<Ticket> getAllTicket() {
        return null;
    }

    @Override
    public Ticket getTicketBySeat(int seat_id) {
        Ticket rtu = null;

//        if (seat_id <= 0) {
//            return rtu;
//        }
//        //获取Connection
//        Connection conn = ConnectionManager.getInstance().getConnection();
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            String sql = "select *  from ticket where seat_id=?;";
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, seat_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                rtu = new Ticket();
//                rtu.setId(rs.getInt("id"));
//                rtu.setSeat_id(rs.getInt("seat_id"));
//                rtu.setSchedule_id(rs.getInt("schedule_id"));
//                rtu.setPlay_id(rs.getInt("play_id"));
//                rtu.setPrice(rs.getFloat("price"));
//                rtu.setStatus(rs.getInt("status"));
//                rtu.setLocktime(rs.getString("locktime"));
//            }
            return rtu;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            ConnectionManager.close(null, ps, conn);
//            return rtu;
//        }
    }

    @Override
    public ArrayList<Ticket> getTicketBySchedule(int page, int schedule_id) {
        return null;
    }

    @Override
    public ArrayList<Ticket> getTicketByPlay(int page, int play_id) {
        return null;
    }
}
