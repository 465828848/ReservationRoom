package com.reservation.room.service;

import com.reservation.room.dao.RoomInfoMapper;
import com.reservation.room.model.RoomInfoModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Service("RoomInfoService")
@Transactional
public class RoomInfoService {

	@Autowired
	private RoomInfoMapper roomInfoMapper;

	public List<RoomInfoModel> selectAllRoom() {
		List<RoomInfoModel> roomInfoModelList = roomInfoMapper.selectAllRoom();
		return roomInfoModelList;
	}
}
