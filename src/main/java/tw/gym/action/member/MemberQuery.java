package tw.gym.action.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tw.gym.service.member.MemberService;

@Controller
public class MemberQuery {
	
	  @Autowired
	    private MemberService memberService;

	    @GetMapping("/MemberQuery")
	    public String showMemberQuery(Model model) {
	        model.addAttribute("members", memberService.selectAllMember());
	        return "member/MemberQuery";
	    }
	    
	    
	    
}
