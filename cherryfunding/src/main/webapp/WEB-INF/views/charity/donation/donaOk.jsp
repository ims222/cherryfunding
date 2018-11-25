<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="main">
	<div class="container">
		<div class="w3-center">
			<div class="w3-large" style="margin: 30px 30px;">
				${nick} 님 <fmt:formatNumber value="${vo.amount}" pattern="#,###" />원 후원 감사합니다.
			</div>
		<div class="col-md-12">
			<button class="w3-btn w3-block w3-teal" style="margin-top:15px;" onclick="location.href='${pageContext.request.contextPath}/charity/ingCharityList'">목록</button>
		</div>
	</div>
</div>