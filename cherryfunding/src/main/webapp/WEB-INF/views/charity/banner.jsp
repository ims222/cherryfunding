<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Banner -->
<div id="banner" class="container">
	<section>
		<p>
			안녕하세요 <strong>CherryFunding</strong>입니다.<br> 후원신청은 아래 신청버튼을 눌러주세요<br> 
			<a href="http://templated.co">템플릿</a>
			<a href="http://twitter.com/templatedco">Twitter</a>.
			<a href="${pageContext.request.contextPath}/charity/charityApplication"
			class="button medium">후원신청하기</a>
		</p>
		
		
		<a href="${pageContext.request.contextPath}/charity/prepareCharityList"
		class="button medium">준비중 후원</a>
		<a href="${pageContext.request.contextPath}/charity/ingCharityList"
		class="button medium">진행중 후원</a>
		<a href="${pageContext.request.contextPath}/charity/endCharityList"
		class="button medium">종료된 후원</a>
	</section>
	
</div>