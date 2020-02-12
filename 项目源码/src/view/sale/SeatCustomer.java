package view.sale;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Sale;
import domain.Seat;
import domain.Ticket;
import model.dateChange.DateChange;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.SaleSrc;
import service.SeatSrv;

/**
 * Servlet implementation class SeatCustomer
 */
@WebServlet("/SeatCustomer")
public class SeatCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatCustomer() {
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
			for (Seat seat : list) {
				System.out.println("ololol");
			}
			//生成sale 和saleItem
			//获取到前端返回的数据  sal_ID（标识列）,
			//						emp_id,
			//						sale_time 
			//						sale_payment   
			//						sale_change  : 用户是否 退票 0  改签 1 没有操作 2,
			//						sale_type   用户 1 售票员 2
			//						sale_status	
			//=========================saleItem
			//ticket_id, 
			//sale_ID, 
			//sale_item_price 
			Date  date = new Date();   //获取本机时间
			DateChange change = new DateChange();
			Timestamp time  = change.utilChangeToSql(date);
			// sale_type存储是顾客自主购票（1） OR 员工售票（2）
			//用emp_id = 0 表示用户自主购票 
			Sale sale  = new Sale(0, time, (float)1, 2, 1, 0) ;
			int n = new SaleSrc().add(sale);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			if(n ==seats.size()) {
				out.write("成功");
			}
			out.close();
			}
		}
	}

