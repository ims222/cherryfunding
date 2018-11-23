<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/demo.css">
	<link rel="stylesheet" href="css/footer-distributed.css">
		
	
<div id="main">
	<div class="container">
		<div class="w3-center">
			<h1>리워드 신청 선공!!</h1>
			<c:set value="0" var="totPrice"/>
			<c:forEach var="reward" items="${rewardList}">
				${reward.title} <fmt:formatNumber value="${reward.price}" pattern="#,###"/>원 ${reward.amount}개 <br>
				<fmt:formatNumber value="${reward.price * reward.amount}" pattern="#,###"/>원<br>
				<br><br>	
				<c:set value="${totPrice + (reward.price * reward.amount)}" var="totPrice"/>
			</c:forEach>
			닉네임::${vo.nick}<br>
			합계::<fmt:formatNumber value="${totPrice}" pattern="#,###"/> 원<br>
			잔고::<fmt:formatNumber value="${vo.balance}" pattern="#,###"/> 원<br>
			<button class="w3-btn w3-block w3-teal" onclick="location.href='${pageContext.request.contextPath}/funding/ingFundingList'">목록</button>
		</div>
		
		
	</div>
</div>