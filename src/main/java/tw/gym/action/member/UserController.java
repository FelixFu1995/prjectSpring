package tw.gym.action.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import tw.gym.model.member.Member;
import tw.gym.service.member.MemberService;

@Controller
public class UserController {
	
	@Autowired
	private MemberService memberService;
	
	//搜尋完資料庫資料後將資料顯示到 userUpdate.jsp
	@GetMapping("/userDetails.controller")
	public String showFindUserDetails(HttpSession httpSession,  Model	model) {
		
		Object userId = httpSession.getAttribute("userId");
//		Object userAccount = httpSession.getAttribute("userAccount"); 
	    Object userName = httpSession.getAttribute("userName");
	    Object userGender = httpSession.getAttribute("userGender"); 
	    Object userBirthDay = httpSession.getAttribute("userBirthDay");
	    Object userAddress = httpSession.getAttribute("userAddress");
	    Object userTel = httpSession.getAttribute("userTel");
	    Object userEmail = httpSession.getAttribute("userEmail");
	    Object userNickName = httpSession.getAttribute("userNickName");

	    model.addAttribute("userId", userId);
	    model.addAttribute(httpSession.getAttribute("userAccount"));
	    model.addAttribute("userName", userName);
	    model.addAttribute("userGender", userGender);
	    model.addAttribute("userBirthDay", userBirthDay);
	    model.addAttribute("userAddress", userAddress);
	    model.addAttribute("userTel", userTel);
	    model.addAttribute("userEmail", userEmail);
	    model.addAttribute("userNickName", userNickName);
		
		return "member/userUpdate";
	}
	
	
	//會員更新後跳轉到userDetail.jsp 顯示資料
	@PostMapping("/userUpdate.controller")
	public String updateUser(@RequestParam("userId") int userId, 
            @RequestParam("userAccount") String userAccount,
            @RequestParam("userName") String userName,
            @RequestParam("userGender") String userGender,
            @RequestParam("userAddress") String userAddress,
            @RequestParam("userBirthDay") @DateTimeFormat(pattern = "yyyy-MM-dd") Date userBirthDay,
            @RequestParam("userTel") String userTel,
            @RequestParam("userEmail") String userEmail,
            @RequestParam("userNickName") String userNickName,
            HttpSession session) {

		Member updatedMember = memberService.updateUserDetails(userId, userAccount, userName, userGender, 
                                              userAddress, userBirthDay, userTel, userEmail, userNickName);

			session.setAttribute("userId", updatedMember.getUserId());
		    session.setAttribute("userAccount", updatedMember.getUserAccount());
		    session.setAttribute("userName", updatedMember.getUserName());
		    session.setAttribute("userGender", updatedMember.getUserGender());
		    
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    String formattedBirthDay = sdf.format(updatedMember.getUserBirthDay());
		    session.setAttribute("userBirthDay", formattedBirthDay);
		    
		    session.setAttribute("userAddress", updatedMember.getUserAddress());
		    session.setAttribute("userTel", updatedMember.getUserTel());
		    session.setAttribute("userEmail", updatedMember.getUserEmail()); 
		    session.setAttribute("userNickName", updatedMember.getUserNickName()); 
		
		 return "member/userDetail";
	}
	
}