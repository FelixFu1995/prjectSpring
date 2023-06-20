package tw.gym.service.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.gym.dao.com.UserUtil;
import tw.gym.daoImpl.com.UserUtilImpl;
import tw.gym.model.com.Cart;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;



@Service
public class UserUtilService {

	@Autowired
	private UserUtil userUtil;
	
	// 將Bean轉成DTO
	public List<CommodityDTO> convertCommodityDTOList(List<Commoditys> comList, String virLocs) {
		return userUtil.convertCommodityDTOList(comList, virLocs);
	}
	
	// 將圖片轉檔
	public String convertImageToBase64(String imagePath) throws Exception {
		return userUtil.convertImageToBase64(imagePath);
	}
	
	// 價格排序高->低
	public List<CommodityDTO> sortByHighPrice(List<CommodityDTO> comDTOList) {
		return userUtil.sortByHighPrice(comDTOList);
	}
	// 價格排序低-> 高
	public List<CommodityDTO> sortByLowPrice(List<CommodityDTO> comDTOList) {
		return userUtil.sortByLowPrice(comDTOList);
	}
	
	// 轉成cartList
	public List<Cart> convertCommodityCartList(List<Commoditys> comList, String virLocs, int comBuyNumber) {
		return userUtil.convertCommodityCartList(comList, virLocs, comBuyNumber);
	}
	
	// 按下加入購物車後 LoadJson檔案
	public List<Cart> loadJson(List<Cart> cartList, String path, String userId) {
		return userUtil.loadJson(cartList, path, userId);
	}
	// 進入購物車去讀取Json檔案
	public List<Cart> goIntoCart(String path, String userId) {
		return userUtil.goIntoCart(path, userId);
	}
	//刪除購物車商品按鈕
	public List<Cart> deleteCart(String path, String userId, int comId){
		return userUtil.deleteCart(path, userId, comId);
	}
	
}
