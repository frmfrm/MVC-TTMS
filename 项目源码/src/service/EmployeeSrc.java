package service;

import java.util.List;

import dao.EmployeeDAO;
import domain.Employee;
import idao.DAOFactory;
import idao.IEmployeeDAO;

public class EmployeeSrc {
	private IEmployeeDAO employeeDAO =DAOFactory.creatEmployeeDAO();
	
	public int add(Employee employee) {
		return employeeDAO.insert(employee);
	}
	public int modify(Employee employee) {
		return employeeDAO.update(employee);
		}
	public int delete(int id) {
		return employeeDAO.delete(id);
	}
	
	public List<Employee> Fetch(String condt){
		return employeeDAO.select(condt);
	}
	
	public List<Employee> FetchALL() {
		return employeeDAO.select("");
	}
	
	public int updateStatus(int status,int id) {
		return employeeDAO.updateStatus(status, id);
	}
	
	public int updateSelf(Employee employee) {
		return employeeDAO.updateSelf(employee);
	}
	
}
