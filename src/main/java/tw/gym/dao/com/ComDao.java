package tw.gym.dao.com;

import java.util.List;

import tw.gym.model.com.ComPic;
import tw.gym.model.com.Commoditys;



public interface ComDao {


		/**
		 * 新增商品
		 */
		public List<Commoditys> addCom(Commoditys com);
		//商品列表
		
		/**
		 * 查詢該賣家的商品方法
		 * 回傳list型態
		 */
		public List<Commoditys> inquireAllCommodity();
		
		//修改圖片
		public void updateComPic(ComPic comPicBean);
		//修改按鈕

		/**
		 * 修改前 先查詢該ID之方法
		 */
		public List<Commoditys> inquireOneCommodity(int id);
		
		//確認修改按鈕

		/**
		 * 修改商品細項之方法
		 */
		public void updateCom(Commoditys com, int id);
		
		//Aside功能

		/**
		 * 關鍵字 查詢方法 
		 */
		public List<Commoditys> searchByKeyword(String comName);
		
		/**
		 * 價格排序方法 
		 */
		public List<Commoditys> searchByPrice();
		/**
		 * 搜尋類型方法
		 */
		public List<Commoditys> searchByType(String comType);
		/**
		 * 搜尋上下架商品
		 */
		public List<Commoditys> searchByStatus(String comStatus);
}
