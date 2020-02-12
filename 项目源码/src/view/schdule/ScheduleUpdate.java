package view.schdule;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dateChange.*;
import domain.Play;
import domain.Schedule;
import domain.Studio;
import service.ScheduleSrv;
import service.StudioSrv;
import dao.*;

@WebServlet("/ScheduleUpdate")
public class ScheduleUpdate  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScheduleUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Schedule schedule = null;
		String type = request.getParameter("type");
		System.out.println(type);
		int id = 0;
		int Studio_id = 0;
		DateChange change = new DateChange();
		try {
			if (type.equals("modify")) {
				id = Integer.valueOf(request.getParameter("Schedule_id"));
			}
			
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
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
//			if ("add".equals(type)) {
//				schedule = new Schedule(Studio_id, Play_id, time, Discount, Price, Status, name, ticket_status, endtime);
//				
//				if(new ScheduleSrv().add(schedule)>=1)
//					out.write("数据添加成功");
//				else
//					out.write("数据添加失败，请重试");
//			} else if("modify".equals(type)){
//				schedule = new Schedule(id, name, Studio_id, Play_id, time,Discount,Price,Status,ticket_status,endtime);
//				if(new ScheduleSrv().modify(schedule)>=1)
//					out.write("数据修改成功");
//				else
//					out.write("数据修改失败，请重试");
//			}
//			out.close();
			if ("add".equals(type)) {   //时间必须大于当前日期
				schedule = new Schedule(Studio_id, Play_id, time, Discount, Price, Status, name, ticket_status, endtime);
				
				if(time1.compareTo(new java.util.Date()) > 0 ) {
					List<Schedule> result = null;
					result = new ScheduleSrv().FetchAll();
					for (Schedule s : result) {
						java.util.Date  date1 = change.strChangeToUtil (s.getEndtime()) ;
						java.util.Date  date2 = change.strChangeToUtil (s.getTime()) ;	
						if(time1.compareTo(date2) >= 0  && time1.compareTo(date1) <= 0 )  {  //大于开始时间  小于结束时间   
							out.write("该时间段该影厅存在一场未结束的电影,请重新考虑 建议不要设在 " +s.getTime()+ "--"+ s.getEndtime() +"或者更换演出厅");
							return;
						}else {
							if(new ScheduleSrv().add(schedule)>=1) {
								out.write("数据添加成功");
								return;
							}
							else {
								out.write("数据添加失败，请重试");
								return;
							}
						}
					}
					
				}else
					out.write("请输入正确的时间,请重试");
			} else if("modify".equals(type)){
				schedule = new Schedule(Studio_id, Play_id, time, Discount, Price, Status, name, ticket_status, endtime);
				
				if(time1.compareTo(new java.util.Date()) > 0 ) {
					List<Schedule> result = null;
					result = new ScheduleSrv().FetchAll();
					for (Schedule s : result) {
						java.util.Date  date1 = change.strChangeToUtil (s.getEndtime()) ;
						java.util.Date  date2 = change.strChangeToUtil (s.getTime()) ;	
						if(time1.compareTo(date2) >= 0  && time1.compareTo(date1) <= 0 )  {  //大于开始时间  小于结束时间   
							out.write("该时间段该影厅存在一场未结束的电影,请重新考虑 建议不要设在 " +s.getTime()+ "--"+ s.getEndtime() +"或者更换演出厅");
							return;
						}else {
							if(new ScheduleSrv().modify(schedule)>=1) {
								out.write("数据修改成功");
								return;
							}
							else {
								out.write("数据修改失败，请重试");
								return;
							}
						}
					}
					
				}else
					out.write("请输入正确的时间,请重试");
				
			}
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("操作错误，请重试");
		}
	}
	

	
}
