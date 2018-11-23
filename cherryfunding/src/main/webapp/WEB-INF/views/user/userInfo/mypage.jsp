<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/resources/css/fine-uploader/fine-uploader-new.min.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/fine-uploader/fine-uploader.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<style type="text/css">
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function prom(e){
		e.preventDefault();
		var id = '${sessionScope.id}';
		var deposit = prompt("충전할 금액", 0);
		$.ajax({
			url:'${pageContext.request.contextPath}/users/usersDeposit',
			data:{id:id, deposit:deposit},
			dataType:'json',
			type:'post',
			success:function(data){
				$('#balance').empty();
				$("#balance").append("내 잔고 : " +  comma(data.deposit) + " 원 <a href='#' onclick='prom(event)'>충전</a>");
			}
		});
	}
	
	$(document).ready(function(){
		getProfileImg();
		
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('')
		});

		$("#message").keydown(function(key) {
			if (key.keyCode == 13) {// 엔터
				sendMessage();
				$('#message').val('')
			}
		});
	});
	
	
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

     // 메시지 전송

	function sendMessage() {
		message = {};
		message.id = '${vo.id}';
		message.msg = $("#message").val();
		sock.send(JSON.stringify(message));
	}

     // 서버로부터 메시지를 받았을 때

	function onMessage(msg) {
		var data = msg.data;
		$("#data").append(data + "<br/>");
	}

     // 서버와 연결을 끊었을 때

	function onClose(evt) {
		$("#data").append("연결 끊김");
	}



	
	
	function getProfileImg(){
		$.ajax({
			url:'${pageContext.request.contextPath}/users/getProfileImg',
			type:'post',
			dataType:'json',
			success: function(data){
				$('#profileImg').attr("src", data.savename);
			},
			statusCode: {
				404: function() {
					alert('404404');
		        	$('#profileImg').attr("src", "https://s3.ap-northeast-2.amazonaws.com/cherryfundingbucket/profile/default");
				}
		    }
		});
	}
</script>
<script type="text/template" id="qq-template-gallery">
     <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="사진을 드래그해주세요">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="buttons">
                <div class="qq-upload-button-selector qq-upload-button">
                    <div>사진 선택</div>
                </div>
            </div>
            <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>
        </div>
</script>
<div class="container">
	<table class="type04">
		<tr>
			<td>	
				<img id="profileImg" class="w3-circle" src="" width="111px" height="111px">
				<p style="font-size: 20px;font-weight: bold">&nbsp;&nbsp;${sessionScope.id}님</p>
				<button type="button" class="rBtn" data-toggle="modal" data-target="#profileModal">프로필 변경</button>
			</td>
			<td>	
				<p id="balance">내 잔고 : <fmt:formatNumber value="${balance}" pattern="#,###.##"/> 원 <a href="#" onclick="prom(event)">충전</a></p>
				<p>총 후원금액 : <fmt:formatNumber value="${charitySum}" pattern="#,###"/> 원</p>
				<p>총 펀딩금액 : <fmt:formatNumber value="${fundingSum}" pattern="#,###"/> 원</p>
			</td>
			<td>
				<p><a href="${pageContext.request.contextPath}/users/getInfo">회원정보수정</a></p>
				<p><a href="${pageContext.request.contextPath}/userSetting">환경설정</a></p>
			</td>
		</tr>
	</table>
	<p> 후원 목록 </p>
	<table class="type04">
		<tr>
			<td>제목</td>
			<td>카테고리</td>
			<td>금액</td>
			<td>후원날짜</td>
		</tr>
		<c:forEach var="vo" items="${charityList}">
			<tr>
				<td>${vo.title}</td>
				<td>${vo.category}</td>	
				<td><fmt:formatNumber value="${vo.amount }" pattern="#,###.##"/> 원</td>
				<td>${vo.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<p> 펀딩 목록 </p>
		<table class="type04">
			<tr>
				<td>제목</td>
				<td>카테고리</td>
				<td>금액</td>
				<td>펀딩날짜</td>
			</tr>
			<c:forEach var="vo" items="${fundingList}">
				<tr>
					<td>${vo.title}</td>
					<td>${vo.category}</td>	
					<td><fmt:formatNumber value="${vo.price }" pattern="#,###.##"/> 원</td>
					<td>${vo.regdate}</td>
				</tr>
			</c:forEach>
	</table>
</div>

<input type="text" id="message" />
<input type="button" id="sendBtn" value="전송" />

<div id="data"></div>

<!-- modal -->
<div class="modal fade" id="profileModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">프로필 사진 변경</h4>
			</div>
			<div class="modal-body">
				<div id="fine-uploader-gallery"></div>
			</div>
			<div class="modal-footer">
				<button type="button" id="saveProfile" class="btn btn-default" data-dismiss="modal">저장</button>
			</div>
		</div>
	</div>
</div>


	<script type="text/javascript">
		var galleryUploader = new qq.FineUploader(
				{
					autoUpload : false,
					element : document.getElementById("fine-uploader-gallery"),
					template : 'qq-template-gallery',
					request : {
						endpoint : '${pageContext.request.contextPath}/users/imgUpload'
					},
					thumbnails : {
						placeholders : {
							waitingPath : '${pageContext.request.contextPath}/resources/css/fine-uploader/placeholders/waiting-generic.png',
							notAvailablePath : '${pageContext.request.contextPath}/resources/css/fine-uploader/placeholders/not_available-generic.png'
						}
					},
					validation : {
						allowedExtensions : [ 'jpeg', 'jpg', 'gif', 'png' ]
					},
					callbacks : {
						onComplete : function(thumbnailUrl) {
							$('#profileImg').attr("src", $('.qq-thumbnail-selector').attr('src'));
							$('.qq-upload-success').remove();
							//$('#fine-uploader-gallery').remove();
						}
					}
				});
		qq(document.getElementById("saveProfile")).attach("click", function() {
			galleryUploader.uploadStoredFiles();
        });
	</script>



