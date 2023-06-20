package tw.gym.model.member;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity @Table(name = "members")
@Component
public class Member {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String userAccount; 
	private String userPassword;
	private String userName;
	private String userNickName;
	private String userGender;
	private String userAddress;
	private String userTel;
	private String userEmail;
	private Date userBirthDay;
	private Date userRegisterDate;
	private int userTotalSpend = 0;
	private BigDecimal userRewardPoint = BigDecimal.ZERO;
	private String userPermission = "0"; // 根据你的需要调整，如果这是一个应该是 `int` 类型的字段，你可能需要更改字段类型

	public Member() {
	}

	public Member(int userId, String userAccount, String userPassword, String userName, String userNickName,
			String userGender, String userAddress, String userTel, String userEmail, Date userBirthDay,
			Date userRegisterDate, int userTotalSpend, BigDecimal userRewardPoint, String userPermission) {
		this.userId = userId;
		this.userAccount = userAccount;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userNickName = userNickName;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.userBirthDay = userBirthDay;
		this.userRegisterDate = userRegisterDate;
		this.userTotalSpend = userTotalSpend;
		this.userRewardPoint = userRewardPoint;
		this.userPermission = userPermission;
	}
	
	//接收登入資料
//	public Member(String userAccount, String userPassword) {
//        this.userAccount = userAccount;
//        this.userPassword = userPassword;
//    }
	

	public Date getUserRegisterDate() {
		return userRegisterDate;
	}
	public int getUserTotalSpend() {
		return userTotalSpend;
	}
	public void setUserTotalSpend(int userTotalSpend) {
		this.userTotalSpend = userTotalSpend;
	}
	public BigDecimal getUserRewardPoint() {
		return userRewardPoint;
	}
	public void setUserRewardPoint(BigDecimal userRewardPoint) {
		this.userRewardPoint = userRewardPoint;
	}
	public String getUserPermission() {
		return userPermission;
	}
	public void setUserPermission(String userPermission) {
		this.userPermission = userPermission;
	}
	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}
	public Date getUserBirthDay() {
		return userBirthDay;
	}
	public void setUserBirthDay(Date userBirthDay) {
		this.userBirthDay = userBirthDay;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

}