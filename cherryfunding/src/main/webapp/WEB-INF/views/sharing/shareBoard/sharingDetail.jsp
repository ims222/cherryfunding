<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		isRecommed();
		commentList();
		itemDetail();
		updateList();
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
		
		$("#chooseItem").on('click', function(){
			var siNum = $("select[name='item']").val();
			var amount = $("input[name='amount']").val();
			
			if(!amount){
				alert("수량을 입력하셔요");
				return;
			}
			
			$.ajax({
				url:'${pageContext.request.contextPath}/sharing/getAmount',
				data:{siNum: siNum, amount: amount, sNum:'${vo.sNum}'},
				dataType:'json',
				type:'post',
				success: function(data){
					console.log('data', data);
					if(data.result === 'no'){
						alert("수량이 부족해요");
					}else{
						updateList();
					}
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
		$("select[name='item']").on('change', itemDetail);
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
	
	function itemDetail(){
		$.ajax({
			url:'${pageContext.request.contextPath}/sharing/itemDetail',
			data:{siNum:$("select[name='item']").val()},
			dataType:'json',
			success:function(data){
				var title = data.title;
				var amount = data.amount;
				$("#itemInfo").text("아이템명: " + title + " 남은 수량: " + amount);
			}
		});
	}
	
	function updateList(){
		$.ajax({
			url: '${pageContext.request.contextPath}/sharing/getSelectedSharingList',
			data: {sNum:'${vo.sNum}'},
			dataType: 'json',
			type: 'post',
			success: function(data){
				$("#selectedItem").empty();
				for(let i=0;i<data.length;i++){
					var sNum = data[i].sNum;
					var title = data[i].title;
					var amount = data[i].amount;
					var sNumInput = $("<input>").attr("type", "hidden")
											.attr("name", 'sNum')
											.attr('value', sNum);
					
					var amountInput = $("<input>").attr("type", 'hidden')
												.attr('name', 'amount')
												.attr('value', amount);
					var cancelItem = $("<a></a>").text('삭제')
														.attr('href', '#')
														.click(function(){
															$.ajax({
																url: '${pageContext.request.contextPath}/sharing/cancelSelectItem',
																data: {i:i},
																dataType: 'json',
																type:'post',
																success: function(data){
																	updateList();
																}
															});
														});
					
					var div = $("<div></div>").append("<span>아이템명: " + title + " 수량: " + amount +"</span>")
											.append(sNumInput).append(amountInput).append(cancelItem);					
					$("#selectedItem").append(div);
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
					<select name="item">
					<c:forEach var="item" items="${itemList}">
						<option value="${item.siNum}">물품명: ${item.title}</option>
					</c:forEach>
					</select><br><div id="itemInfo"></div>
					수량<input type="number" name="amount"><button id="chooseItem">선택</button>
					
					<form method="post" action="${pageContext.request.contextPath}/sharing/insertSItem" onsubmit="return submitItem();">
						<input type="hidden" name="sNum" value="${vo.sNum}">
						<div id="selectedItem"></div>
						<input type="submit" value="나눔 신청">
					</form><br>
					<button id="recommend" type="button">추천</button><br>
					<a href="${pageContext.request.contextPath}/sharing/sharingParticipation?sNum=${vo.sNum}">나눔 신청자</a>
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