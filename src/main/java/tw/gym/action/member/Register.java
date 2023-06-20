package tw.gym.action.member;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.gym.model.member.Member;
import tw.gym.service.member.MemberService;

@Controller
public class Register {

	@GetMapping("/Register")
	 public ModelAndView showRegisterPage(ModelAndView modelAndView) {
	        modelAndView.setViewName("Register");
	        modelAndView.addObject("member", new Member());
	        return modelAndView;
	    }
	 
	@Autowired
	private MemberService memberService;
	
		
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
				} catch (ParseException e) {
					setValue(null);
				}
			}
			public String getAsText() {
				return new SimpleDateFormat("yyyy-MM-dd").format((Date) getValue());
			}        
		});
	}
	
	@PostMapping("/checkRegister")
    public String handleRegistration(@ModelAttribute("member") Member member, @RequestParam("userAddressFirst") String userAddressFirst, @RequestParam("userAddressDetail") String userAddressDetail) {
        //合併前後地址為一個字串
        
		String userAddress = userAddressFirst + userAddressDetail;
        member.setUserAddress(userAddress);
        
        java.util.Date registerDateUtil = new java.util.Date();
        java.sql.Date registerDateSql = new java.sql.Date(registerDateUtil.getTime());
        member.setUserRegisterDate(registerDateSql);

        Member insertedMember = memberService.register(member);

        if (insertedMember != null) {
            // Registration succeeded, redirect to a success page
            return "member/RegisterSuccess";
        } else {
            // Registration failed, handle the error
            return "member/RegisterFail";
        }
    }
	
}
