package service;

import java.util.List;

import domain.Play;
import domain.User;
import idao.DAOFactory;
import idao.IPlayDAO;
import idao.IUserDAO;

public class PlaySrv {
	
	private IPlayDAO playDAO = DAOFactory.creatPlayDAO();
	
	public int add(Play play) {
		return playDAO.insert(play);
	}
	
	public int delete(Play play) {
		return playDAO.delete(play.getId());
	}
	
	public int deletesetail(Play play) {
		return playDAO.deletedetail(play.getId());
	}
	
	public int modify(Play play) {
		return playDAO.update(play);
	}
	
	public int modifydetail(Play play) {
		return playDAO.updatedetail(play);
	}
	
	public Play findByName(String name) {
		return playDAO.select(name);
	}
	
	public Play findByidDetail(int id) {
		return playDAO.selectdetail(id);
	}
	
	public List<Play> findBytype(String type) {
		return playDAO.findByType(type);
	}
	
	public List<Play> findAll() {
		return playDAO.findAll();
	}
}
