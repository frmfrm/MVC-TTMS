/**
 * 
 */
package idao;
import domain.*;

import java.util.List;

import domain.Studio;

/**
 * @author Administrator
 *
 */
public interface IPlayDAO {
	public int insert(Play play);
	public int insertdetail(Play play);
	public int update(Play play);
	public int updatedetail(Play play);
	public int delete(int id);
	public int deletedetail(int id);
	public Play select(String name);
	public Play selectdetail(int id);
	public List<Play> findByType(String type);
	public List<Play> findAll();
	public int selectByid(int id);
	
}

