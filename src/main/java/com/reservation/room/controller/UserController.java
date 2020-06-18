package com.reservation.room.controller;

import com.reservation.room.common.Constant;
import com.reservation.room.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@RestController
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("/checkLogin")
	public Map<String ,String> checkLogin(HttpSession httpSession ,String userName , String userPassword){
		Map<String,String> result = new HashMap<>();
		result.put(Constant.RESULT,userService.checkLogin(httpSession,userName,userPassword));
		return result;
	}

}