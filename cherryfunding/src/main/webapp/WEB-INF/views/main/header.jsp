<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="skel-panels-fixed container">
	<div class="navbar w3-right-align">
		<a class="active" href="${pageContext.request.contextPath}/">CherryFunding</a>
		<a href="${pageContext.request.contextPath}/charity/ingCharityList">후원</a>
		<a href="${pageContext.request.contextPath}/funding/ingFundingList">펀딩</a>
		<a href="${pageContext.request.contextPath}/sharing/sharingList">나눔</a>
		<a href="${pageContext.request.contextPath}/volunteer/volunteerList">봉사</a>
	</div>
</div>