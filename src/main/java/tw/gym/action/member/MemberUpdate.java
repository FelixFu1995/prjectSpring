package tw.gym.action.member;

import org.springframework.web.bind.annotation.*;

import tw.gym.model.member.Member;
import tw.gym.service.member.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.Date;
import java.util.Map;
import java.text.SimpleDateFormat;

@RestController
@RequestMapping("/api")
public class MemberUpdate {

	@Autowired
	private MemberService memberService;

//    @Autowired
//    public MemberUpdate(MemberService memberService) {
//        this.memberService = memberService;
//    }

    @PostMapping("/memberUpdate")
    public ResponseEntity<Member> memberUpdate(@RequestBody Map<String, String> body) {
        try {
            int userId = Integer.parseInt(body.get("userId"));
            String userAccount = body.get("userAccount");
            String userPassword = body.get("userPassword");
            String userName = body.get("userName");
            String userGender = body.get("userGender");
            String userAddress = body.get("userAddress");
            String userTel = body.get("userTel"); 
            String userEmail = body.get("userEmail");

            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date userBirthDay = formatter.parse(body.get("userBirthDay"));

            Member member = memberService.memberUpdate(userId, userAccount, userPassword, userName, userGender, userAddress, userTel, userEmail, userBirthDay);
            return new ResponseEntity<>(member, HttpStatus.OK);
 
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
