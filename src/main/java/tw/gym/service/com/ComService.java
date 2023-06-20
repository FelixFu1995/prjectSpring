package tw.gym.service.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.com.ComDao;
import tw.gym.daoImpl.com.ComDaoImpl;
import tw.gym.model.com.ComPic;
import tw.gym.model.com.Commoditys;




@Service
@Transactional
public class ComService {

	@Autowired
	private ComDao comDao;
	
	
	//新增商品
	public  List<Commoditys> addCom(Commoditys com) {
		return comDao.addCom(com);
	}
	
	//查詢全部
	public List<Commoditys> inquireAllCommodity() {
		return comDao.inquireAllCommodity();
	}
	
	//查詢單筆
	public List<Commoditys> inquireOneCommoditys(int id){
		return comDao.inquireOneCommodity(id);
	}
	
	//修改單張圖片
	public void updateComPic(ComPic comPicBean) {
		comDao.updateComPic(comPicBean);
	}
	//修改單筆
	public void updateCom(Commoditys com,int id){
		comDao.updateCom(com,id);
	}
	
	//關鍵字模糊查詢
	public List<Commoditys> searchByKeyword(String name){
		return comDao.searchByKeyword(name);
	}
	
	//價格排序
	public List<Commoditys> searchByPrice(){
		return comDao.searchByPrice();
	}
	
	//類別查詢
	public List<Commoditys> searchByType(String comType){
		
		return comDao.searchByType(comType);
	}

	//上下架查詢
	public List<Commoditys> searchByStatus(String comStatus){
		
		return comDao.searchByStatus(comStatus);
	}
}
