package tw.gym.action.member;


import org.springframework.web.bind.annotation.*;

import tw.gym.service.member.MemberService;

import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;

@RestController
@RequestMapping("/api") 
public class DeleteMember {

	@Autowired
	private MemberService memberService;

	@PostMapping("/DeleteMember")
	public ResponseEntity<?> deleteMember(@RequestParam String userId) {
		try {
			int parsedUserId = Integer.parseInt(userId);
			memberService.deleteMember(parsedUserId);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
