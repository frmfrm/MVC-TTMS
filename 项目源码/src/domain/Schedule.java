package domain;

import java.sql.Date;

/**
 * Created by zhoupan on 17-5-30.
 */
public class Schedule {
    private int id;
    private int studio_id;
    private int play_id;
    private String time;
    private float discount;
    private float price;
    private int status;
    private String schedule_name;
    private int ticket_status;
    private String endtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(int studio_id) {
		this.studio_id = studio_id;
	}
	public int getPlay_id() {
		return play_id;
	}
	public void setPlay_id(int play_id) {
		this.play_id = play_id;
	}
	
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String date1) {
		this.time = date1;
	}
	public float getDiscount() {
		return discount;
	}
	public String getSchedule_name() {
		return schedule_name;
	}
	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getTicket_status() {
		return ticket_status;
	}
	public void setTicket_status(int ticket_status) {
		this.ticket_status = ticket_status;
	}
	public Schedule(int id,String name ,int studio_id, int play_id, String time, float discount, float price, int status,int ticket_status,String endtime) {
		super();
		this.id = id;
		this.schedule_name = name;
		this.studio_id = studio_id;
		this.play_id = play_id;
		this.time = time;
		this.discount = discount;
		this.price = price;
		this.status = status;
		this.ticket_status =ticket_status;
		this.endtime = endtime;
	}
	public Schedule(int id, int studio_id, int play_id, String time, float discount, float price, int status,
			String schedule_name) {
		super();
		this.id = id;
		this.studio_id = studio_id;
		this.play_id = play_id;
		this.time = time;
		this.discount = discount;
		this.price = price;
		this.status = status;
		this.schedule_name = schedule_name;
	}
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Schedule(int studio_id, int play_id, String time, float discount, float price, int status,
			String schedule_name, int ticket_status, String endtime) {
		super();
		this.studio_id = studio_id;
		this.play_id = play_id;
		this.time = time;
		this.discount = discount;
		this.price = price;
		this.status = status;
		this.schedule_name = schedule_name;
		this.ticket_status = ticket_status;
		this.endtime = endtime;
	}

    
}
