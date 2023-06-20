package tw.gym.dao.course;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import tw.gym.model.course.CorderBean;

public class corderDAO implements icorderDAO {

	private Session session;

	public corderDAO(Session session) {
		this.session = session;
	}
	//新增訂單
	@Override
	public void insertCorder(CorderBean obean) {
		session.persist(obean);
	}
	//前台查詢訂單
	@Override
	public List<CorderBean> selectCorderById(int userId) {
		Query<CorderBean> query = session.createQuery("from CorderBean where userId = :userId",CorderBean.class);
		query.setParameter("userId", userId);
		return query.list();
	}

	@Override
	public List<CorderBean> selectAllCorder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCorder(int corderId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCorder(CorderBean obean) {
		// TODO Auto-generated method stub

	}

}
