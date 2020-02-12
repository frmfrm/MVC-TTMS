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
import service.UserSrv;

@WebServlet("/EmloyeeUpdate")
public class EmployeeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Employee employee= null;
		String type = request.getParameter("type");
		System.out.println(type);
		int user_id = 0;
		try {
			if (type.equals("modifyStatus")) {
				user_id = Integer.valueOf(request.getParameter("user_id"));
				System.out.println(user_id);
			}
//			
			
			int status=Integer.valueOf(request.getParameter("status"));
			
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			 if(type.equals("modifyStatus")){
				if(new EmployeeSrc().updateStatus(status, user_id)==1&&new UserSrv().modifystatus(request.getParameter("status"), user_id)==1)
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
