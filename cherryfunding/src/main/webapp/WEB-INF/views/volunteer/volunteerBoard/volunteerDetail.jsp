<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comment.css" type="text/css">

<script type="text/javascript">
	$(document).ready(function(){
		isRecommend();
		getRecommend();
		isApply();
		commentList();
		applicant();
		$("#recommend").on('click', function(){
			var recomm;
			var id='${sessionScope.id}';
			if(!id){
				$("#myModal1").modal('show');
				return;
			}
			$.ajax({
				url: '${pageContext.request.contextPath}/volunteer/volunteerIsRecommend',
				data:{id:'${sessionScope.id}', vNum: '${vo.vNum}'},
				dataType: 'json',
				success: function(data){
					if(data.result === 'ok'){
						recomm = 'recomm';
					}else{
						recomm = 'cancel';
					}
					$.ajax({
						url:'${pageContext.request.contextPath}/volunteer/volunteerRecommend',
						data: {id:id, vNum: '${vo.vNum}', recomm:recomm},
						dataType: 'json',
						type:'post',
						success: function(data){
							isRecommend();
						}
					});
				}
			});
		});
		
		$("#apply").on('click', function(){
			var apply;
			var id='${sessionScope.id}';
			if(!id){
				$('#myModal1').modal('show');
				return;
			}
			$.ajax({
				url: '${pageContext.request.contextPath}/volunteer/volunteerIsApply',
				data:{id:'${sessionScope.id}', vNum: '${vo.vNum}'},
				dataType: 'json',
				success: function(data){
					if(data.result === 'ok'){
						apply = 'apply';
					}else{
						apply = 'cancel';
					}
					$.ajax({
						url:'${pageContext.request.contextPath}/volunteer/volunteerApply',
						data: {id:id, vNum: '${vo.vNum}', apply:apply},
						dataType: 'json',
						type:'post',
						success: function(data){
							if(data.result === 'insertok' || data.result === 'deleteok'){	
								isApply();
							}else if(data.result === 'no'){
								$("#myModal").modal('show');
								return;
							}else{
								alert("마감된 게시글입니다.");
							}
						}
					});	
				}
			});
		});
		
		$("#insertComment").on('submit', function(e){
			e.preventDefault();
			var id = '${sessionScope.id}';
			if(!id){
				$('#myModal1').modal('show');
				return;
			}
			var content = $("#insertComment input[name='content']").val();
			if(!content){
				alert('댓글을 작성해욧');
				return;
			}
			var vNum = '${vo.vNum}';
			
			$.ajax({
				url:'${pageContext.request.contextPath}/volunteer/insertComment',
				dataType:'json',
				type:'post',
				data: {id:id, content:content, vNum:vNum},
				success: function(data){
					$("#insertComment input[name='content']").val('');
					commentList();
				}
			});
		});
	});
	
	function isRecommend(){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerIsRecommend',
			data:{id:'${sessionScope.id}', vNum: '${vo.vNum}'},
			type:'post',
			dataType: 'json',
			success: function(data){
				if(data.result === 'ok'){
					$("#recommend").text('추천');
					getRecommend();
				}else{
					$("#recommend").text('추천취소');
					getRecommend();
				}
			}
		});
	}
	
	function getRecommend(){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerGetRecommend',
			data: {vNum: '${vo.vNum}'},
			type: 'get',
			dataType: 'text',
			success: function(data){
				$("#showRecomm").empty();
				$("#showRecomm").append(data);
			}
		})
	}
	
	function isApply(){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerIsApply',
			data:{id:'${sessionScope.id}', vNum:'${vo.vNum}'},
			type:'post',
			dataType:'json',
			success: function(data){
				if(data.result === 'ok'){
					$("#apply").text('신청');
					applicant();
				}else{
					$("#apply").text('신청취소');
					applicant();
				}
			}
		});
	}
	
	function commentList(){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/commentList',
			data: {vNum:'${vo.vNum}'},
			dataType: 'json',
			type: 'post',
			success: function(data){
				var html = '';
				data.forEach(function(value){
					var deleteComment = "&nbsp";
					if('${sessionScope.id}' === value.id){
						deleteComment = "<button class='deleteComment' onclick='commentDelete(" + value.vcNum +")'>삭제</button>";
					}
					var id = value.id;
					var content = value.content;
					var regdate = value.regdate;
					var savename = value.savename;
					var nick = value.nick;
					html += '<p class="pull-right"><small>' + regdate + '</small></p>'
							+ '<a class="media-left" href="#">' +
							+ '<img src=' + savename + ' class="w3-circle" width="50px"'
							+ 'onclick="showProfile(' + nick + ',' + savename + ')"></a>'
							+ '<div class="media-body">'
							+ '<h4 class="media-heading user_name">' + nick + '</h4>' + content
							+ '<p><small>' + deleteComment + '</small></p></div>';
					
				});
				$('#comment').empty();
				$('#comment').append(html);
				
			}
		});
	}
	
	function commentDelete(vcNum){
		$.ajax({
			url:'${pageContext.request.contextPath}/volunteer/commentDelete',
			data:{vcNum:vcNum},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data.result === 'ok'){
					//commentCount();
					commentList();
				}
			}
		});
	}
	
	function applicant(){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/applicantCount',
			data: {vNum: '${vo.vNum}'},
			dataType: 'text',
			type: 'get',
			success: function(data){
				$("#applicant").empty();
				$("#applicant").append(data);
			}
		});
	}
	$("#insertComment").on('submit', insertComment);
	function insertComment(e){
		e.preventDefault();
		var id = '${sessionScope.id}';
		if(!id){
			alert('로그인 해주세욧ㅅ');
			return;
		}
		var content = $("#insertComment textarea[name='content']").val();
		if(!content){
			alert('댓글을 작성해욧');
			return;
		}
			
		$.ajax({
			url:'${pageContext.request.contextPath}/volunteer/insertComment',
			dataType:'json',
			type:'post',
			data: {id:id, content:content, vNum:'${vo.vNum}'},
			success: function(data){
				$("#insertComment textarea[name='content']").val('');
				//commentCount();
				commentList();
			}
		});
	}
