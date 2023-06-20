package tw.gym.action.com;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import tw.gym.model.com.ComPic;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;
import tw.gym.service.com.ComService;
import tw.gym.service.com.ComUtilService;

@Controller
public class BackController {

	@Autowired
	private ComService comService; // 利用Spring建立service
	@Autowired
	private ComUtilService comUtilService; // 利用Spring建立service
	@Autowired
	private ComPic comPicBean; // 利用Spring建立Bean
	@Autowired
	private Commoditys comBean; // 利用spring建立Bean

	// 導向頁面
	@RequestMapping("/backHomePage")
	public String getHomePage() {

		return "com/FitnessBack";
	}

	@RequestMapping("/addItemPage")
	public String getInToAddItemPage() {

		return "com/AddNewItem";
	}

	/**
	 * 功能 
	 * 1. getItemListFunc 查詢所有商品 
	 * 2. getAddItemFunc 新增商品
	 * 3. getEditItemPic 修改單張圖片
	 * 4. getEditItemInfoFunc 修改商品資訊 
	 * 5. getCheckByKeyword 關鍵字查詢
	 * 6. getSortByPrice 價格排序
	 * 7. getSortByStatus 上下架查詢
	 */
	// 查詢所有商品
	@RequestMapping("/itemListPage.func")
	public String getItemListFunc(HttpServletRequest request, Model m) {

		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		
		try {
			List<Commoditys> returnList = comService.inquireAllCommodity();
			if(returnList!= null) {
				comDTOList = comUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			m.addAttribute("comList", comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/ItemList";
	}

	// 新增商品
	@PostMapping("/addItem.func")
	public String getAddItemFunc(@RequestParam("comName") String comName, @RequestParam("comNumber") int comNumber,
									@RequestParam("comPrice") int comPrice, @RequestParam("comType") String comType,
									@RequestParam("comStatus") String comStatus, @RequestParam("comContent") String comContent,
									Model model, MultipartHttpServletRequest request) {
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");

		try {
			// 將請求參數資料設定到 comBean 物件中
			comBean.setComName(comName);
			comBean.setComNumber(comNumber);
			comBean.setComPrice(comPrice);
			comBean.setComType(comType);
			comBean.setComStatus(comStatus);
			comBean.setComContent(comContent);
			comBean.setComBuyNumber(0);

			Set<ComPic> pics = new LinkedHashSet<>();
			List<MultipartFile> comPicPart = request.getFiles("comPic"); //取得圖片
			for (MultipartFile comPic : comPicPart) {
				if (!comPic.isEmpty()) {
					ComPic comPicBean= new ComPic();
					String loc = comUtilService.getFileName(comPic);
					comPic.transferTo(new File(virLoc + "/" + loc));

					comPicBean.setComPicName(loc);
					comPicBean.setCommoditys(comBean);
					pics.add(comPicBean);
				}
			}
			comBean.setComPics(pics);

			List<Commoditys> returnList = comService.addCom(comBean);
			// 將資料轉發到商品頁面
			if (returnList != null) {
				model.addAttribute("msg", "成功新增商品");
			} else {
				model.addAttribute("msg", "發生錯誤，新增失敗");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "com/AddNewItem";
	}

	// 修改單張圖片
	@PostMapping("/editOnePic.func")
	public ResponseEntity<Object> getEditItemPicFunc(@RequestParam("imageId") int imageId, @RequestParam("comId") int comId, MultipartHttpServletRequest request) {

		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");

		try {
			MultipartFile comPicPart = request.getFile("imageFile");
			String loc = comUtilService.getFileName(comPicPart); // 商品名稱
			comPicPart.transferTo(new File(virLoc + "/" + loc)); // 寫進資料夾

			comPicBean.setComId(comId);
			comPicBean.setComPicId(imageId);
			comPicBean.setComPicName(loc);
			comService.updateComPic(comPicBean);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok().build();
	}

	// 修改商品資訊
	@PostMapping("/editItemInfo.func")
	public ResponseEntity<Object> getEditItemInfoFunc(@RequestParam("comId") int id,
			@RequestParam("comNameAjax") String comName, @RequestParam("comNumberAjax") int comNumber,
			@RequestParam("comPriceAjax") int comPrice, @RequestParam("comContentAjax") String comContent,
			@RequestParam("comStatusAjax") String comStatus, @RequestParam("comTypeAjax") String comType) {

		try {
			// 將前台輸入的資料傳送到Goods(Java Bean)裡面
			comBean.setComId(id); // id
			comBean.setComName(comName); // 商品名稱
			comBean.setComNumber(comNumber); // 商品數量
			comBean.setComPrice(comPrice); // 商品價格
			comBean.setComContent(comContent); // 商品描述
			comBean.setComStatus(comStatus); // 上下架狀態
			comBean.setComType(comType); // 商品類別
			comBean.setComBuyNumber(0); // 預設總購買數量0

			comService.updateCom(comBean, id);

			return ResponseEntity.ok().build();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}

	// 關鍵字查詢
	@PostMapping("/checkByKeyword.func")
	public String getCheckByKeyword(@RequestParam("keywords") String keywords, HttpServletRequest request, Model model) {

		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = comService.searchByKeyword(keywords);

			if (returnList != null) {
				comDTOList = comUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList",comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/ItemList";
	}
	
	//價格排序
	@PostMapping("/sortByPrice.func")
	public String getSortByPrice(@RequestParam("sortPrice") String sortByPrice, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		List<CommodityDTO> sortList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		
		try {
			List<Commoditys> returnList = comService.searchByPrice();
			if (request != null) {
				comDTOList = comUtilService.convertCommodityDTOList(returnList, virLoc);
				if (sortByPrice.equals("0")) {
					sortList = comUtilService.sortByHighPrice(comDTOList);
				} else {
					sortList = comUtilService.sortByLowPrice(comDTOList);
				}
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList", sortList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "com/ItemList";
	}
	
	//類別排序
	@PostMapping("/sortByType.func")
	public String getSortByType(@RequestParam("sortType") String sortByType, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = comService.searchByType(sortByType);
			if (returnList != null) {
				comDTOList = comUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList", comDTOList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/ItemList";
	}
	
	//上下架查詢
	@PostMapping("sortByStatus.func")
	public String getSortByStatus(@RequestParam("sortSattus") String SortByStatus, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = comService.searchByStatus(SortByStatus);
			if (returnList != null) {
				comDTOList = comUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList", comDTOList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "com/ItemList";
	} 
}
