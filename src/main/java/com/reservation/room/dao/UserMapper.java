package com.reservation.room.dao;


import com.reservation.room.model.UserModel;

import java.util.Map;

public interface UserMapper {
    UserModel selectByLogin(Map<String,String> params);
}