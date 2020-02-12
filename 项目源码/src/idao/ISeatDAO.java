package idao;

import java.util.List;

import domain.Seat;

public interface ISeatDAO {
	public int insert(Seat seat);
	public int update(Seat seat);
	public int delete(int seatID);
	public List<Seat> select(String condt); 
	public int modifylist(Seat seat);
	public int deleteByStudio(int studioId);
}
