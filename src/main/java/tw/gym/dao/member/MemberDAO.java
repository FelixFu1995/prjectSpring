package tw.gym.dao.member;


import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.gym.model.member.Member;
import tw.gym.model.member.MemberDTO;

@Repository
@Transactional
public class MemberDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
		
      
    //------------新增類---------- 
    
       // 註冊
	 public Member register(Member member) {
	        Session session = sessionFactory.getCurrentSession();
	        Member existingMember = session.get(Member.class, member.getUserId());
	        
	        if(existingMember == null) {
	            session.persist(member);
	            return member;
	        }
	        return null;
	    }
	
       
        
    //------------查詢類----------
       
       //後台查詢所有會員
       public List<Member> selectAllMember(){
    	   Session session = sessionFactory.getCurrentSession();
    	   Query<Member> query = session.createQuery("from Member", Member.class);
    	   return query.list();
       }
        
       //登入判定
	 public Member checkLogin(MemberDTO memberDTO)  {
         Session session = sessionFactory.openSession();
         String hqlstr = "from Member where userAccount=:acc and userPassword=:pwd";
         Query<Member> query = session.createQuery(hqlstr,Member.class);
         query.setParameter("acc", memberDTO.getUserAccount());
         query.setParameter("pwd", memberDTO.getUserPassword());
         
         Member member = query.uniqueResult();
         System.out.println("Query result: " + member);
         session.close();
         
         return member;
	 }
      
       
       //會員查詢自己資料
      
     
    //---------更新類--------------

       // 後台更新會員資料
       public Member memberUpdate(int userId, String userAccount,  String userPassword,  String userName,
    		   String userGender, String userAddress,  String userTel, String userEmail, Date userBirthDay ) {
    	   Session session = sessionFactory.getCurrentSession();
    	    Member result = session.get(Member.class, userId);
    	    if (result!=null) {
    	    	 result.setUserAccount(userAccount);
    	         result.setUserPassword(userPassword);
    	         result.setUserName(userName);
    	         result.setUserGender(userGender);
    	         result.setUserAddress(userAddress);
    	         result.setUserTel(userTel);
    	         result.setUserEmail(userEmail);
    	         result.setUserBirthDay(userBirthDay);
			}
			return result;
    	    
    	}

       public Member updateUserDetails(int userId, String userAccount, String userName, String userGender, String userAddress, Date userBirthDay, String userTel, String userEmail, String userNickName)  {
           Session session = sessionFactory.getCurrentSession();
    	   Member result = session.get(Member.class, userId);
           if (result!=null) {
			result.setUserAccount(userAccount);
			result.setUserName(userName);
			result.setUserGender(userGender);
			result.setUserAddress(userAddress);
			result.setUserBirthDay(userBirthDay);
			result.setUserTel(userTel);
			result.setUserEmail(userEmail);
			result.setUserNickName(userNickName);
		}
           return result;
     
   }

       
    //----------刪除類-------------
       
      //後臺刪除會員
     public boolean deleteMember(int userId) {
    	 Session session = sessionFactory.getCurrentSession();
    	 Member result = session.get(Member.class, userId);
    	 if (result!=null) {
			session.remove(result);
			return true;
		}
    	 return false;
    			 
     }
	
    
}