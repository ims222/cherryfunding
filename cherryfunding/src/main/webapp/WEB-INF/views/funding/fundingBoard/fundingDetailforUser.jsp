<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		isRecommed();
		commentList();
		updateList();
		rewardDetail();
		var errMsg = '${errMsg}';
		
		if(errMsg){
			alert(errMsg);
		}
		
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
			if(!id){
				alert('로그인 해주세욧ㅅ');
				return;
			}
			var content = $("#insertComment input[name='content']").val();
			if(!content){
				alert('댓글을 작성해욧');
				return;
			}
				
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
		
		$("#chooseItem").on('click', function(){
			var rNum = $("select[name='reward']").val();
			var amount = $("input[name='amount']").val();
			
			if(!amount){
				alert("수량을 입력하셔요");
				return;
			}
			
			$.ajax({
				url:'${pageContext.request.contextPath}/funding/getAmount',
				data:{rNum: rNum, amount: amount, fNum:'${vo.fNum}'},
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
		
		$("select[name='reward']").on('change', rewardDetail);
	});
	
	function rewardDetail(){
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/rewardDetail',
			data:{rNum: $("select[name='reward']").val()},
			dataType:'json',
			type:'post',
			success: function(data){
				var price = data.price;
				var amount = data.amount;
				$("#rewardInfo").text("가격: " + price + " 남은 수량: " + amount);
			}
		});
	}
	
	function updateList(){
		$.ajax({
			url: '${pageContext.request.contextPath}/funding/getSelectedFundingList',
			data: {fNum:'${vo.fNum}'},
			dataType: 'json',
			type: 'post',
			success: function(data){
				$("#selectedReward").empty();
				for(let i=0;i<data.length;i++){
					var rNum = data[i].rNum;
					var title = data[i].title;
					var amount = data[i].amount;
					var rNumInput = $("<input>").attr("type", "hidden")
					.attr("name", 'rNum')
					.attr('value', rNum);
					
					var amountInput = $("<input>").attr("type", 'hidden')
												.attr('name', 'amount')
												.attr('value', amount);
					var cancelReward = $("<a></a>").text('삭제')
														.attr('href', '#')
														.click(function(){
															$.ajax({
																url: '${pageContext.request.contextPath}/funding/cancelSelectReward',
																data: {i:i},
																dataType: 'json',
																type:'post',
																success: function(data){
																	updateList();
																}
															});
														});
					
					var div = $("<div></div>").append("<span>리워드명: " + title + " 수량: " + amount +"</span>")
											.append(rNumInput).append(amountInput).append(cancelReward);					
					$("#selectedReward").append(div);
				}
			}
		});
	}
	
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
				$('#fRecommend').text('추천수: ' + data.fRecommend);
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
					$(tr).append('<td>' + id + '</td>');
					$(tr).append('<td>' + content + '</td>');
					$(tr).append('<td>' + regdate + '</td>');
					$(table).append(tr);
				});
				$('#comment').append(table);
			}
		});
	}
	
	function submitReward(){
		var id = '${sessionScope.id}';
		console.log("id", id);
		if(!id){
			alert("로그인 하셔요");
			return false;
		}
		return true;
	}


</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row box">
			<div class="col-md-8"> 
			 	제목: ${vo.title}<br>
			 	내용: ${vo.content}<br>
			 	조회수: ${vo.hit}<br>
			 	<span id="fRecommend"></span>
			 	<div id="fHashtag">
			 		<c:forEach var="ht" items="${hashtag}">
			 			<a href="${pageContext.request.contextPath}/funding/searchHashtag?hashtag=${ht.hashtag}">#${ht.hashtag}</a>
			 		</c:forEach>
			 	</div>
 			</div>
 			<div class="col-md-4">
 				<select name="reward">
					<c:forEach var="reward" items="${rewardList}">
					<option value="${reward.rNum}">리워드명: ${reward.title}</option>
					</c:forEach>
				</select><br><div id="rewardInfo"></div>
				수량<input type="number" name="amount"><button id="chooseItem">선택</button>
				<form method="post" action="${pageContext.request.contextPath}/funding/insertFDetail" onsubmit="return submitReward();">
					<input type="hidden" name="fNum" value="${vo.fNum}">
					<div id="selectedReward"></div>
					<input type="submit" value="리워드 신청">
				</form><br>
				<button id="recommend" type="button">추천</button><br>
				<a href="${pageContext.request.contextPath}/funding/fundingParticipation?fNum=${vo.fNum}">펀딩 참여자</a>
 			</div>
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