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
	<p>
		안녕하세요 <strong>CherryFunding</strong>입니다. 자신의 제품을 크라우드펀딩하기 위해
		펀딩신청하기를 눌러주세요.
		
		<button class="w3-btn w3-block w3-teal"
		onclick="location.href='${pageContext.request.contextPath}/funding/fundingApplication'">
		펀딩신청하기</button>
	</p>
	
	<div class="w3-bar w3-center">
		<button class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/funding/prepareFundingList'">준비중 펀딩</button>
		<button class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/funding/ingFundingList'">진행중 펀딩</button>
		<button class="w3-btn w3-large"
		onclick="location.href='${pageContext.request.contextPath}/funding/endFundingList'">종료된 펀딩</button>
	</div>
</div>