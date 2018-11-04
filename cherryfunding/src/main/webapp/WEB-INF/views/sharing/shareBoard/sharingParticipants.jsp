<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url:'${pageContext.request.contextPath}/sharing/sharingParticipants',
			data:{sNum:'${sNum}'},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data.length > 0){
					for(var i=0;i<data.length;i++){
						console.log(data[i]);
						var a = $('<a></a>').attr('href', '#').text('수락');
						$('#sharingParticipants').append('신청번호: ' + data[i].SLNUM + ' ')
												.append('아이템번호: ' + data[i].SINUM + ' ')
												.append('아이디: ' + data[i].ID + ' ')
												.append('닉네임: ' + data[i].nick + ' ')
												.append('아이템명: ' + data[i].TITLE + ' ')
												.append('수량: ' + data[i].AMOUNT + ' ')
												.append(a)
											.append('<br>');
						
						
						
					}
				}else{
					$('#sharingParticipants').append('아직 참여자가 없어요 ㅜㅜ<br>')
											.append('<strong>첫번째 주인공</strong>')
											.append('이 되세요!!!');
				}
			}
		});
	});
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="box" id="sharingParticipants"></div>
	</div>
</div>