package view.ticket;

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
import domain.Ticket;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.SeatSrv;
import service.StudioSrv;
import service.Ticketsrc;

/**
 * Servlet implementation class TicketUpdate
 */
@WebServlet("/TicketUpdate1")
public class TicketUpdate1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketUpdate1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String s = request.getParameter("s");
		JSONObject jsonseat = JSONObject.fromObject(s);
		String studio = jsonseat.getString("studio");
		String scheduleid = jsonseat.getString("scheduleid");
		JSONArray seats = jsonseat.getJSONArray("seat");
		int sum = 0;
		for (int i = 0;i<seats.size();i++) {
			JSONObject j = seats.getJSONObject(i);
			String row = j.getString("row");
			String col = j.getString("col");
			List<Seat> list = new SeatSrv().Fetch(" studio_id = '"+Integer.valueOf(studio)+"'" + " and seat_row = '"+Integer.valueOf(row)+"'" + " and seat_column = '"+Integer.valueOf(col)+"'");
			Seat seat = list.get(0);
			seat.setStatus(1);
			int m = new SeatSrv().modify(seat);
			int seatid = seat.getId();
			
			int ticket_id = new Ticketsrc().selectBy(seatid, Integer.valueOf(scheduleid), Integer.valueOf(studio));
			System.out.println(ticket_id);
			Ticket ticket = new Ticket();
			ticket.setId(ticket_id);
			ticket.setStatus(1);
			int n = new Ticketsrc().update(ticket);
			sum = sum+n;
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
			
		out.write("成功");
		out.close();
		
		
		}
		
		
	
	
}
