package domain;

public class Ticket {

	/*==============================================================
	create table ticket
	(
	   ticket_id            bigint not null auto_increment,
	   seat_id              int,
	   sched_id             int,
	   ticket_price         numeric(10,2),
	   ticket_status        smallint comment '�������£�
	            0��������
	            1������
	            9������',
	   primary key (ticket_id)
	);
	
	==============================================================*/
	
	private int id;
	private int seatId; 
	//座位的行和列
	private int scheduleId;
	private float price; 
	private int status; 
	private int studioId;//play 的类型
	//开始结束时间    ================  schedule 
	//员工的ID
	//出票时间
	//play 的name ============ 电影名称
	//影院信息
	
	
	public Ticket(int id, int seatId, int studioId, float price, int status,int scheduleId) {
		super();
		this.id = id;
		this.seatId = seatId;
		this.studioId = studioId;
		this.price = price;
		this.status = status;
		this.scheduleId= scheduleId;
	}
	
	
	public Ticket() {
		super();
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSeatId() {
		return seatId;
	}
	public int getScheduleId() {
		return scheduleId;
	}


	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}


	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public int getStudioId() {
		return studioId;
	}
	public void setStudioId(int studioId) {
		this.studioId = studioId;
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
	
}
