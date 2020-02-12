package idao;
import domain.*;

import java.sql.Date;
import java.util.List;
public interface IScheduleDAO {
	public int insert(Schedule schedule);
	public int update(Schedule schedule);
	public int delete(int id);
	public int delete(String sql);
	public Schedule select(int id);
	public List<Schedule> select(String condt);
	public List<Schedule> findAll();
	public List<Schedule> findBySql(String sql);
}

