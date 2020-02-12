package view.play;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Play;
import service.PlaySrv;
import service.StudioSrv;

/**
 * Servlet implementation class PlaySearch
 */
@WebServlet("/cPlaySearch")
public class cPlaySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cPlaySearch() {
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
		String playname = request.getParameter("playname");
		playname=new String(playname.getBytes("ISO-8859-1"),"utf-8");
		List<Play> list = null;
		list = new ArrayList<Play>();
		
		Play play = null;
		Play playdetaile = null;
		System.out.println(playname==null);
		System.out.println(playname.length()>0);
		if(playname!=null && playname.length()>0) {
			play = new PlaySrv().findByName(playname);
			playdetaile = new PlaySrv().findByidDetail(play.getId());
			play.setDetailintro(playdetaile.getDetailintro());
			play.setDirector(playdetaile.getDirector());
			play.setMainactor(playdetaile.getMainactor());
			System.out.println(play == null);
			if(play.getName() != null) {
				//System.out.println("llll");
				list.add(play);
			}else {
				//System.out.println("iiiii");
				list = new PlaySrv().findBytype(playname);
				for (Play play2 : list) {
				    Play playdetaile1 = new PlaySrv().findByidDetail(play2.getId());
					play2.setDetailintro(playdetaile1.getDetailintro());
					play2.setDirector(playdetaile1.getDirector());
					play2.setMainactor(playdetaile1.getMainactor());
				}
			}
			
		}else {
			//System.out.println("ooooo");
			list = new PlaySrv().findAll();
			for (Play play2 : list) {
			    Play playdetaile1 = new PlaySrv().findByidDetail(play2.getId());
				play2.setDetailintro(playdetaile1.getDetailintro());
				play2.setDirector(playdetaile1.getDirector());
				play2.setMainactor(playdetaile1.getMainactor());
			}
			
		}
		System.out.println(list.size());
		String jsonStr = "[";
		for (Play play2 : list) {
			System.out.println("pp"+play2.getId());
			jsonStr += "{\"id\":\""+play2.getId()+
					"\",\"name\":\""+play2.getName() +
					"\",\"introduction\":\""+play2.getIntroduction() +
					"\",\"type\":\""+play2.getType() +
					"\",\"image\":\""+ play2.getImage()+
					"\",\"length\":\"" +play2.getLength() +
					"\",\"ticketPrice\":\"" + play2.getTicketPrice() + 
					"\",\"status\":\"" + play2.getStatus() + 
					"\",\"mainactor\":\"" + play2.getMainactor()+
					"\",\"detailintro\":\"" + play2.getDetailintro()+
					"\",\"director\":\""+play2.getDirector()+
					"\"}";
			jsonStr +=",";
		}
		if(list.size()==0)
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
