package com.reservation.room.model;

public class AppointmentModel {
	private String createTime;
	private String conferenceRoom;
	private String userName;
	private String appointDate;
	private String appointBeginTime;
	private String appointEndTime;
	private String appointUser;
	private String appointPhone;
	private String appointMail;
	private String appointCauseCd;
	private String appointExplain;

	public AppointmentModel() {

	}

	public AppointmentModel(String createTime, String conferenceRoom, String userName, String appointDate, String appointBeginTime, String appointEndTime, String appointUser, String appointPhone, String appointMail, String appointCauseCd, String appointExplain) {
		this.createTime = createTime;
		this.conferenceRoom = conferenceRoom;
		this.userName = userName;
		this.appointDate = appointDate;
		this.appointBeginTime = appointBeginTime;
		this.appointEndTime = appointEndTime;
		this.appointUser = appointUser;
		this.appointPhone = appointPhone;
		this.appointMail = appointMail;
		this.appointCauseCd = appointCauseCd;
		this.appointExplain = appointExplain;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getConferenceRoom() {
		return conferenceRoom;
	}

	public void setConferenceRoom(String conferenceRoom) {
		this.conferenceRoom = conferenceRoom;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAppointDate() {
		return appointDate;
	}

	public void setAppointDate(String appointDate) {
		this.appointDate = appointDate;
	}

	public String getAppointBeginTime() {
		return appointBeginTime;
	}

	public void setAppointBeginTime(String appointBeginTime) {
		this.appointBeginTime = appointBeginTime;
	}

	public String getAppointEndTime() {
		return appointEndTime;
	}

	public void setAppointEndTime(String appointEndTime) {
		this.appointEndTime = appointEndTime;
	}

	public String getAppointUser() {
		return appointUser;
	}

	public void setAppointUser(String appointUser) {
		this.appointUser = appointUser;
	}

	public String getAppointPhone() {
		return appointPhone;
	}

	public void setAppointPhone(String appointPhone) {
		this.appointPhone = appointPhone;
	}

	public String getAppointMail() {
		return appointMail;
	}

	public void setAppointMail(String appointMail) {
		this.appointMail = appointMail;
	}

	public String getAppointCauseCd() {
		return appointCauseCd;
	}

	public void setAppointCauseCd(String appointCauseCd) {
		this.appointCauseCd = appointCauseCd;
	}

	public String getAppointExplain() {
		return appointExplain;
	}

	public void setAppointExplain(String appointExplain) {
		this.appointExplain = appointExplain;
	}
}
