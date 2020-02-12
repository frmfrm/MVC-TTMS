package idao;

import java.util.List;

import domain.Employee;

public interface IEmployeeDAO {
	public int insert(Employee employee);
	public int update(Employee employee);
	public int delete(int user_id);
	public List<Employee> select(String condt);
	public int updateStatus(int Status,int id);
	public int updateSelf(Employee employee);
}
