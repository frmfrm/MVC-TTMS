package service;

import java.util.List;

import domain.Studio;
import idao.*;

public class StudioSrv {
	private IStudioDAO stuDAO=DAOFactory.creatStudioDAO();
	
	public int add(Studio stu){
		return stuDAO.insert(stu); 		
	}
	
	public int modify(Studio stu){
		return stuDAO.update(stu); 		
	}
	
	public int delete(int ID){
		return stuDAO.delete(ID); 		
	}
	
	public List<Studio> Fetch(String condt){
		return stuDAO.select(condt);		
	}
	
	public List<Studio> FetchAll(){
		return stuDAO.select("");		
	}
	
	public Studio Fetchone(int id) {
		return stuDAO.findbyId(id);
	}
}
