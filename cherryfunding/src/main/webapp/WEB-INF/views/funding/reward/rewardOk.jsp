<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/footer-distributed.css">
		
	
<div id="main">
	<div class="container">
		<div class="w3-center">
			<div class="jumbotron text-xs-center">
			  <h1 class="display-3" >감사합니다.</h1>
			  	<p class="lead">다음에 대한 리워드 신청이 정상 처리되었습니다.</p>
					<c:set value="0" var="totPrice"/>
						<c:forEach var="reward" items="${rewardList}">
							${reward.title} <fmt:formatNumber value="${reward.price}" pattern="#,###"/>원 ${reward.amount}개 <br>
							<fmt:formatNumber value="${reward.price * reward.amount}" pattern="#,###"/>원<br>
							<br>	
							<c:set value="${totPrice + (reward.price * reward.amount)}" var="totPrice"/>
						</c:forEach>
					닉네임::${vo.nick}<br>
					결제액::<fmt:formatNumber value="${totPrice}" pattern="#,###"/> 원<br>
					잔고::<fmt:formatNumber value="${vo.balance}" pattern="#,###"/> 원<br>
			  <button class="w3-btn w3-block w3-teal" style="margin-top:15px;" onclick="location.href='${pageContext.request.contextPath}/funding/ingFundingList'">목록</button>
			</div>
		</div>
	</div>
</div>

