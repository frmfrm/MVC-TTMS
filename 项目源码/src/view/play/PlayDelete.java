package view.play;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Play;
import service.PlaySrv;
import service.StudioSrv;

/**
 * Servlet implementation class PlayDelete
 */
@WebServlet("/PlayDelete")
public class PlayDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayDelete() {
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
		try {
			int id = 0;
			id = Integer.valueOf(request.getParameter("id"));
			response.setContentType("text/html;charset=utf-8");
			System.out.println(id);
			PrintWriter out = response.getWriter();
			Play play = new Play();
			play.setId(id);
			int n = new PlaySrv().deletesetail(play);
			System.out.println(n);
			int m = new PlaySrv().delete(play);
			System.out.println(m);
			if(n==1&&m==1) {
			out.write(""+1);
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("操作错误，请重试");
		}
	}

}
