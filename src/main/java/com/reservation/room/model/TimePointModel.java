package com.reservation.room.model;

public class TimePointModel {
	private String timePoint;
	private String time;

	public TimePointModel() {

	}

	public TimePointModel(String timePoint, String time) {
		this.timePoint = timePoint;
		this.time = time;
	}

	public String getTimePoint() {
		return timePoint;
	}

	public void setTimePoint(String timePoint) {
		this.timePoint = timePoint;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
