package tw.gym.service.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.Part;
import tw.gym.dao.com.ComUtil;
import tw.gym.daoImpl.com.ComUtilImpl;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;

@Service("comUtilService")
public class ComUtilService {

	@Autowired
	private ComUtil comUtil;
	
	// 取得商品圖片
	public String getFileName(MultipartFile part) {
		return comUtil.getFileName(part);
	}
	
	// 將Bean轉成DTO
	public List<CommodityDTO> convertCommodityDTOList(List<Commoditys> comList, String virLocs){
		return comUtil.convertCommodityDTOList(comList, virLocs);
	}
	
	// 將圖片轉檔
	public String convertImageToBase64(String imagePath) {
		return comUtil.convertImageToBase64(imagePath);
	}
	
	// 價格排序高->低
	public List<CommodityDTO> sortByHighPrice(List<CommodityDTO> comDTOList){
		return comUtil.sortByHighPrice(comDTOList);
	}
	// 價格排序低-> 高
	public List<CommodityDTO> sortByLowPrice(List<CommodityDTO> comDTOList){
		return comUtil.sortByLowPrice(comDTOList);
	}
}
