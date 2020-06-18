package com.reservation.room.service;

import com.reservation.room.dao.AppointmentMapper;
import com.reservation.room.model.AppointmentModel;
import com.reservation.room.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service("AppointmentService")
@Transactional
public class AppointmentService {

	@Autowired
	private AppointmentMapper appointmentMapper;

	public String reservationRoom(AppointmentModel appointmentModel) {
		// TODO 输入check未完成
		if (StringUtil.isEmpty(appointmentModel.getConferenceRoom())) {
			return "请选择会议室！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointDate())) {
			return "请填写预约日期！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointBeginTime())) {
			return "请填写预约开始时间！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointEndTime())) {
			return "请填写预约结束时间！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointUser())) {
			return "请填写预订人！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointPhone())) {
			return "请填写预订人电话！";
		}
		if (StringUtil.isEmpty(appointmentModel.getAppointMail())) {
			return "请填写预订人邮箱！";
		}
		if (!appointmentModel.getAppointBeginTime().matches("[0-9]]?")) {
			return "请重新选择预约开始时间！";
		}
		if (!appointmentModel.getAppointEndTime().matches("[0-9]]?")) {
			return "请重新选择预约结束时间！";
		}
		int beginTime = Integer.valueOf(appointmentModel.getAppointBeginTime());
		int endTime = Integer.valueOf(appointmentModel.getAppointEndTime());
		if (beginTime >= endTime) {
			return "预订结束时间必须大于预订开始时间!";
		}
		int chkCount = appointmentMapper.checkReservationRoom(appointmentModel);
		if (chkCount > 0) {
			return "该预约时间不可用，已被其他人预约";
		}
		appointmentMapper.reservationRoom(appointmentModel);
		return "";
	}

	public List<AppointmentModel> selectToDayAppointment () {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		List<AppointmentModel> appointmentModelList = appointmentMapper.selectToDayAppointment(df.format(new Date()));
		return appointmentModelList;
	}
}
