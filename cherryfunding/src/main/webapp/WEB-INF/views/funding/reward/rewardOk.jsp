<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	
	
	<!-- 후기 -->
</div>

<div id="main">
	<div class="container">
		<div class="w3-center">
			<h1>리워드 신청 선공!!</h1>
			<c:set value="0" var="totPrice"/>
			<c:forEach var="reward" items="${rewardList}">
				${reward.title} <fmt:formatNumber value="${reward.price}" pattern="#,###"/>원 ${reward.amount}개 <br>
				<fmt:formatNumber value="${reward.price * reward.amount}" pattern="#,###"/>원<br>
				<br><br>	
				<c:set value="${totPrice + reward.price}" var="totPrice"/>
			</c:forEach>
			닉네임::${vo.nick}<br>
			합계::<fmt:formatNumber value="${totPrice}" pattern="#,###"/> 원<br>
			잔고::<fmt:formatNumber value="${vo.balance}" pattern="#,###"/> 원<br>
			<button>목록</button>
		</div>
		
		
	</div>
</div>