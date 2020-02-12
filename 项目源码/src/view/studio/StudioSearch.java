package view.studio;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Studio;
import service.StudioSrv;

@WebServlet("/StudioSearch")
public class StudioSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudioSearch() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		name=new String(name.getBytes("ISO-8859-1"),"utf-8");
		List<Studio> result = null;
		if(name!=null && name.length()>0)
			result = new StudioSrv().Fetch("studio_name LIKE '%" + name +"%'");			
		else
			result = new StudioSrv().FetchAll();
		
		String jsonStr = "[";		
		for (Studio s : result) {
			System.out.println(s.getID());
			jsonStr += "{\"id\":\""+s.getID() + 
					"\",\"name\":\""+s.getName() +
					"\",\"rowCount\":\""+s.getRowCount()+
					"\",\"colCount\":\""+s.getColCount()+
					"\",\"introduction\":\""+s.getIntroduction()+ "\"}";
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
