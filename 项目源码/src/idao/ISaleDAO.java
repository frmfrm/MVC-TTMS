package idao;

import java.util.List;
import domain.Sale;

public interface ISaleDAO {
	public int insert(Sale sale);
	public int update(Sale saleu);
	public int delete(int ID);
	public List<Sale> select(String condt); 
	public List<Sale> selectAll();
}
