package com.reservation.room.dao;


import com.reservation.room.model.TimePointModel;

import java.util.List;

public interface TimePointMapper {
    List<TimePointModel> selectAllTime();
}