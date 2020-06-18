<%@ page import="com.reservation.room.common.Constant" %>
<%@ page import="com.reservation.room.model.UserModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@page isELIgnored="false" %>
<%
	UserModel userModel = (UserModel) session.getAttribute(Constant.LOGIN_USER);
	String userMail = "";
	if(userModel != null){
		userMail = userModel.getUserEmail();
	}else{
		userMail = "用户未登录，拦截器还没做";
	}

%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="description" content="Vanilla javascript plugin for building nice responsive timetables">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Timetable.js demo</title>
		<link rel="stylesheet" href="/css/TimeTable.css">
		<script src="/js/TimeTable.js"></script>
		<script type="text/javascript"src="/js/jquery.min.js"></script>
		<link rel="stylesheet" href="/css/reservation.css">
		<style type="text/css">
			select {
				width: 180px;
			}
			.timetable{
				width: 1225px;
			}
		</style>
	</head>

	<body>
		<div class="hero-unit">
			<form>
				<span>会议室：</span>
				<select name="conferenceRoom">
					<c:forEach items="${requestScope.RoomInfo}" var="roomInfo">
						<option value="${roomInfo.buildingId}-${roomInfo.roomId}">${roomInfo.buildingId}-${roomInfo.roomId}</option>
					</c:forEach>
				</select><br>
				<span>预订时间：</span><input type="text" name="appointDate" size="18" value="<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" />"><br>
				<span>周期预订：未做完<br>
				<span>连续预订：未做完<br>
				<span>开始时间：</span>
				<select name="appointBeginTime">
					<c:forEach items="${requestScope.TimePoint}" var="timePoint">
						<option value="${timePoint.timePoint}">${timePoint.time}</option>
					</c:forEach>
				</select><br>
				<span>结束时间：</span>
				<select name="appointEndTime">
					<c:forEach items="${requestScope.TimePoint}" var="timePoint">
						<option value="${timePoint.timePoint}">${timePoint.time}</option>
					</c:forEach>
				</select><br>
				<span>预订人：</span><input type="text" name="appointUser" size="18" value="王二"><br>
				<span>电话：</span><input type="text" name="appointPhone" size="11" value="12345678901"><br>
				<span>邮箱：</span><input type="text" name="appointMail" size="20" value="<%=userMail%>"><br>
				<span>预订原因：</span>
				<select name="appointCauseCd">
					<option value="01">项目评审</option>
				</select><br>
				<span>预订说明：<textarea cols="18" rows="7" name="appointExplain" placeholder="预订说明"></textarea><br>
				<input type="button" id="btn_reservation" value="预约">
			</form>
		</div>

		<div class="timetable"></div>



		<script>
			var timetable = new Timetable();

			timetable.setScope(9, 21);

			timetable.addLocations([
			<c:forEach items="${requestScope.RoomInfo}" var="roomInfo">
				'${roomInfo.buildingId}-${roomInfo.roomId}',
			</c:forEach>
			'']);

			<c:forEach items="${requestScope.AppointmentInfo}" var="appointment">
			<fmt:parseDate value="${appointment.appointDate}" pattern="yyyy-MM-dd" var="appointDate"/>
			<fmt:parseDate value="${appointment.appointBeginTime}" pattern="HH:mm:ss" var="appointBeginTime"/>
			<fmt:parseDate value="${appointment.appointEndTime}" pattern="HH:mm:ss" var="appointEndTime"/>
			timetable.addEvent(
					'${appointment.appointUser}',
					'${appointment.conferenceRoom}',
					new Date(<fmt:formatDate value="${appointDate}" pattern="yyyy ,MM ,dd ," /><fmt:formatDate value="${appointBeginTime}" pattern="HH ,mm" />),
					new Date(<fmt:formatDate value="${appointDate}" pattern="yyyy ,MM ,dd ," /><fmt:formatDate value="${appointEndTime}" pattern="HH ,mm" />),
					{url: '#'}
					);
			</c:forEach>
			// timetable.addEvent('课程1', 'F3-508', new Date(2020, 6, 4, 9), new Date(2020, 6, 4, 10), {url: '#'});


			var renderer = new Timetable.Renderer(timetable);
			renderer.draw('.timetable');
		</script>

		<script type="text/javascript">
			$(function(){
				//提交表单
				$('#btn_reservation').click(function(){
					let conferenceRoom = $("select[name='conferenceRoom']");
					let appointDate = $("input[name='appointDate']");
					let appointBeginTime = $("select[name='appointBeginTime']");
					let appointEndTime = $("select[name='appointEndTime']");
					let appointUser = $("input[name='appointUser']");
					let appointPhone = $("input[name='appointPhone']");
					let appointMail = $("input[name='appointMail']");
					let appointCauseCd = $("select[name='appointCauseCd']");
					let appointExplain = $("textarea[name='appointExplain']");
					if(conferenceRoom.val() == ''){
						alert('请选择会议室！');
						conferenceRoom.focus();
					}else if(appointDate.val() == ''){
						alert('请填写预约日期！');
						appointDate.focus();
					}else if(appointBeginTime.val() == ''){
						alert('请填写预约开始时间！');
						appointBeginTime.focus();
					}else if(appointEndTime.val() == ''){
						alert('请填写预约结束时间！');
						appointEndTime.focus();
					}else if(appointUser.val() == ''){
						alert('请填写预订人！');
						appointUser.focus();
					}else if(appointPhone.val() == ''){
						alert('请填写预订人电话！');
						appointPhone.focus();
					}else if(appointMail.val() == ''){
						alert('请填写预订人邮箱！');
						appointMail.focus();
					}else if(appointBeginTime.val() >= appointEndTime.val()){
						alert('预订结束时间必须大于预订开始时间!');
						appointEndTime.focus();
					}else{
						$.ajax({
							//几个参数需要注意一下
							type: "POST",//方法类型
							dataType: "json",//预期服务器返回的数据类型
							url: "/reservationRoom" ,//url
							data: {
								conferenceRoom: conferenceRoom.val(),
								appointDate: appointDate.val(),
								appointBeginTime: appointBeginTime.val(),
								appointEndTime: appointEndTime.val(),
								appointUser: appointUser.val(),
								appointPhone: appointPhone.val(),
								appointMail: appointMail.val(),
								appointCauseCd: appointCauseCd.val(),
								appointExplain: appointExplain.val(),
							},
							success:function(data) {
								if (data.result == "success") {
									alert("预约成功!");
									window.location.href = "/index";
								} else {
									alert(data.<%=Constant.ERROR_MSG%>);
								}
							},
							error : function() {
								alert("发生异常");
							}
						});
					}
				});
			});
		</script>
	</body>

</html>