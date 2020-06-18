package com.reservation.room.model;

public class RoomInfoModel {
	private String buildingId;
	private String roomId;
	private String roomName;
	private String roomPeople;

	public RoomInfoModel() {

	}

	public RoomInfoModel(String buildingId, String roomId, String roomName, String roomPeople) {
		this.buildingId = buildingId;
		this.roomId = roomId;
		this.roomName = roomName;
		this.roomPeople = roomPeople;
	}

	public String getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(String roomPeople) {
		this.roomPeople = roomPeople;
	}
}
