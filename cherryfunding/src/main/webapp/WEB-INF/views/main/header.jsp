<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="skel-panels-fixed container">
	<div class="navbar w3-right-align">
		<a class="active" href="${pageContext.request.contextPath}/">CherryFunding</a>
		<a href="${pageContext.request.contextPath}/charity/ingCharityList"><i class='fas fa-seedling'></i> 후원</a>
		<a href="${pageContext.request.contextPath}/funding/ingFundingList"><i class='fas fa-piggy-bank'></i> 펀딩</a>
		<a href="${pageContext.request.contextPath}/sharing/sharingList"><i class='fas fa-gift'></i> 나눔</a>
		<a href="${pageContext.request.contextPath}/volunteer/volunteerList"><i class='fas fa-hand-holding-heart'></i> 봉사</a>
	</div>
</div>