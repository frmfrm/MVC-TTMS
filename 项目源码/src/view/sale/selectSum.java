package view.sale;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SaleDAO;
import domain.Sale;
import domain.Studio;

/**
 * Servlet implementation class selectSum
 */
@WebServlet("/selectSum")
public class selectSum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectSum() {
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
		SaleDAO dao = new SaleDAO();
		List<Sale> list = null;
		list = dao.selectAll();
		int sum = dao.selectSum();
		System.out.println(sum);
		String jsonStr = "[";		
		for (Sale s : list) {
			System.out.println(s.getId());
			jsonStr += "{\"saleid\":\""+s.getId() + 
					"\",\"empid\":\""+s.getEmpId() +
					"\",\"time\":\""+s.getTime()+
					"\",\"payment\":\""+s.getPayment()+
					
					"\"}";
			jsonStr += ",";
		}
		if(list.size()==0)
			jsonStr += "]";
		else
		    jsonStr = jsonStr.substring(0, jsonStr.length()-1)+",{\"sum\":\"" +sum+"\"}" +"]";
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.write(jsonStr);
	}

}
