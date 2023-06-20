package tw.gym.dao.course;

import java.util.List;

import tw.gym.model.course.CorderBean;

public interface icorderDAO {
	public void insertCorder(CorderBean obean);
	public List<CorderBean> selectCorderById(int userId);
	public List<CorderBean> selectAllCorder();
	public void deleteCorder(int corderId);
	public void updateCorder(CorderBean obean);
}
