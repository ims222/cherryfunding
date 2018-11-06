<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		isRecommend();
		isApply();
		commentList();
		applicant();
		$("#recommend").on('click', function(){
			var recomm;
			var id='${sessionScope.id}';
			if(!id){
				alert("로그인 해주세욧");
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
				alert("로그인 해주세욧");
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
							}else{
								alert("모집인원수 초과로 신청이 불가합니다.");
								return;
							}
						}
					});
				}
			});
		});
			

		
		$("#insertComment").on('submit', function(e){
			e.preventDefault();
			var id = '${sessionScope.id}';
			if(!id)
				alert('로그인 해주세욧ㅅ');
			var content = $("#insertComment input[name='content']").val();
			if(!content)
				alert('댓글을 작성해욧');
			
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
				}else{
					$("#recommend").text('추천취소');
				}
			}
		});
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
				}else{
					$("#apply").text('신청취소');
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
				$("#applicant").append(data);
			}
		});
	}

</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<section class="12u">
				<div class="box">
				 	<p>제목: ${vo.title}</p>
				 	<p>내용: ${vo.content}</p>
				 	<p>날짜: ${vo.dDay }</p>
				 	<p>장소: ${vo.place }</p>
				 	<p>모집인원: ${vo.members }</p>
				 	<div id="applicant">현재 신청 인원:</div><br>
				 	<button id="recommend" type="button"></button>
				 	<button id="apply" type="button"></button>
				</div>
				
			</section>
			
		</div>
		<div class="row box" id="commment"></div>
		<form id="insertComment">
			<input type="text" name="content"><br>
			<input type="submit" value="댓글 등록">
		</form>
	</div>
</div>