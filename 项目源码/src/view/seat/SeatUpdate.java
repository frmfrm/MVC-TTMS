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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.SeatSrv;
import service.StudioSrv;




@WebServlet("/SeatUpdate")

public class SeatUpdate extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public SeatUpdate() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	String s = request.getParameter("s");
	JSONObject jsonseat = JSONObject.fromObject(s);
	String studio = jsonseat.getString("studio");
	JSONArray seats = jsonseat.getJSONArray("seat");
	
	List<Studio> list = new StudioSrv().Fetch("studio_id = '"+Integer.parseInt(studio)+"'");
	Studio studio2 = list.get(0);
	int rowCount = studio2.getRowCount();
	int colCount = studio2.getColCount();
	for(int i=1;i<=rowCount;i++) {
		for(int j = i;j<=colCount;j++) {
			Seat se = new Seat();
			se.setRow(i);
			se.setColumn(j);
			se.setStatus(1);
			se.setStudioId(Integer.parseInt(studio));
			new SeatSrv().modify(se);
		}
	}
	
	int sum = 0;
	for (int i = 0;i<seats.size();i++) {
		JSONObject j = seats.getJSONObject(i);
		String row = j.getString("row");
		String col = j.getString("col");
		Seat se = new Seat();
		se.setStudioId(Integer.parseInt(studio));
		se.setRow(Integer.parseInt(row));
		se.setColumn(Integer.parseInt(col));
		se.setStatus(0);
		sum += new SeatSrv().modify(se);
	}
	
	if(sum==seats.size()) {
		out.write("座位状态修改成功！");
	}
	
	}
	
}

