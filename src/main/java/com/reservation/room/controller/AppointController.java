package com.reservation.room.controller;

import com.reservation.room.common.Constant;
import com.reservation.room.service.AppointmentService;
import com.reservation.room.service.RoomInfoService;
import com.reservation.room.service.TimePointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class AppointController {

    @Autowired
    RoomInfoService roomInfoService;

    @Autowired
    TimePointService timePointService;

    @Autowired
    AppointmentService appointmentService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("Index");
        modelAndView.addObject(Constant.ROOM_INFO,roomInfoService.selectAllRoom());
        modelAndView.addObject(Constant.TIME_POINT,timePointService.selectAllTime());
        modelAndView.addObject(Constant.APPOINTMENT_INFO,appointmentService.selectToDayAppointment());
        return modelAndView;
    }

}