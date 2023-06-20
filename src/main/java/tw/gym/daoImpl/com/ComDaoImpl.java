package tw.gym.daoImpl.com;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.com.ComDao;
import tw.gym.model.com.ComPic;
import tw.gym.model.com.Commoditys;

@Repository
@Transactional
public class ComDaoImpl implements ComDao {

	@Autowired
	private SessionFactory factory;

	// 新增商品的方法
	@Override
	public List<Commoditys> addCom(Commoditys com) {

		Session session = factory.openSession();

		List<Commoditys> returnList = new ArrayList<>();
		try {
			Commoditys mergeBean = session.merge(com);
			session.flush();

			returnList.add(mergeBean);

			return returnList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	// 查詢全部商品
	@Override
	public List<Commoditys> inquireAllCommodity() {

		Session session = factory.openSession();

		try {
			Query<Commoditys> query = session.createQuery("from Commoditys", Commoditys.class);
			session.flush();
			List<Commoditys> returnList = query.list();
			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	// 查詢單筆
	@Override
	public List<Commoditys> inquireOneCommodity(int id) {

		Session session = factory.getCurrentSession();
		try {
			String hql = "from Commoditys where comId = :id";
			List<Commoditys> returnList = session.createQuery(hql, Commoditys.class).setParameter("id", id)
					.getResultList();
			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	// 修改商品
	@Override
	public void updateCom(Commoditys com, int id) {

		Session session = factory.openSession();
		try {
			// get
			Commoditys comBean = session.get(Commoditys.class, id);
			// 更新商品物件的相關屬性
			comBean.setComName(com.getComName());
			comBean.setComNumber(com.getComNumber());
			comBean.setComPrice(com.getComPrice());
			comBean.setComContent(com.getComContent());
			comBean.setComStatus(com.getComStatus());
			comBean.setComType(com.getComType());

			session.flush();
			session.saveOrUpdate(comBean); // 保存或更新商品物件
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}
	
	// 修改單筆圖片
	@Override
	public void updateComPic(ComPic comPicBean) {

		Session session = factory.openSession();
		try {
			ComPic resultBean = session.get(ComPic.class, comPicBean.getComPicId());

			resultBean.setComPicName(comPicBean.getComPicName());
			session.flush();
			session.saveOrUpdate(resultBean); // 保存或更新商品物件
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// 用關鍵字查詢
	@Override
	public List<Commoditys> searchByKeyword(String keyWord) {

		Session session = factory.openSession();

		try {
			String hql = "SELECT * FROM Commoditys WHERE comname LIKE :comName " + "or comcontent LIKE :comContent";
			Query<Commoditys> query = session.createNativeQuery(hql, Commoditys.class);

			query.setParameter("comName", "%" + keyWord + "%");
			query.setParameter("comContent", "%" + keyWord + "%");
			
			session.flush();
			List<Commoditys> returnList = query.list();
			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	// 價格排序
	@Override
	public List<Commoditys> searchByPrice() {

		Session session = factory.openSession();

		try {
			Query<Commoditys> query = session.createQuery("from Commoditys", Commoditys.class);
			session.flush();
			List<Commoditys> returnList = query.list();

			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	// 用類別查詢
	@Override
	public List<Commoditys> searchByType(String comType) {

		Session session = factory.openSession();

		try {
			String hql = "SELECT * FROM Commoditys WHERE comtype LIKE :comtype";

			Query<Commoditys> query = session.createNativeQuery(hql, Commoditys.class);
			List<Commoditys> returnList = query.setParameter("comtype", "%" + comType + "%").getResultList();
			
			session.flush();
			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	//上下架查詢
	@Override
	public List<Commoditys> searchByStatus(String comStatus) {
		
		Session session = factory.openSession();
		try {
			String hql = "SELECT * FROM Commoditys WHERE comStatus LIKE :comStatus";

			Query<Commoditys> query = session.createNativeQuery(hql, Commoditys.class);
			List<Commoditys> returnList = query.setParameter("comStatus", "%" + comStatus + "%").getResultList();
			
			session.flush();
			if (returnList != null) {
				for (Commoditys commodity : returnList) {
				    Hibernate.initialize(commodity.getComPics());
				}
				return returnList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}



}
