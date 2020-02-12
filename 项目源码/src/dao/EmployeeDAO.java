package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import domain.Employee;
import domain.Studio;
import idao.IEmployeeDAO;
import util.DBUtil;

public class EmployeeDAO implements IEmployeeDAO {

	@Override
	public int insert(Employee employee) {
			
			String sql = "insert into employee(user_id, emp_no, emp_name, emp_telNum , address , bankcarid , paypwd ,status,user_pwd)"
					+ " values("+ employee.getUser_id()
					+ ", "
					+ "'" + employee.getEmp_no()
					+ "', " 
					+"'"  + employee.getEmp_name()
					+"',"
					+ "'" + employee.getEmp_telNum()
					+ "',"
					+"'" + employee.getAddress()
					+"',"
					+"'" + employee.getBankcarid()
					+"',"
					+"'" + employee.getPaypwd()
					+"',"
					+"'" + employee.getStatus()
					+"',"
					+ employee.getUser_pwd()
					+")";
			System.out.println(sql);
			DBUtil db = new DBUtil();
			
			return db.execCommand(sql);
		}

	@Override
	public int update(Employee employee) {
		String sql = "update employee set " + " user_id =" + employee.getUser_id()
		+ ", " 
		+ " emp_name = '" + employee.getEmp_name() + "', "
		+ " emp_telNum = '" + employee.getEmp_telNum() + "', "
		+ " address = '" + employee.getAddress() +"',"
		+ " bankcarid = '" +employee.getBankcarid() +"',"
		+ " user_pwd = '" +employee.getUser_pwd() +"',"
		+ " status = " + employee.getStatus()
		;

sql += " where user_id = " + employee.getUser_id();
System.out.println(sql);
DBUtil db = new DBUtil();

return db.execCommand(sql);
	}

	@Override
	public int delete(int id) {
		String sql = "delete from  employee ";
		sql += " where user_id = " + id;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}

	@Override
	public List<Employee> select(String condt) {
		List<Employee> employeeList = null;
		employeeList=new LinkedList<Employee>();
		try {
			String sql = "select user_id,emp_no,emp_name,emp_telNum,address,bankcarid,paypwd,user_pwd,status from employee ";
			condt.trim();
			if(!condt.isEmpty())
				sql+= " where " + condt;
			System.out.println(sql);
			DBUtil db = new DBUtil();
			ResultSet rst = db.execQuery(sql);
			//System.out.print("sql:"+sql);
			if (rst!=null) {
				while(rst.next()){
					Employee employee=new Employee();
					employee.setUser_id(rst.getInt("user_id"));
					employee.setEmp_no(rst.getString("emp_no"));
					employee.setEmp_name(rst.getString("emp_name"));
					employee.setEmp_telNum(rst.getString("emp_telNum"));
					employee.setAddress(rst.getString("address"));
					employee.setBankcarid(rst.getString("bankcarid"));
					employee.setPaypwd(rst.getString("paypwd"));
					employee.setUser_pwd(rst.getString("user_pwd"));
					employee.setStatus(rst.getInt("status"));
					employeeList.add(employee);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return employeeList;
	}

	@Override
	public int updateStatus(int Status,int id) {
		String sql = "update employee set " + " status =" + Status;
		sql += " where user_id = " + id;
		System.out.println(sql);
		DBUtil db = new DBUtil();

		return db.execCommand(sql);

	}

	@Override
	public int updateSelf(Employee employee) {
		String sql = "update employee set " 
		+ " emp_name = '" + employee.getEmp_name() + "', "
		+ " emp_telNum = '" + employee.getEmp_telNum() + "', "
		+ " address = '" + employee.getAddress() +"',"
		+ " bankcarid = '" +employee.getBankcarid() +"',"
		+ " user_pwd = '" +employee.getUser_pwd()
		+ "paypwd = '"+employee.getPaypwd()
		;

sql += " where user_id = " + employee.getUser_id();
System.out.println(sql);
DBUtil db = new DBUtil();

return db.execCommand(sql);
	}

}
