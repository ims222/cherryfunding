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
				url: '${pageContext.request.contextPath}/sharing/sharingIsRecommend',
				data:{id:'${sessionScope.id}', sNum: '${vo.sNum}'},
				dataType: 'json',
				success: function(data){
					if(data.result === 'ok'){
						recomm = 'recomm';
					}else{
						recomm = 'cancel';
					}
					$.ajax({
						url:'${pageContext.request.contextPath}/sharing/sharingRecommend',
						data: {id:id, sNum: '${vo.sNum}', recomm:recomm},
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
			
			var sNum = '${vo.sNum}';
			
			$.ajax({
				url:'${pageContext.request.contextPath}/sharing/insertComment',
				dataType:'json',
				type:'post',
				data: {id:id, content:content, sNum:sNum},
				success: function(data){
					$("#insertComment input[name='content']").val('');
					commentList();
				}
			});
		});
	});
	
	function isRecommed(){
		$.ajax({
			url: '${pageContext.request.contextPath}/sharing/sharingIsRecommend',
			data:{id:'${sessionScope.id}', sNum: '${vo.sNum}'},
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
			url: '${pageContext.request.contextPath}/sharing/commentList',
			data: {sNum:'${vo.sNum}'},
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

</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<section class="6u">
				<div class="box">
				 	<p>${vo.title}</p>
				 	<p>${vo.content}</p>
				</div>
			</section>
			<section class="6u">
				<div class="box">
					<select>
					<c:forEach var="item" items="${itemList}">
						<option>물품명: ${item.title} 수량: ${item.amount}</option>
					</c:forEach>
					</select>
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
	</div>
</div>