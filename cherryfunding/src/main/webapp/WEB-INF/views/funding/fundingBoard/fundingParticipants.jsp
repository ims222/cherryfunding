<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/fundingParticipants',
			data:{fNum:'${fNum}'},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log("data", data);
				for(var i=0;i<data.length;i++){
					$('#fundingParticipants').append(data[i].nick + '님이 ' + data[i].SUMPRICE + '원 펀딩으로 참여하였습니다.<br>');	
				}
			}
		});
	});
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="box" id="fundingParticipants"></div>
	</div>
</div>