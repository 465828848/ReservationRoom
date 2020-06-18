package com.reservation.room.dao;

import com.reservation.room.model.AppointmentModel;
import com.reservation.room.model.RoomInfoModel;

import java.util.Date;
import java.util.List;

public interface AppointmentMapper {
    int checkReservationRoom(AppointmentModel appointmentModel);
    int reservationRoom(AppointmentModel appointmentModel);
    List<AppointmentModel> selectToDayAppointment(String date);
}