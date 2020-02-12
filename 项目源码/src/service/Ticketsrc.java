package service;

import domain.Ticket;
import idao.DAOFactory;

import idao.IticketDAO;

public class Ticketsrc {

	private IticketDAO ticketDAO =DAOFactory.creatTicketDAO();
	
	public int add(Ticket ticket) {
		return ticketDAO.insert(ticket);
	}
	
	public int selectBy(int seatid,int scheduleid,int studio) {
		return ticketDAO.selectBy(seatid, scheduleid, studio);
	}
	
	public boolean delete(int schedule_id) {
		return ticketDAO.delete(schedule_id);
	}
	
	public int  update(Ticket ticket) {
		return ticketDAO.update(ticket);
	}
	
}