</script>
<style type="text/css">
.modal{
      position: absolute;
      top: 50%;
      z-index: 1050;
      width: auto;
      outline: none;
      }
.modal-backdrop{
  z-index: -1;
}
#featuredBox{
		background: rgba(0,0,0,.1);
		width: 304px;
		padding: 40px 40px;
}
.featuredButton{
	display: inline-block;
			padding: 1em 2em 1em 2em;
			background: #862525;
			border-radius: 5px;
			letter-spacing: 0.20em;
			text-decoration: none;
			text-transform: uppercase;
			font-weight: 400;
			font-size: 0.90em;
			color: #FFF;
}
</style>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row box">
			<div class="col-md-8">
				 <h1>${vo.title}</h1>
				 
				 
				 <div class="w3-sand" style="padding:20px;">
				 <p>날짜: ${vo.dDay }</p>
				 <p>장소: ${vo.place }</p>
				 <p>모집인원: ${vo.members }명</p>
				 </div>
				 <h4>${vo.content}</h4><br>
			</div>
			<div class="col-md-4" id="featuredBox">
				<p><span class="w3-xxlarge" id="showRecomm"></span><span class="w3-large">명이 추천</span></p>
				<p><span class="w3-xxlarge" id="applicant"></span><span class="w3-large">명이 신청</span></p>
				<div style="margin-top:10px;">
					<button id="recommend" type="button" class="featuredButton"></button>
					<button id="apply" type="button" class="featuredButton"></button>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-8">
				<div class="w3-right-align">
					<button type="button" class="w3-button" data-toggle="modal" data-target="#commentModal">댓글 작성</button>
					<button type="button" class="w3-button" onclick="javascript:location.href='${pageContext.request.contextPath}/volunteer/volunteerList'">목록</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="page-header">
					<h1>댓글 <span id="commentCount"></span></h1>
				</div>
				<div class="media"> 
					<div id="comment" class="comments-list"></div>
				</div>
			</div>
		</div>		
	</div>
	
	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>죄송합니다.</p>
                    <p>신청 마감되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>  
    <div id="myModal1" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>로그인 해주세요.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="commentModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 작성</h4>
			</div>
			<div class="modal-body" style="overflow:hidden;">
				<form id="insertComment">
					<textarea name="content" rows="10" style="width:100%"></textarea><br>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
				data-dismiss="modal" onclick="insertComment(event)">저장</button>
			</div>
		</div>
	</div>
</div>  
</div>