<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Banner -->
<div id="banner" class="container">
	<p>
		안녕하세요 <strong>CherryFunding</strong>입니다.<br> 후원신청은 아래 신청버튼을 눌러주세요<br> 
		
		<button data-voice="후원신청하기" class="w3-btn w3-block w3-teal"
		onclick="location.href='${pageContext.request.contextPath}/charity/charityApplication'">
		후원신청하기</button>
	</p>
	
	<div class="w3-bar w3-center">
		<button data-voice="준비중 후원" class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/charity/prepareCharityList'">준비중 후원</button>
		<button data-voice="진행중 후원" class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/charity/ingCharityList'">진행중 후원</button>
		<button data-voice="종료된 펀딩" class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/charity/endCharityList'">종료된 후원</button>
	</div>
</div>
