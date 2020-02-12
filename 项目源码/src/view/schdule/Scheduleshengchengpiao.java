package view.schdule;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dateChange.*;
import domain.Play;
import domain.Schedule;
import domain.Seat;
import domain.Studio;
import domain.Ticket;
import service.ScheduleSrv;
import service.SeatSrv;
import service.StudioSrv;
import dao.*;

@WebServlet("/Scheduleshengchengpiao")
public class Scheduleshengchengpiao  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Scheduleshengchengpiao() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Schedule schedule = null;
		Seat seat = null;
		String type = request.getParameter("type");
		System.out.println(type);
		int id = 0;
		int Studio_id = 0;
		DateChange change = new DateChange();
		try {
//			if (type.equals("modify")) {
//				id = Integer.valueOf()
//			}
			int schedule_id = Integer.valueOf(request.getParameter("Schedule_id"));
			System.out.println(schedule_id);

			String name = request.getParameter("Schedule_name");
			System.out.println("name:"+name);
			name = new String(name.getBytes("ISO-8859-1"),"utf-8");
			int Play_id = Integer.valueOf(request.getParameter("play_id"));
			System.out.println(Play_id);
			Studio_id = Integer.parseInt(request.getParameter("studio_id"));
			System.out.println(Studio_id);
//			Date date = new Date(date)
			String time = request.getParameter("time");
			time=new String(time.getBytes("ISO-8859-1"),"utf-8");
			java.util.Date  time1 = change.strChangeToUtil(time);
			System.out.println(time1);
			float Discount = Float.valueOf(request.getParameter("discount").trim());
			System.out.println(Discount);
			float Price = Float.valueOf(request.getParameter("price").trim());
			System.out.println(Price);
			int Status = Integer.valueOf(request.getParameter("play_type"));
			System.out.println(Status);
//			int ts = Integer.valueOf(request.getParameter("ticket"));
//			System.out.println(ts);
			int ticket_status = Integer.valueOf(request.getParameter("ticket_status"));
			System.out.println(Status);
			System.out.println(ticket_status + "===================================================");
			String start = change.utilChangeToStr(time1);
			DateAdd dateAdd = new DateAdd();
			PlayDAO playDAO = new PlayDAO();
			int t =  playDAO.selectByid(Play_id);
			String endtime = dateAdd.addbetween(start, t);
			
			
			schedule = new Schedule(schedule_id, name, Studio_id, Play_id, time,Discount,Price,Status,ticket_status,endtime);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if ("add".equals(type)) {
				if(new ScheduleSrv().add(schedule)>=1)
					out.write("数据添加成功");
				else
					out.write("数据添加失败，请重试");
			} else if("modify".equals(type)){
				if(new ScheduleSrv().modify(schedule)>=1)
					out.write("数据修改成功");
				else
					out.write("数据修改失败，请重试");
			}else {  //生成票 (根据studio_id查询seat表 )
				if(createTicket(Studio_id,Price,schedule_id,schedule) >=1) {   //生成票成功
					out.write("1");
				}else 
					out.write("0");
				
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("操作错误，请重试");
		}
	}
	public int createTicket(int studio_id,float Price,int schedule_id, Schedule schedule) {
		int n = 0;
		//String condt = studio_id = "+ studio_id+";
		String id = Integer.toString(studio_id);
		List<Seat> list = new ArrayList<Seat>();
		if(studio_id>0)
			list = new SeatSrv().Fetch(id); //根据studioid 查询1号演出厅的所有座位  
		else
			return 0;  //如果ID<0  返回0
		for (Seat s : list) {  //遍历list() 将每一个座位insert进ticket表里
			Ticket ticket = new Ticket();
			ticket.setSeatId(s.getId());
			System.out.println("seat_id :" + s.getId());
			ticket.setPrice(Price);
			ticket.setStudioId(studio_id);
			ticket.setScheduleId(schedule.getId());
			if(s.getStatus() == 0) {
				ticket.setStatus(0);  //座位坏了票不可卖
			}else {
				ticket.setStatus(1); 
			}
			n = n + new TicketDAO().insert(ticket);
			
		}
		if(n <= 0) {
			return 0;  
		}else
			System.out.println("+++++++++++++++++++++插入多少张票======================"  + n);
			return n; 
		//返回插入多少张票
	}

	
}
