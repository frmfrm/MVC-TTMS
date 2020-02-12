package view.employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Employee;
import service.EmployeeSrc;


@WebServlet("/EmployeeDelete")
public class EmployeeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int user_id = Integer.valueOf(request.getParameter("user_id"));
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(""+new EmployeeSrc().delete(user_id));
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("操作错误，请重试");
		}
	}
}