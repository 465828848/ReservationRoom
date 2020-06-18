package com.reservation.room.controller;

import com.reservation.room.common.Constant;
import com.reservation.room.model.AppointmentModel;
import com.reservation.room.model.UserModel;
import com.reservation.room.service.AppointmentService;
import com.reservation.room.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@RestController
public class AppointmentController {
	@Autowired
	AppointmentService appointmentService;

	@RequestMapping("/reservationRoom")
	public Map<String ,String> checkLogin(AppointmentModel appointmentModel, HttpSession httpSession){
		UserModel userModel = (UserModel) httpSession.getAttribute(Constant.LOGIN_USER);
//		appointmentModel.setUserName(userModel.getUserName());
		// 免用户登录，调试用
		appointmentModel.setUserName("gaibj");
		appointmentModel.setCreateTime(String.valueOf(System.currentTimeMillis()));
		Map<String,String> result = new HashMap<>();
		String resMsg = appointmentService.reservationRoom(appointmentModel);
		if(StringUtil.isEmpty(resMsg)){
			result.put(Constant.RESULT,Constant.SUCCESS);
		}else{
			result.put(Constant.RESULT,Constant.FAIL);
			result.put(Constant.ERROR_MSG,resMsg);
		}
		return result;
	}

}