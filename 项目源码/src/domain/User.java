package domain;

public class User {
	
	private int id = -1;
	private String name = null;
	private String password = null;
	private String status = null;
	
	private String user_telNum = null;
	private String user_address = null;
	private String user_bankcarid = null;
	private String user_paypwd = null;
	private String user_sex = null;
	private int user_age = -1;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	public String getUser_telNum() {
		return user_telNum;
	}
	public void setUser_telNum(String user_telNum) {
		this.user_telNum = user_telNum;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_bankcarid() {
		return user_bankcarid;
	}
	public void setUser_bankcarid(String user_bankcarid) {
		this.user_bankcarid = user_bankcarid;
	}
	public String getUser_paypwd() {
		return user_paypwd;
	}
	public void setUser_paypwd(String user_paypwd) {
		this.user_paypwd = user_paypwd;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public User(int id, String password) {
		this.id = id;
		this.password = password;
	}
	
	
	
	
	
	
	
	
	public User(int id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}
	
	
	
	
	
	public User(int id, String user_telNum, String user_address, String user_bankcarid, String user_paypwd,
			String user_sex, int user_age) {
		super();
		this.id = id;
		this.user_telNum = user_telNum;
		this.user_address = user_address;
		this.user_bankcarid = user_bankcarid;
		this.user_paypwd = user_paypwd;
		this.user_sex = user_sex;
		this.user_age = user_age;
	}
	public User(int id,String name, String password, String user_telNum, String user_address, String user_bankcarid,
			String user_paypwd, String user_sex, int user_age) {
		super();
		this.id = id;

		this.name = name;
		this.password = password;
		this.user_telNum = user_telNum;
		this.user_address = user_address;
		this.user_bankcarid = user_bankcarid;
		this.user_paypwd = user_paypwd;
		this.user_sex = user_sex;
		this.user_age = user_age;
	}
	
	
	
	
}
