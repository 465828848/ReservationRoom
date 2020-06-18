package com.reservation.room.service;

import com.reservation.room.dao.TimePointMapper;
import com.reservation.room.model.TimePointModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("TimePointService")
@Transactional
public class TimePointService {

	@Autowired
	private TimePointMapper TimePointMapper;

	public List<TimePointModel> selectAllTime() {
		List<TimePointModel> TimePointModelList = TimePointMapper.selectAllTime();
		return TimePointModelList;
	}
}
