package service;

import java.util.List;

import domain.Play;
import domain.Schedule;
import domain.Studio;
import domain.User;
import idao.DAOFactory;
import idao.IPlayDAO;
import idao.IScheduleDAO;

public class ScheduleSrv {
	
	private IScheduleDAO scheduleDAO = DAOFactory.creatScheduleDAO();
	
	public int add(Schedule schedule) {
		return scheduleDAO.insert(schedule);
	}
	
	public int delete(Schedule schedule) {
		return scheduleDAO.delete(schedule.getId());
	}
	
	public int delete(String sql){
		return scheduleDAO.delete(sql);		
	} 
	
	public int modify(Schedule schedule) {
		return scheduleDAO.update(schedule);
	}
	
	public List<Schedule> Fetch(String condt){
		return scheduleDAO.select(condt);		
	}
	
	public List<Schedule> FetchAll(){
		return scheduleDAO.select("");		
	}
	
	public List<Schedule> findAll() {
		return scheduleDAO.findAll();
	}
}
