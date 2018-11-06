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
						var a = $('<a></a>').attr('href', '${pageContext.request.contextPath}/shring/sharingConfirm?slNum=' + data[i].SLNUM).text('수락');
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
					$('#sharingParticipants').append('어서 나눠 가세요~<br>');
				}
			}
		});
		$.ajax({
			url: '${pageContext.request.contextPath}/sharing/sharingConfirmList',
			data: {sNum: '${sNum}'},
			dataType: 'json',
			type:'post',
			success: function(data){
				if(data.length > 0){
					for(var i=0;i<data.length;i++){
						$('#sharingConfirmList').append('신청번호: ' + data[i].SLNUM + ' ')
						.append('아이템번호: ' + data[i].SINUM + ' ')
						.append('아이디: ' + data[i].ID + ' ')
						.append('닉네임: ' + data[i].nick + ' ')
						.append('아이템명: ' + data[i].TITLE + ' ')
						.append('수량: ' + data[i].AMOUNT + ' ')
					.append('<br>');
					}
				}
			}
		});
	});
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		미승인 목록<br>
		<div class="box" id="sharingParticipants"></div>
		승인 목록<br>
		<div class="box" id="sharingConfirmList"></div>
	</div>
</div>