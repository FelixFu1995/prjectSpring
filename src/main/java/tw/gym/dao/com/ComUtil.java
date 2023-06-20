package tw.gym.dao.com;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.Part;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;

public interface ComUtil {

	// 商品圖片名稱存取
	public String getFileName(MultipartFile part);

	// 將Bean轉成DTO
	public List<CommodityDTO> convertCommodityDTOList(List<Commoditys> comList, String virLocs);

	// 將圖片轉檔
	public String convertImageToBase64(String imagePath);

	// 價錢排序高->低
	public List<CommodityDTO> sortByHighPrice(List<CommodityDTO> comDTOList);

	// 價錢排序低->高
	public List<CommodityDTO> sortByLowPrice(List<CommodityDTO> comDTOList);

}
