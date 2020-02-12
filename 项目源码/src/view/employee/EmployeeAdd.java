package view.employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Employee;
import domain.User;
import service.EmployeeSrc;
import service.UserSrv;

/**
 * Servlet implementation class EmployeeAdd
 */
@WebServlet("/EmployeeAdd")
public class EmployeeAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeAdd() {
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
		String user_id = request.getParameter("user_id");
		String user_status = request.getParameter("status");
		
		User user = new UserSrv().Finduser(Integer.valueOf(user_id));
		User userdetail = new UserSrv().FindUserdetaile(Integer.valueOf(user_id));
		
		Employee employee = new Employee();
		
		employee.setEmp_name(user.getName());
		employee.setUser_pwd(user.getPassword());
		employee.setAddress(userdetail.getUser_address());
		employee.setBankcarid(userdetail.getUser_bankcarid());
		employee.setEmp_telNum(userdetail.getUser_telNum());
		employee.setPaypwd(userdetail.getUser_paypwd());
		employee.setUser_id(Integer.valueOf(user_id));
		employee.setEmp_no("1");
		employee.setStatus(Integer.parseInt(user_status));
		
		int n = new EmployeeSrc().add(employee);
		int m = new UserSrv().modifystatus(user_status, Integer.valueOf(user_id));
		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		
		
		if(n==1&&m==1) {
			out.write("添加成功！");
				
		}
		out.close();
		
	}

}
