package tw.gym.dao.com;

import java.util.List;

import tw.gym.model.com.Cart;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;




public interface UserUtil {



	// 將Bean轉成DTO
	public List<CommodityDTO> convertCommodityDTOList(List<Commoditys> comList, String virLocs);
	
	//將bean轉成cartList
	public List<Cart> convertCommodityCartList(List<Commoditys> comList, String virLocs,int comBuyNumber);

	// 將圖片轉檔
	public String convertImageToBase64(String imagePath) throws Exception;

	// 價錢排序高->低
	public List<CommodityDTO> sortByHighPrice(List<CommodityDTO> comDTOList);

	// 價錢排序低->高
	public List<CommodityDTO> sortByLowPrice(List<CommodityDTO> comDTOList);
	
	//按下加入購物車後去新增LoadJson檔案
	public List<Cart> loadJson(List<Cart> cartList,String path,String userId);
	
	//進入購物車去讀取Json檔案
	public List<Cart> goIntoCart(String path,String userId);
	
	//刪除購物車內容
	public List<Cart> deleteCart(String path, String userId, int comId);
}
