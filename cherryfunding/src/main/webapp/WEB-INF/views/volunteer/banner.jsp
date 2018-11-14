<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function idCheck(){
	var id='${sessionScope.id}';
	if(!id){
		alert("로그인 해주세욧");
	}else{
		window.location.href="${pageContext.request.contextPath}/volunteer/insertVolunteer";
	}
}
</script>
<!-- Banner -->
<div id="banner" class="container">
	<section>
		<p>
			안녕하세요 <strong>CherryFunding</strong>입니다.<br> 봉사신청은 아래 신청버튼을 눌러주세요<br> 
			<a href="http://templated.co">템플릿</a>
			<a href="http://twitter.com/templatedco">Twitter</a>.
			<a href="javascript: return false;"
			class="button medium" onclick="idCheck();">봉사신청하기</a>
		</p>
	</section>
	
</div>