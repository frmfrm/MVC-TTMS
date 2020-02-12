package view.schdule;

import java.awt.Window.Type;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Schedule;
import domain.Studio;
import service.ScheduleSrv;
import service.StudioSrv;
@WebServlet("/ScheduleSearch")
public class ScheduleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScheduleSearch() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
	if(type.equals("searchall")) {
		String name = request.getParameter("name");
		System.out.println(name);
		name=new String(name.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(name);
		//PrintWriter out = response.getWriter();
		List<Schedule> result = null;
		if(name!=null && name.length()>0)
			result = new ScheduleSrv().Fetch(name);
		else
			result = new ScheduleSrv().FetchAll();
		for (Schedule s : result) {
			System.out.println(s.getId());
			System.out.println(s.getSchedule_name());
			System.out.println(s.getPlay_id());
			System.out.println(s.getStudio_id());
			System.out.println(s.getTime());
			System.out.println(s.getDiscount());
			System.out.println(s.getPrice());
			System.out.println(s.getStatus());
			System.out.println("iiii"+s.getTicket_status());
			System.out.println(s.getEndtime());
		}
		System.out.println("+++++++++++++++++++++++++++++++++++");
		String jsonStr = "[";		
		for (Schedule s : result) {
			System.out.println(s.getSchedule_name() + "kkk" + s.getTicket_status());
			jsonStr += "{\"Schedule_id\":\""+s.getId() + 
					"\",\"Schedule_name\":\""+s.getSchedule_name() +
					"\",\"play_id\":\""+s.getPlay_id()+
					"\",\"studio_id\":\""+s.getStudio_id()+
					"\",\"time\":\""+s.getTime()+
					"\",\"discount\":\""+s.getDiscount()+
					"\",\"price\":\""+s.getPrice()+
					"\",\"status\":\""+s.getStatus()+ 
					"\",\"ticket_status\":\""+s.getTicket_status()+
					"\",\"endtime\":\""+s.getEndtime()+ "\"}";
			jsonStr += ",";
		}
		if(result.size()==0)
			jsonStr += "]";
		else
		jsonStr = jsonStr.substring(0, jsonStr.length()-1)+"]";
		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.close();
		}else if(type.equals("search")){
		String playid = request.getParameter("playid");
		List<Schedule> list = null;
		list = new ScheduleSrv().Fetch(" play_id = '"+Integer.valueOf(playid)+"'");
		//var json = [{"Schedule_id":"38","Schedule_name":"56","play_id":"5","studio_id":"2","time":"2017-01-01 00:00:00","discount":"1.0","price":"12.0","status":"1","ticket_status":"0","endtime":"2017-01-01 02:30:00"},{"Schedule_id":"39","Schedule_name":"1","play_id":"5","studio_id":"2","time":"2017-01-01 00:00:00","discount":"1.0","price":"1.0","status":"1","ticket_status":"0","endtime":"2017-01-01 02:30:00"},{"Schedule_id":"40","Schedule_name":"56","play_id":"5","studio_id":"2","time":"2017-01-01 00:00:00","discount":"1.0","price":"12.0","status":"1","ticket_status":"0","endtime":"2017-01-01 02:30:00"}];
		String jsonStr = "[";		
		for (Schedule s : list) {
			System.out.println(s.getSchedule_name() + "kkk" + s.getTicket_status());
			jsonStr += "{\"Schedule_id\":\""+s.getId() + 
					"\",\"Schedule_name\":\""+s.getSchedule_name() +
					"\",\"play_id\":\""+s.getPlay_id()+
					"\",\"studio_id\":\""+s.getStudio_id()+
					"\",\"time\":\""+s.getTime()+
					"\",\"discount\":\""+s.getDiscount()+
					"\",\"price\":\""+s.getPrice()+
					"\",\"status\":\""+s.getStatus()+ 
					"\",\"ticket_status\":\""+s.getTicket_status()+
					"\",\"endtime\":\""+s.getEndtime()+ "\"}";
			jsonStr += ",";
		}
		if(list.size()==0)
			jsonStr += "]";
		else
		jsonStr = jsonStr.substring(0, jsonStr.length()-1)+"]";
		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.close();
		}
	}
}
