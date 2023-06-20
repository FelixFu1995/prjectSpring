package tw.gym.action.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class WebPageController {
	
	@GetMapping("/FirstWebPage")
	public String showFirstPage(HttpSession session) {
		return "member/FirstPage";
	} 
	
	
	@GetMapping("/AdminWebPage")
	public String showAdminPage() {
		return "member/Admin";
	}

}
