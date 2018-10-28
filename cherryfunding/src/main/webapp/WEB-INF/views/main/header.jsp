<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="skel-panels-fixed">
	<div id="logo">아나따
		<h1>
			<a href="${pageContext.request.contextPath}">CherryFunding</a>
		</h1>
		<span class="tag">by cherryfunding</span>
	</div>
	<nav id="nav">
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/charity/ingCharityList">후원</a></li>
			<li><a href="${pageContext.request.contextPath}/funding/ingFundingList">펀딩</a></li>
			<li><a href="${pageContext.request.contextPath}/sharing/sharingList">나눔</a></li>
			<li><a href="${pageContext.request.contextPath}">봉사</a></li>
		</ul>
	</nav>
</div>