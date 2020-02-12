package service;

import domain.User;
import idao.DAOFactory;
import idao.IUserDAO;

public class UserSrv { 
	private IUserDAO userDAO = DAOFactory.creatUserDAO();
	
	
	public int add(User user) {
		return userDAO.insert(user);
	}
	public int adddetail(User user) {
	return userDAO.insertDetail(user);
	}
	public int delete(User user) {
		return userDAO.delete(user.getId());
	}
	
	public int modify(User user) {
		return userDAO.update(user);
	}
	public int modifydetail(User user) {
		return userDAO.updateDetail(user);
	}
	
	public User Find(User user) {
		return userDAO.select(user);
	}
	
	public User Finduser(int id) {
		return userDAO.selectuser(id);
	}
	
	public User FindUserdetaile(int id) {
		return userDAO.selectUserdetail(id);
	}
	
	public int modifystatus(String status,int id) {
		return userDAO.updatestatus(status, id);
	}
}
