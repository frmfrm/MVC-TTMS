package view.seat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Seat;
import domain.Studio;
import service.SeatSrv;
import service.StudioSrv;

@WebServlet("/SeatSearch")
public class SeatSearch extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public SeatSearch() {
		
	}
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException  {
		
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		int id =Integer.parseInt( request.getParameter("id"));
		
		List<Seat> list = null;
		Studio studio = null;
		list = new SeatSrv().Fetch("studio_id LIKE '%" + id +"%'");
		studio = new StudioSrv().Fetchone(id);
		String jsonStr = "[";		
		for (Seat s : list) {
			jsonStr += "{\"seat_id\":\""+s.getId() + 
					"\",\"studio_id\":\""+s.getStudioId() +
					"\",\"row\":\""+s.getRow()+
					"\",\"col\":\""+s.getColumn()+
					"\",\"status\":\""+s.getStatus() +
					"\"}";
			jsonStr += ",";
		}
		
		if(list.size()==0)
			jsonStr += "]";
		else
		    jsonStr = jsonStr.substring(0, jsonStr.length()-1)+",{\"rowCount\":\"" + studio.getRowCount()+
					"\",\"colCount\":\"" + studio.getColCount() +"\"}" +"]";
		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.close();
	}
	
}
