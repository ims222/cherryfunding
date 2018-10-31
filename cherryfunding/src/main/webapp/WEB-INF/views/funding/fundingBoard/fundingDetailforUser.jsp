<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		isRecommed();
		commentList();
		$("#recommend").on('click', function(){
			var recomm;
			var id='${sessionScope.id}';
			if(!id){
				alert("로그인 해주세욧");
				return;
			}
			$.ajax({
				url: '${pageContext.request.contextPath}/funding/fundingIsRecommend',
				data:{id:'${sessionScope.id}', fNum: '${vo.fNum}'},
				dataType: 'json',
				success: function(data){
					if(data.result === 'ok'){
						recomm = 'recomm';
					}else{
						recomm = 'cancel';
					}
					$.ajax({
						url:'${pageContext.request.contextPath}/funding/fundingRecommend',
						data: {id:id, fNum: '${vo.fNum}', recomm:recomm},
						dataType: 'json',
						type:'post',
						success: function(data){
							isRecommed();
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
			
			$.ajax({
				url:'${pageContext.request.contextPath}/funding/insertComment',
				dataType:'json',
				type:'post',
				data: {id:id, content:content, fNum:'${vo.fNum}'},
				success: function(data){
					$("#insertComment input[name='content']").val('');
					commentList();
				}
			});
		});
		
	});
	
	function isRecommed(){
		$.ajax({
			url: '${pageContext.request.contextPath}/funding/fundingIsRecommend',
			data:{id:'${sessionScope.id}', fNum:'${vo.fNum}'},
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
	function commentList(){
		$.ajax({
			url: '${pageContext.request.contextPath}/funding/commentList',
			data: {fNum:'${vo.fNum}'},
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
					$(tr).append('<td>'+ formatDate(regdate) +'</td>')
					$(table).prepend(tr);
				});
				$('#comment').append(table);
				
			}
		});
	}
	function formatDate(date) {
		var d = new Date(date);
		var month = (d.getMonth() + 1) + '';
		var day = d.getDate() + '';
		var year = d.getFullYear();
		
		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;
			return [year, month, day].join('-');
	} 


</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<section class="6u">
				<div class="box">
				 	<p>제목: ${vo.title}</p>
				 	<p>내용: ${vo.content}</p>
				 	<p>조회수: ${vo.hit}</p>
				</div>
			</section>
			<section class="6u">
				<div class="box">
					<form method="post" action="${pageContext.request.contextPath}/funding">
						<select name="reward">
						<c:forEach var="reward" items="${rewardList}">
							<option value="${reward.title}">리워드명: ${reward.title} 수량: ${reward.amount}</option>
						</c:forEach>
						</select><br>
						수량<input type="number" name="amount">
						<input type="submit" value="리워드 신청">
					</form>
					<br>
					<button id="recommend" type="button"></button>
				</div>
			</section>
		</div>
		<div class="row box" id="commment">
			<!-- 댓글 -->
		</div>
		<form id="insertComment">
			<input type="text" name="content"><br>
			<input type="submit" value="댓글 등록">
		</form>
		<input type="button" value="목록" onclick="javascript:location.href='${pageContext.request.contextPath}/funding/ingFundingList'">
	</div>
</div>