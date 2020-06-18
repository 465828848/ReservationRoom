package com.reservation.room.dao;

import com.reservation.room.model.RoomInfoModel;

import java.util.List;

public interface RoomInfoMapper {
    List<RoomInfoModel> selectAllRoom();
}