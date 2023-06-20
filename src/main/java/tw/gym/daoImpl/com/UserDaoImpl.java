package tw.gym.daoImpl.com;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.com.UserDao;
import tw.gym.model.com.Commoditys;



@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory factory;


	// 商品列表
	@Override
	public List<Commoditys> inquireAllCommodity() {

		Session session = factory.getCurrentSession();
		Query<Commoditys> query = session.createQuery("from Commoditys WHERE comStatus = '上架'", Commoditys.class);
		session.flush();
		List<Commoditys> returnList = query.list();
		if (returnList != null) {
			for (Commoditys commodity : returnList) {
			    Hibernate.initialize(commodity.getComPics());
			}
			return returnList;
		}
		return null;
	}

	// 查詢單筆
	@Override
	public List<Commoditys> inquireOneCommodity(int id) {

		Session session = factory.getCurrentSession();
		String hql = "from Commoditys WHERE comId = :id";
		List<Commoditys> returnList = session.createQuery(hql, Commoditys.class).setParameter("id", id).getResultList();
		if (returnList != null) {
			for (Commoditys commodity : returnList) {
			    Hibernate.initialize(commodity.getComPics());
			}
			return returnList;
		}
		return null;
	}

	// 關鍵字查詢
	@Override
	public List<Commoditys> searchByName(String keyWord) {

		Session session = factory.getCurrentSession();
		System.out.println("KeyWord: " + keyWord);
		String hql = "SELECT * FROM Commoditys WHERE comName LIKE :comName AND comStatus = '上架' "
				+ "or comContent LIKE :comContent AND comStatus = '上架'";
		Query<Commoditys> query = session.createNativeQuery(hql, Commoditys.class);

		query.setParameter("comName", "%" + keyWord + "%");
		query.setParameter("comContent", "%" + keyWord + "%");

		List<Commoditys> returnList = query.list();
		if (returnList != null) {
			for (Commoditys commodity : returnList) {
			    Hibernate.initialize(commodity.getComPics());
			}
			return returnList;
		}
		return null;
	}

	// 價格排序
	@Override
	public List<Commoditys> searchByPrice() {

		Session session = factory.getCurrentSession();
		Query<Commoditys> query = session.createQuery("from Commoditys WHERE comStatus = '上架'", Commoditys.class);
		session.flush();
		List<Commoditys> returnList = query.list();
		if (returnList != null) {
			for (Commoditys commodity : returnList) {
			    Hibernate.initialize(commodity.getComPics());
			}
			return returnList;
		}
		return null;
	}

	// 用類別查詢
	@Override
	public List<Commoditys> searchByType(String comType) {

		Session session = factory.getCurrentSession();
		String hql = "SELECT * FROM Commoditys WHERE comtype LIKE :comtype AND comStatus = '上架'";

		Query<Commoditys> query = session.createNativeQuery(hql, Commoditys.class);
		List<Commoditys> returnList = query.setParameter("comtype", "%" + comType + "%").getResultList();

		if (returnList != null) {
			for (Commoditys commodity : returnList) {
			    Hibernate.initialize(commodity.getComPics());
			}
			return returnList;
		}
		return null;
	}

	// 加入購物車
	@Override
	public List<Commoditys> addCart(int id, int itemNum) {

		return null;
	}

}
