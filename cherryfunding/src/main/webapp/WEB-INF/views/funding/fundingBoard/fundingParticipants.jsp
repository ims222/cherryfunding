<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/participants.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/fundingParticipants',
			data:{fNum:'${fNum}'},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data.length > 0){
					var result = "";
					var html = document.querySelector('#fundingParticipantsTemplate').innerHTML;
					for(var i=0;i<data.length;i++){
						result +=	html.replace('{nick}', data[i].nick)
									.replace("{savename}", data[i].savename)
									.replace("{sumPrice}", comma(data[i].SUMPRICE));
					}
					document.querySelector('#fundingParticipants').innerHTML = result;
				}else{
					$('#fundingParticipants').append('아직 참여자가 없어요 ㅜㅜ<br>')
											.append('<strong>첫번째 주인공</strong>')
											.append('이 되세요!!!');
				}
			}
		});
	});
</script>
<script id="fundingParticipantsTemplate" type="text/template">
<div class="participants w3-border-bottom">
	<div class="w3-left-align profileDiv"><img class="profile" src={savename}></div>
	<div>{nick}님이 {sumPrice} 원 펀딩으로 참여하였습니다.</div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div id="fundingParticipants"></div>
	</div>
</div>