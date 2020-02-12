package service;

import java.util.List;

import domain.Seat;
import idao.DAOFactory;
import idao.ISeatDAO;

public class SeatSrv {
	private ISeatDAO seatDAO= DAOFactory.creatSeatDAO();
	
	public int add(Seat seat) {
		return seatDAO.insert(seat);
	}
	
	public int modify(Seat seat) {
		return seatDAO.modifylist(seat);
	}
	
	public int delete(int seatID) {
		return seatDAO.delete(seatID);
	}
	public List<Seat> Fetch(String condt){
		return seatDAO.select(condt);		
	}
	
	public List<Seat> FetchAll(){
		return seatDAO.select("");		
	}
	public int updata(Seat seat) {
		return seatDAO.update(seat);
	}
	public int deleteByStudio(int studioId) {
		return seatDAO.deleteByStudio(studioId);
	}
}
