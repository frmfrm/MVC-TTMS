package view.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Employee;
import service.EmployeeSrc;

@WebServlet("/EmployeeSearch")
public class EmployeeSearch extends HttpServlet{
	private static final long serialVersionUID=1L;
	public EmployeeSearch() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String status = request.getParameter("status");
		List<Employee> result = null;
		System.out.println(user_id);
		if(user_id!=null&&user_id.length()>0) {
			result = new EmployeeSrc().Fetch("user_id = '" + Integer.valueOf(user_id) +"'");			
		}
			
		else
			result = new EmployeeSrc().FetchALL();
		String jsonStr = "[";		
		for (Employee employee : result) {
			jsonStr += "{\"user_id\":\""+employee.getUser_id()+ 
					"\",\"emp_no\":\""+employee.getEmp_no()+
					"\",\"emp_name\":\""+employee.getEmp_name()+
					"\",\"emp_telNum\":\""+employee.getEmp_telNum()+
					"\",\"address\":\""+employee.getAddress()+ 
					"\",\"bankcarid\":\""+employee.getBankcarid()+
					"\",\"paypwd\":\""+employee.getPaypwd()	+
					"\",\"user_pwd\":\""+employee.getUser_pwd()+
					"\",\"status\":\""+employee.getStatus()
					+ "\"}";
			jsonStr += ",";
		}
		if(result.size()==0)
			jsonStr += "]";
		else
		    jsonStr = jsonStr.substring(0, jsonStr.length()-1)+"]";
		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.close();
	}
}
