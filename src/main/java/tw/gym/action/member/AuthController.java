package tw.gym.action.member;


import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import tw.gym.model.member.Member;
import tw.gym.model.member.MemberDTO;
import tw.gym.service.member.MemberService;




@Controller
public class AuthController {
		
	
		@GetMapping("/Login") //這裡只能getMapping 這邊為要輸入的網址
	    public String showLoginPage() {
	        return "member/Login";  //這邊為會導入到的頁面 
	    } 
		@Autowired 
		private MemberService memberService;
		
		 @PostMapping("/checkLogin.controller") // 对应到登录表单的action
		    public String handleLogin(@RequestParam("userAccount") String acc, @RequestParam("userPassword") String pwd, Model model, HttpSession httpsession) {

		     HashMap<String, String> errors = new HashMap<String,String>();
		     model.addAttribute("errors", errors);

		        if(acc==null || acc.length()==0) {
		        	errors.put("acc", "請輸入帳號");
		        }
		          
		        if(pwd==null || pwd.length()==0) {
		        	errors.put("pwd", "請輸入密碼");
		        }
		        
		        if(errors!=null && !errors.isEmpty()) {
		        	return "member/Login";
		        }
		        System.out.println("---------------------------------------------------");
		        System.out.println("Before checking login: acc=" + acc + ", pwd=" + pwd);
		        
		        MemberDTO memberDTO = new MemberDTO();
		        memberDTO.setUserAccount(acc);
		        memberDTO.setUserPassword(pwd);
		        Member result = memberService.checkLogin(memberDTO);
		        System.out.println("After checking login: result=" + result);
		        System.out.println();
		        
		        if (result!=null) {
		        	 // If the user is authenticated, add their permission to the session
		        	httpsession.setAttribute("userId", result.getUserId());
		        	httpsession.setAttribute("userAccount", result.getUserAccount());
		        	httpsession.setAttribute("userName", result.getUserName());
		        	httpsession.setAttribute("userGender", result.getUserGender());
		        	
		        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        	String formattedDate = dateFormat.format(result.getUserBirthDay());
		        	httpsession.setAttribute("userBirthDay", formattedDate);
		        	httpsession.setAttribute("userAddress", result.getUserAddress());
		        	httpsession.setAttribute("userTel", result.getUserTel());
		        	httpsession.setAttribute("userEmail", result.getUserEmail());
		        	httpsession.setAttribute("userNickName", result.getUserNickName());
		        	httpsession.setAttribute("userPermission", result.getUserPermission());
		        	httpsession.setAttribute("userLoggedIn", true);
		        	
		        	System.out.println(result.getUserName());
		        	System.out.println(result.getUserGender());
		        	
		        	  if ("0".equals(result.getUserPermission())) {
		  	            return "member/FirstPage";
		  	        } else if ("1".equals(result.getUserPermission())) {
		  	            return "member/Admin";
		  	        }
		                
		        }
		          errors.put("msg", "請輸入正確的帳號密碼");
		          return "member/Login";
		 }
		 
		  @PostMapping("/logout")
		    public String handleLogout(HttpSession session) {
		        session.invalidate();
		        return "member/FirstPage";
		    }
}
