package tw.gym.model.member;

import java.math.BigDecimal;
import java.util.Date;

public class MemberDTO {
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
    private int userTotalSpend;
    private BigDecimal userRewardPoint;
    private String userPermission;
	
    
    
    
    
    
    
    public MemberDTO() {
	}
    
	public MemberDTO(int userId, String userAccount, String userPassword, String userName, String userNickName,
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
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userAccount=" + userAccount + ", userPassword=" + userPassword
				+ ", userName=" + userName + ", userNickName=" + userNickName + ", userGender=" + userGender
				+ ", userAddress=" + userAddress + ", userTel=" + userTel + ", userEmail=" + userEmail
				+ ", userBirthDay=" + userBirthDay + ", userRegisterDate=" + userRegisterDate + ", userTotalSpend="
				+ userTotalSpend + ", userRewardPoint=" + userRewardPoint + ", userPermission=" + userPermission + "]";
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
	public Date getUserBirthDay() {
		return userBirthDay;
	}
	public void setUserBirthDay(Date userBirthDay) {
		this.userBirthDay = userBirthDay;
	}
	public Date getUserRegisterDate() {
		return userRegisterDate;
	}
	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
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
    
    
    
    
}
