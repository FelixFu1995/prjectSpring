package tw.gym.action.com;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import tw.gym.model.com.Cart;
import tw.gym.model.com.CommodityDTO;
import tw.gym.model.com.Commoditys;
import tw.gym.service.com.UserService;
import tw.gym.service.com.UserUtilService;

@Controller
public class FrontController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserUtilService userUtilService;
	
	//導向頁面
	@RequestMapping("/homePage")
	public String getHomePage() {
		
		return "com/Fitness";
	}
	
	/**
	 * 功能
	 * 1. getUserItemList.func 查詢全部商品
	 * 2. getUserOneItemList.func 進入商品頁面
	 * 3. getUserCheckByKeyword 關鍵字查詢
	 * 4. getUserSortByPrice 價格排序
	 * 5. getUserSortByType 類別排序
	 * 6. getUserAddCart 新增商品進購物車
	 * 7. getIntoUserCart 進入購物車
	 * 8. getRemoveCart 移除購物車商品
	 */
	//查詢全部商品
	@RequestMapping("/userItemList.func")
	public String getUserItemList(HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = userService.inquireAllCommodity();
			if(returnList!= null) {
				
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);
				
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList",comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "com/UserItemList";
		
	}
	
	//進入單一商品頁面
	@RequestMapping("/userOneItemList.func")
	public String getUserOneItemList(@RequestParam("comId") Integer comId, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = userService.inquireOneCommoditys(comId);

			if (returnList != null) {
				
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			model.addAttribute("OneComList",comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/UserOneItemList";
	}
	
	//關鍵字查詢商品
	@RequestMapping("/userCheckByKeyWord.func")
	public String getUserCheckByKeyword(@RequestParam("keywords") String keywords, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = userService.searchByName(keywords);

			if (returnList != null) {
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);

			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList",comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/UserItemList";
	}
	//價格排序
	@RequestMapping("/userSortByPrice.func")
	public String getUserSortByPrice(@RequestParam("sortPrice") String sortByPrice, HttpServletRequest request, Model model) {
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		List<CommodityDTO> sortList = new ArrayList<>();
		try {
			List<Commoditys> returnList = userService.searchByPrice();
			if (request != null) {
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);
				if (sortByPrice.equals("0")) {
					sortList = userUtilService.sortByHighPrice(comDTOList);
				} else {
					sortList = userUtilService.sortByLowPrice(comDTOList);
				}
			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList",comDTOList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "com/UserItemList";
	}
	
	//類別排序
	@RequestMapping("/userSortByType.func")
	public String getUserSortByType(@RequestParam("sortType") String sortByType, HttpServletRequest request, Model model) {
		
		
		List<CommodityDTO> comDTOList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		try {
			List<Commoditys> returnList = userService.searchByType(sortByType);
			if (returnList != null) {
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);

			}
			// 將資料轉發到商品頁面
			model.addAttribute("comList",comDTOList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "com/UserItemList";
	}
	
	//加入購物車
	@RequestMapping("/userAddCart.func")
	public String getUserAddCart(@RequestParam("comId") int comId, @RequestParam("itemNumber") int itemNum, @ModelAttribute("UserId") String userId,
									HttpServletRequest request, Model model) {
		
		List<Cart> cartList = new ArrayList<>();
		String virLoc = request.getServletContext().getRealPath("/WEB-INF/resources/IMG");
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/Cart");
		List<CommodityDTO> comDTOList = new ArrayList<>();

		fakeSession(); //假session
		System.out.println(userId);
		try {
			// 利用此去做事

			List<Commoditys> returnList = userService.inquireOneCommoditys(comId);

			if (returnList != null) {
				cartList = userUtilService.convertCommodityCartList(returnList, virLoc, itemNum);
				cartList = userUtilService.loadJson(cartList, path, userId);

				// 做完寫入後Json後
				System.out.println("已加入購物車");
				comDTOList = userUtilService.convertCommodityDTOList(returnList, virLoc);
			}
			// 將資料轉發到商品頁面
			model.addAttribute("OneComList",comDTOList);
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return "com/UserOneItemList";
	}
	
	//假session
	@ModelAttribute("UserId")
	public String fakeSession() {
		
		return "abc1";
	}
	
	//進入購物車
	@RequestMapping("/getIntoCart.func")
	public String getIntoUserCart(@ModelAttribute("UserId") String userId, HttpServletRequest request, Model model) {
		
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/Cart"); //取得路徑
		List<Cart> cartList = new ArrayList<>();

		try {
			cartList = userUtilService.goIntoCart(path, userId);
			if (cartList != null) {
				System.out.println(cartList);
				model.addAttribute("CartList", cartList);
				model.addAttribute("length",cartList.size());
			}

		} catch ( Exception e) {
			e.printStackTrace();
		}
		
		return "com/UserCart";
	}
	
	//刪除購物車商品
	@PostMapping(path = "/getRemoveCart.func")
	public String getRemoveCart(@ModelAttribute("UserId") String userId, @RequestParam("comId") int comId, HttpServletRequest request, Model model) {
		
		System.out.println("userID: " + userId);
		System.out.println("comID: " + comId);
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/Cart"); //取得路徑
		List<Cart> cartList = new ArrayList<>();

		try {
			cartList = userUtilService.deleteCart(path, userId, comId);
			System.out.println(cartList);
			
			model.addAttribute("CartList", cartList);
			model.addAttribute("length", cartList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "com/UserCart";
	}
}
