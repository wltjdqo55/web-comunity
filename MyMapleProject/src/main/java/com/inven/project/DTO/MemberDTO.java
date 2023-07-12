package com.inven.project.DTO;

public class MemberDTO {
	int num;
	String userName;
	String userId;
	String userPassword;
	String userNickName;
	String userPhoneNumber;
	String userEmail;
	String wtime;
	int userBirth;
	boolean isMailReceptionChecked;
	boolean isPhoneReceptionChecked;
	String role;
	String power;
	
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}
	public boolean getIsMailReceptionChecked() {
		return isMailReceptionChecked;
	}
	public void setIsMailReceptionChecked(boolean isMailReceptionChecked) {
		this.isMailReceptionChecked = isMailReceptionChecked;
	}
	public boolean getIsPhoneReceptionChecked() {
		return isPhoneReceptionChecked;
	}
	public void setIsPhoneReceptionChecked(boolean isPhoneReceptionChecked) {
		this.isPhoneReceptionChecked = isPhoneReceptionChecked;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
