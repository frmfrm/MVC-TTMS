package view.play;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Play;
import domain.Studio;
import service.PlaySrv;
import service.StudioSrv;

/**
 * Servlet implementation class PlayUpdate
 */
@WebServlet("/PlayUpdate")
public class PlayUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayUpdate() {
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
		Play play = null;
		String type = request.getParameter("type");
		int id = 0;
		try {
			if (type.equals("modify")) {
				id = Integer.valueOf(request.getParameter("playid"));
			}
			int typeid = 0;
			int langid = 0;
			
//			 typeid = Integer.valueOf(request.getParameter("playTypeid"));
//			 langid =Integer.valueOf(request.getParameter("langid"));
			String name = request.getParameter("playname");
			name=new String(name.getBytes("ISO-8859-1"),"utf-8");
			String introduction = request.getParameter("playintro");
			introduction  = new String (introduction.getBytes("ISO-8859-1"),"utf-8");
			String playtype = request.getParameter("playtype");
			playtype = new String(playtype.getBytes("ISO-8859-1"),"utf-8");
			String image = request.getParameter("playimage");
			image = new String(image.getBytes("ISO-8859-1"),"utf-8");
			int length = Integer.valueOf(request.getParameter("playlength"));
			float ticketPrice = Float.valueOf(request.getParameter("playprice"));
			int status = Integer.valueOf(request.getParameter("playstatus"));
			play = new Play(id, typeid, name, introduction, image, length, ticketPrice, status, playtype);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if (type.equals("add")) {
				if(new PlaySrv().add(play)==1)
					out.write("数据添加成功");
				else
					out.write("数据添加失败，请重试");
			} else{
				if(new PlaySrv().modify(play)==1)
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
