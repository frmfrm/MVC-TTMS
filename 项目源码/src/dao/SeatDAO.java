package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import domain.Seat;
import domain.Studio;
import idao.ISeatDAO;
import util.DBUtil;

public class SeatDAO implements ISeatDAO {

	@Override
	public int insert(Seat seat) {
		try {
			String sql = "insert into seat(seat_id, studio_id, seat_row, seat_column,seat_status)"
					+ " values('"
					+ seat.getId()
					+ "', '"
					+ seat.getStudioId()
					+ "', '" + seat.getRow()
					+ "', '" + seat.getColumn()
					+"','"+ seat.getStatus()
					+ "' )";	
			DBUtil db = new DBUtil();
			ResultSet rst = db.getInsertObjectIDs(sql);
			if (rst!=null && rst.first()) {
				seat.setId(rst.getInt(1));
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
			

	@Override
	public int update(Seat seat) {
		
		String sql = "update seat set " + " studio_id = '" + seat.getStudioId() 
		+ "', " + " seat_row = '" + seat.getRow() + "', "
		+ " seat_column = '" + seat.getColumn() + "', "
		+"seat_status = '"+seat.getStatus()+"'";

		sql += " where seat_id = " + seat.getId();

		DBUtil db = new DBUtil();

		return db.execCommand(sql);
	}

	@Override
	public int delete(int seatID) {
		String sql = "delete from  seat ";
		sql += " where seat_id = " + seatID;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}

	@Override
	public List<Seat> select(String condt) {
		List<Seat> seatList = null;
		seatList=new LinkedList<Seat>();
		try {
			String sql = "select seat_id, studio_id, seat_row, seat_column,seat_status from seat ";
			condt.trim();
			if(!condt.isEmpty())
				sql+= " where " + condt;
			System.out.println(sql);
			DBUtil db = new DBUtil();
			ResultSet rst = db.execQuery(sql);
			/*System.out.print("sql:"+sql);*/
			if (rst!=null) {
				while(rst.next()){
					Seat seat=new Seat();
					seat.setId(rst.getInt("seat_id"));
					seat.setStudioId(rst.getInt("studio_id"));
					seat.setRow(rst.getInt("seat_row"));
					seat.setColumn(rst.getInt("seat_column"));
					seat.setStatus(rst.getInt("seat_status"));
					seatList.add(seat);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return seatList;
	}


	@Override
	public int modifylist(Seat seat) {
		
		String sql = "update seat set " +"seat_status = '"+seat.getStatus()+"'";

		sql += " where seat_row = '" + seat.getRow() + "'" + " and seat_column = '"+seat.getColumn()+"'"+ " and studio_id='"+seat.getStudioId()+"'";
		System.out.println(sql);
		DBUtil db = new DBUtil();

		return db.execCommand(sql);
		
	}


	@Override
	public int deleteByStudio(int studioId) {
		String sql = "delete from  seat ";
		sql += " where studio_id = " + studioId;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
		
		
	}
	

}
