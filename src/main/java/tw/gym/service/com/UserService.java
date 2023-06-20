package tw.gym.service.com;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.com.UserDao;
import tw.gym.daoImpl.com.UserDaoImpl;
import tw.gym.model.com.Commoditys;



@Service
@Transactional
public class UserService {

	@Autowired
	private UserDao userDao;


	// 查詢全部
	public List<Commoditys> inquireAllCommodity() {
		return userDao.inquireAllCommodity();
	}

	// 查詢單筆
	public List<Commoditys> inquireOneCommoditys(int id) {
		return userDao.inquireOneCommodity(id);
	}
	

	// 關鍵字模糊查詢
	public List<Commoditys> searchByName(String name) {
		return userDao.searchByName(name);
	}

	// 價格排序
	public List<Commoditys> searchByPrice() {
		return userDao.searchByPrice();
	}

	// 類別查詢
	public List<Commoditys> searchByType(String comType) {

		return userDao.searchByType(comType);
	}

	// 加入購物車
	public List<Commoditys> addCart(int id, int itemNum) {
		return userDao.addCart(id, itemNum);
	}
}
