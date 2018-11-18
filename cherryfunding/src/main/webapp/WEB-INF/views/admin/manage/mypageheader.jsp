<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="skel-panels-fixed container">
	<div class="navbar w3-right-align">
		<a class="activeMenu" href="${pageContext.request.contextPath}/admin">CherryFunding</a>
		<a href="${pageContext.request.contextPath}/admypagea"><i class='fas fa-seedling'></i> 승인관리</a>
		<a href="${pageContext.request.contextPath}/confirmList"><i class='fas fa-piggy-bank'></i> 승인확인</a>
		<a href="${pageContext.request.contextPath}/usermanage"><i class='fas fa-gift'></i> 회원관리</a>
		<a href="${pageContext.request.contextPath}/visitorstatistics?today=${toDay }"><i class='fas fa-hand-holding-heart'></i> 통계</a>
	</div>
	

	
	
</div>