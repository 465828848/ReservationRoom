package com.reservation.room.model;

public class UserModel {
	private String userName;
	private String userPassword;
	private String userFullName;
	private String userEmail;

	public UserModel() {

	}

	public UserModel(String userName, String userPassword, String userFullName, String userEmail) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userFullName = userFullName;
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}
