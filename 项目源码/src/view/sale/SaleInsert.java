package view.sale;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Sale;
import domain.Seat;
import model.dateChange.DateChange;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.SaleSrc;
import service.SeatSrv;
import service.Ticketsrc;

/**
 * Servlet implementation class SaleInsert
 */
@WebServlet("/SaleInsert")
public class SaleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleInsert() {
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

		//s={"seat":[],"scheduleid":"1","studio":"1","price":"45.0","userid":null,"count":"1"
		String s = request.getParameter("s");
		System.out.println(s);
		JSONObject jsonseat = JSONObject.fromObject(s);
		String studio = jsonseat.getString("studio");
		String scheduleid = jsonseat.getString("scheduleid");
		String price = jsonseat.getString("price");
		String userid = jsonseat.getString("userid");
		String count = jsonseat.getString("count");
		
		JSONArray seats = jsonseat.getJSONArray("seat");
		
		int sum = 0;
		for (int i = 0;i<seats.size();i++) {
			JSONObject j = seats.getJSONObject(i);
			String row = j.getString("row");
			String col = j.getString("col");
			List<Seat> list = new SeatSrv().Fetch(" studio_id = '"+Integer.valueOf(studio)+"'" + " and seat_row = '"+Integer.valueOf(row)+"'" + " and seat_column = '"+Integer.valueOf(col)+"'");
			Seat seat = list.get(0);
			seat.setStatus(0);
			int m = new SeatSrv().modify(seat);
			int seatid = seat.getId();
			
			int ticket_id = new Ticketsrc().selectBy(seatid, Integer.valueOf(scheduleid), Integer.valueOf(studio));
			//public Sale( int empId, java.util.Date date, float d, int change, int type, int status) {
				
			
			Date  date = new Date();   //获取本机时间
			DateChange change = new DateChange();
			Timestamp time  = change.utilChangeToSql(date);
			//Sale sale  = new Sale(0, time, (float)1, 2, 1, 0) ;
			Sale sale = new Sale(Integer.valueOf(userid),time,Integer.valueOf(count)*Float.parseFloat(price),1,1,1);
			int n = new SaleSrc().add(sale);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			System.out.println("sale"+n);
			if(n ==1) {
				out.write("成功");
			}else {
				out.write("失败");
			}
			out.close();
		}
	}

}
