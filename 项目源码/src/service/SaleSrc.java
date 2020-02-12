package service;

import java.util.List;

import domain.Sale;
import idao.DAOFactory;
import idao.ISaleDAO;

public class SaleSrc {
private ISaleDAO saleDAO=DAOFactory.creatSaleDAO();
	
	public int add(Sale sale){
		return saleDAO.insert(sale); 		
	}
	
	public int modify(Sale sale){
		return saleDAO.update(sale); 		
	}
	
	public int delete(int ID){
		return saleDAO.delete(ID); 		
	}
	
	public List<Sale> Fetch(String condt){
		return saleDAO.select(condt);		
	}
	
	public List<Sale> FetchAll(){
		return saleDAO.select("");		
	}
	
	
}
