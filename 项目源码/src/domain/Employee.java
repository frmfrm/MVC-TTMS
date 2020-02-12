package domain;

import java.io.Serializable;

public class Employee implements Serializable {
	
	
	/*
	 * create table employee
    (
        emp_id               int not null auto_increment,
        emp_no               char(20) not null,
        emp_name             varchar(100) not null,
        emp_tel_num          char(20),
        emp_addr             varchar(200),
        emp_email            varchar(100),
         primary key (emp_id)
      );
	 * 
	 * 
	 */
	
	private int user_id;
	private String emp_no;
	private String emp_name;
	private String emp_telNum;
	private String address;
	private String bankcarid;
	private String paypwd;
	private int status;
	private String user_pwd;
	
	
	

	public Employee() {
		
	}

	
	
	public Employee(int user_id, String emp_name, String emp_telNum, String address, String bankcarid, int status,
			String user_pwd) {
		super();
		this.user_id = user_id;
		this.emp_name = emp_name;
		this.emp_telNum = emp_telNum;
		this.address = address;
		this.bankcarid = bankcarid;
		this.status = status;
		this.user_pwd = user_pwd;
	}


	
	

	public Employee(int user_id, String emp_no, String emp_name, String emp_telNum, String address, String bankcarid,
			String paypwd, String user_pwd) {
		super();
		this.user_id = user_id;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_telNum = emp_telNum;
		this.address = address;
		this.bankcarid = bankcarid;
		this.paypwd = paypwd;
		this.user_pwd = user_pwd;
	}



	public Employee(int user_id, String emp_no, String emp_name, String emp_telNum, String address, String bankcarid,
			String paypwd, int status, String user_pwd) {
		super();
		this.user_id = user_id;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_telNum = emp_telNum;
		this.address = address;
		this.bankcarid = bankcarid;
		this.paypwd = paypwd;
		this.status = status;
		this.user_pwd = user_pwd;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}



	public String getEmp_no() {
		return emp_no;
	}



	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}



	public String getEmp_name() {
		return emp_name;
	}



	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}



	public String getEmp_telNum() {
		return emp_telNum;
	}



	public void setEmp_telNum(String emp_telNum) {
		this.emp_telNum = emp_telNum;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getBankcarid() {
		return bankcarid;
	}



	public void setBankcarid(String bankcarid) {
		this.bankcarid = bankcarid;
	}



	public String getPaypwd() {
		return paypwd;
	}



	public void setPaypwd(String paypwd) {
		this.paypwd = paypwd;
	}



	public void showValue() {
		System.out.println("编号：" + user_id + "\t姓名：" + emp_name);
	}

}
