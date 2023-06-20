package tw.gym.service.member;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.dao.member.MemberDAO;
import tw.gym.model.member.Member;
import tw.gym.model.member.MemberDTO;



@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberDAO mDao;
	 


	public Member register(Member mBean) {
		return mDao.register(mBean);
	}
	
	public List<Member> selectAllMember(){
		return mDao.selectAllMember();
	}
	 
	public boolean deleteMember(int userId) {
		return mDao.deleteMember(userId);
	}
	
	public Member memberUpdate(int userId, String userAccount,  String userPassword,  String userName,
 		   String userGender, String userAddress,  String userTel, String userEmail, Date userBirthDay ) {
		return mDao.memberUpdate(userId, userAccount, userPassword, userName, userGender, userAddress, userTel, userEmail, userBirthDay);
	}	
	
	public Member checkLogin(MemberDTO memberDTO)  { 
		return mDao.checkLogin(memberDTO);
	}
	
	public Member updateUserDetails(int userId, String userAccount, String userName, String userGender, 
			String userAddress, Date userBirthDay, String userTel, String userEmail, String userNickName) {
		return mDao.updateUserDetails(userId, userAccount, userName, userGender, userAddress, userBirthDay, userTel, userEmail, userNickName);
	}
}
