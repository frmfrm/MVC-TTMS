package idao;


import java.util.ArrayList;

import domain.Ticket;

/**
 * Created by zhoupan on 17-5-30.
 */
public interface IticketDAO {

    /*
    private int id;
    private int seat_id;
    private int schedule_id;
    private int play_id;
    private float price;
    private int status;
    private String locktime;
     */

    public int insert(Ticket ticket);

    public boolean delete(int ticket_id);

    public int  update(Ticket ticket);
    public int selectBy(int seatid,int scheduleid,int studio);
    public Ticket getTicketByID(int ticket_id);

    public Ticket getTicketBySeat(int seat_id);

    public ArrayList<Ticket> getTicketBySchedule(int page, int schedule_id);

    public ArrayList<Ticket> getTicketByPlay(int page, int play_id);

    public ArrayList<Ticket> getTicketByPage(int page);

    public ArrayList<Ticket> getTicketBySchedule(int schedule_id);

    public ArrayList<Ticket> getTicketByPlay(int play_id);

    public ArrayList<Ticket> getAllTicket();
}
