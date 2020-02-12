package view.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserSrv;


@WebServlet("/LoginSearch")
public class LoginSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginSearch() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		}

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(name + password);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		User user = null;
		user = new User();
		user.setName(name);
		user.setPassword(password);
		user = new UserSrv().Find(user);
		
		
		if(user!=null&&user.getPassword().equals(password)) {
			System.out.println(user.getId());
//			System.out.println(user.getPassword());
//			System.out.println(user.getPassword().equals(password));
			String jsonStr = "[";
			jsonStr += "{\"id\":\""+user.getId()+
					"\",\"status\":\""+user.getStatus() +
					 "\"}";
			jsonStr +="]";
			out.write(jsonStr);
		}else {
			out.write("error");
		}
		out.close();
	}

}
