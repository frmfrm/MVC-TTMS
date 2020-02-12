package idao;
import dao.*;
public class DAOFactory {
	
	public static IStudioDAO creatStudioDAO(){
		return new StudioDAO();
	}
	
	public static IUserDAO creatUserDAO() {
		return new UserDAO();
	}
	
	public static IPlayDAO creatPlayDAO() {
		return new PlayDAO();
	}
	
	public static ISeatDAO creatSeatDAO() {
		return new SeatDAO();
	}
	
	public static IEmployeeDAO creatEmployeeDAO() {
		return new EmployeeDAO();
	}
	
	public static IticketDAO creatTicketDAO() {
		return new TicketDAO();
	}
	
	public static IScheduleDAO creatScheduleDAO() {
		return new ScheduleDAO();
	}

	public static ISaleItemDAO creatSaleItemDAO() {
		// TODO Auto-generated method stub
		return new SaleItemDAO();
	}

	public static ISaleDAO creatSaleDAO() {
		// TODO Auto-generated method stub
		return new SaleDAO();
	}
}
