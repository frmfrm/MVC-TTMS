package idao;

import java.util.List;

import domain.SaleItem;

public interface ISaleItemDAO {
	public int insert(SaleItem saleitem);
	public int update(SaleItem saleitem);
	public int delete(int ID);
	public List<SaleItem> select(String condt); 
}
