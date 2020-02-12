package view.seat;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Seat;
import domain.Studio;
import service.SeatSrv;
import service.StudioSrv;

@WebServlet("/SeatUpdateDing")
public class SeatUpdateDing extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public SeatUpdateDing() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Seat seat = null;
		String type = request.getParameter("type");
		int id = 0;
		try {
			if (type.equals("modify")) {
				id = Integer.valueOf(request.getParameter("seatid"));
			}
			int studioId= Integer.valueOf(request.getParameter("studioid"));
			//studioId=new String(studioId.getBytes("ISO-8859-1"),"utf-8");
			int row = Integer.valueOf(request.getParameter("seatrow"));
			int column = Integer.valueOf(request.getParameter("seatcolumn"));
			int status = Integer.valueOf(request.getParameter("seatstatus"));
			seat = new Seat(id, studioId, row, column,status);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (type.equals("add")) {
				if(new SeatSrv().add(seat)==1)
					out.write("数据添加成功");
				else
					out.write("数据添加失败，请重试");
			} else{
				if(new SeatSrv().modify(seat)==1)
					out.write("数据修改成功");
				else
					out.write("数据修改失败，请重试");
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("操作错误，请重试");
		}
	}
}

