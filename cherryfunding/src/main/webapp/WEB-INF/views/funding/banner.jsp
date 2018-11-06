<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function loginPlease(){
		var id = '${sessionScope.id}';
		if(!id){
			alert('로그인 플리즈');
			return false;
		}
		return true;
	}
</script>
<!-- Banner -->
<div id="banner" class="container">
	<section>
		<p>
			안녕하세요 <strong>CherryFunding</strong>입니다.<br> 자신의 제품을 크라우드펀딩하기 위해
			펀딩신청하기를 눌러주세요.<br> <a href="http://templated.co">템플릿</a>
			<a href="http://twitter.com/templatedco">Twitter</a>.
			
			<a href="${pageContext.request.contextPath}/funding/fundingApplication"
			class="button medium" onclick="return loginPlease();">펀딩신청하기</a>
		</p>
		
		
		<a href="${pageContext.request.contextPath}/funding/prepareFundingList"
		class="button medium">준비중 펀딩</a>
		<a href="${pageContext.request.contextPath}/funding/ingFundingList"
		class="button medium">진행중 펀딩</a>
		<a href="${pageContext.request.contextPath}/funding/endFundingList"
		class="button medium">종료된 펀딩</a>
	</section>
	
</div>