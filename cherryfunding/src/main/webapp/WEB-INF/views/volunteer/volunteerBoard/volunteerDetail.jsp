<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				var table = $('<table></table>');
				$("#commment").empty().append(table);
				data.forEach(function(value){
					var id = value.id;
					var content = value.content;
					var regdate = value.regdate;
					var tr = $('<tr></tr>');
					$(tr).append('<td>' + id + '</td>')
					$(tr).append('<td>' + content + '</td>')
					$(tr).append('<td>'+ regdate +'</td>')
					$(table).append(tr);
				});
				$('#comment').append(table);
				
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
			<div class="col-md-4">
				추천 수:<div id="showRecomm"></div>
				현재 신청 인원:<div id="applicant"></div><br>
				<button id="recommend" type="button"></button>
				<button id="apply" type="button"></button>
			</div>
		</div>
		<div class="box" id="commment">댓글왜안나옴</div>
		<form id="insertComment">
			<input type="text" name="content"><br>
			<input type="submit" value="댓글 등록">
		</form>
		
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
</div>