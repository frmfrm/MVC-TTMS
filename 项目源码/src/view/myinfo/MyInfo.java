package view.myinfo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserSrv;

/**
 * Servlet implementation class MyInfo
 */
@WebServlet("/MyInfo")
public class MyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfo() {
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
		String type = request.getParameter("type");
		String id = request.getParameter("userid");
		if(type.equals("search")) {
		User user = new UserSrv().Finduser(Integer.valueOf(id));
		User userdetail = new UserSrv().FindUserdetaile(Integer.valueOf(id));
		
		String jsonStr = "[";
		jsonStr += "{\"name\":\""+user.getName()+
				"\",\"password\":\""+user.getPassword() +
				"\",\"status\":\""+user.getStatus() +
				"\",\"address\":\""+userdetail.getUser_address() +
				"\",\"card\":\""+userdetail.getUser_bankcarid()+
				"\",\"sex\":\"" +userdetail.getUser_sex() +
				"\",\"age\":\"" + userdetail.getUser_age() + 
				"\",\"phone\":\"" + userdetail.getUser_telNum() + "\"}";
		jsonStr +="]";

		response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
		response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.close();
	}else if(type.equals("modify")) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String status = request.getParameter("status");
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		
		User user = new User();
		user.setId(Integer.valueOf(id));
		user.setName(name);
		user.setPassword(password);
		user.setStatus(status);
		user.setUser_address(address);
		user.setUser_age(Integer.valueOf(age));
		user.setUser_bankcarid(card);
		user.setUser_sex(sex);
		user.setUser_telNum(phone);
		
		int n = new UserSrv().modify(user);
		int m = new UserSrv().modifydetail(user);
		if(n==1&m==1) {
			response.setContentType("application/json;charset=utf-8");  // 指定返回的格式为JSON格式
			response.setCharacterEncoding("UTF-8");  // setContentType与setCharacterEncoding的顺序不能调换，否则无法解决中文乱码的问题
			PrintWriter out = response.getWriter();
			out.write("修改成功！");
			out.close();
		}
	}
	}

}
