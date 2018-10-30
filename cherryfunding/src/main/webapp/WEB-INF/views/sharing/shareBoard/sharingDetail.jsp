<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//recomm();		
		$("#recommend").on('click', function(){
			var id='${sessionScope.id}';
			if(!id){
				alert("로그인 해주세욧");
				return;
			}
			recomm();
		});
		$("#insertComment").on('submit', function(e){
			e.preventDefault();
			var content = $("#insertComment input[name='content']").val();
			alert(content);
		});
	});
	function recomm(){
		
		$.ajax({
			url: '${pageContext.request.contextPath}/sharing/sharingRecommend',
			data:{id:'${sessionScope.id}', sNum: '${vo.sNum}'},
			dataType: 'json',
			success: function(data){
				if(data.result === 'recommend'){
					$("#recommend").text("추천 취소");
				}else{
					$("#recommend").text("추천");
				}
			}
		});
	}
	function commentList(){
		$.ajax({
			url: '',
			dataType: 'json',
			type: 'post',
			success: function(data){
				$("#commment").empty();
				for(var i=0; i<data.length;i++){
					console.log('data', data[i]);
				}
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
					<button id="recommend" type="button">추천</button>
				</div>
			</section>
		</div>
		<div class="row" id="commment">
			<!-- 댓글 -->
		</div>
		<form id="insertComment">
			<input type="text" name="content"><br>
			<input type="submit" value="댓글 등록">
		</form>
	</div>
</div>