<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comment.css" type="text/css">
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
					var html = document.querySelector('#nobodyParticipants').innerHTML;
					document.querySelector('#fundingParticipants').innerHTML = html;
				}
			}
		});
	});
</script>
<script id="nobodyParticipants" type="text/template">
<div class="w3-center w3-xxlarge">
	<p>아직 참여자가 없어요 ㅜㅜ<br>
	<strong>첫번째 주인공</strong>
	이 되세요!!!</p>
</div>
</script>
<script id="fundingParticipantsTemplate" type="text/template">
<div class="media">
	<p class="pull-right"><small></small></p>
	<a class="media-left" href="#">
		<img src="{savename}" class="w3-circle" width="50px">
	</a>
	<div class="media-body">
		<h4 class="media-heading user_name">&nbsp</h4>
		{nick}님이 {sumPrice}원 펀딩으로 참여하였습니다.
		<p><small><a href="">&nbsp</a>&nbsp<a href="">&nbsp</a></small></p>
	</div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>참여 내역</h1>
				</div> 
				<div id="fundingParticipants" class="comments-list"></div>
			</div>
		</div>
	</div>
</div>