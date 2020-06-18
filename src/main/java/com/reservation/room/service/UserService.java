package com.reservation.room.service;

import com.reservation.room.common.Constant;
import com.reservation.room.dao.UserMapper;
import com.reservation.room.model.UserModel;
import com.reservation.room.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service("UserService")
@Transactional
public class UserService {

	@Autowired
	private UserMapper userMapper;

	public String checkLogin(HttpSession httpSession ,String userName , String userPassword) {
		if(StringUtil.isEmpty(userName) || StringUtil.isEmpty(userPassword)){
			return Constant.FAIL;
		}
		Map<String,String> params = new HashMap<>();
		params.put("userName",userName);
		params.put("userPassword",userPassword);
		UserModel userModel = userMapper.selectByLogin(params);
		if(userModel == null){
			return Constant.FAIL;
		}
		httpSession.setAttribute(Constant.LOGIN_USER, userModel);
		return Constant.SUCCESS;
	}
}
