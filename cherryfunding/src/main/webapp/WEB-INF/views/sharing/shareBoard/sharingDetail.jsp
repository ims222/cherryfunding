<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		isRecommed();
		commentCount();
		commentList();
		itemDetail();
		updateList();
		//$('#profileModal').modal('hide');
		
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
			data:{id:'${sessionScope.id}', sNum:'${vo.sNum}'},
			type:'post',
			dataType: 'json',
			success: function(data){
				if(data.result === 'ok'){
					$(".button-like").removeClass("liked");
				}else{
					$(".button-like").addClass("liked");
				}
				$('#sRecommend').text(data.sRecommend);
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
				$("#itemInfo").text("물품명: " + title + " 남은 수량: " + amount);
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
					
					var div = $("<div></div>").append("<span>물품명: " + title + " 수량: " + amount +"</span>")
											.append(sNumInput).append(amountInput).append(cancelItem);
					$("#selectedItem").append(div);
				}
			}
		});
	}
	
	function commentDelete(scNum){
		$.ajax({
			url:'${pageContext.request.contextPath}/sharing/commentDelete',
			data:{scNum:scNum},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data.result === 'ok'){
					commentCount();
					commentList();
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
				var result = "";
				var html = document.querySelector("#commentLine").innerHTML;
				data.forEach(function(value){
					var deleteComment = "&nbsp";
					if('${sessionScope.id}' === value.ID){
						deleteComment = "<button class='deleteComment' onclick='commentDelete(" + value.SCNUM +")'>삭제</button>";
					}
					result +=	html.replace("{nick}", value.nick)
								.replace("{nick2}", value.nick)
								.replace("{savename}", value.savename)
								.replace("{savename2}", value.savename)
								.replace("{content}", value.CONTENT)
								.replace("{regdate}", calDate(value.REGDATE))
								.replace("{deleteComment}", deleteComment);
				});
				document.querySelector('#comment').innerHTML = result;
			}
		});
	}
	
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
			url:'${pageContext.request.contextPath}/sharing/insertComment',
			dataType:'json',
			type:'post',
			data: {id:id, content:content, sNum:'${vo.sNum}'},
			success: function(data){
				$("#insertComment textarea[name='content']").val('');
				commentCount();
				commentList();
			}
		});
	}
	
	var commentCount = function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/sharing/commentCount',
			data:{sNum: '${vo.sNum}'},
			dataType:'json',
			type:'post',
			success: function(data){
				$('#commentCount').text(data.commentCount);
			}
		});
	}
 
	function showProfile(nick, savename){
		$.ajax({
			url: '${pageContext.request.contextPath}/sharing/getUserInfoByNick',
			data: {nick: nick},
			dataType: 'json',
			type: 'get',
			success: function(data){
				$('#showProfile').empty();
				$('#showProfile').append('<img src="'+ savename + '" class="w3-circle" width="120px" height="120px">');
				$('#showProfile').append('<p>'+'아이디:' + data.id + '<p>' 
						+'<p>'+' 닉네임: ' + data.nick + '</p>'
						+'<p>'+' 성별: ' + data.gender+'</p>'
						);
				$('#showProfile').dialog({width: 200, height:270, hide: "fade", close : function(){
					parent.$('#showProfile').dialog('destroy');
	              }  
				});		
			}
		});
	}
	
</script>
<style>
	.ui-widget {
        font-family: Verdana,Arial,sans-serif;
        font-size: 1em;
        font-weight: bold;
        left: 100px;
        top: 200px;
        }
	.ui-widget-header,.ui-state-default, ui-button {
		background:#b9cd6d;
        border: 1px solid #b9cd6d;
        color: #FFFFFF;
        font-weight: bold;
        }
#featuredBox{
		background: rgba(0,0,0,.1);
		font-size: 1.1em;
		font-weight: normal;
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
<script id="commentLine" type="text/template">
<div class="media">
	<p class="pull-right"><small> {regdate} </small></p>
	<a class="media-left" href="#">
		<img src="{savename}" class="w3-circle" width="50px" onclick="showProfile('{nick2}','{savename2}')">
	</a>
	<div class="media-body">
		<h4 class="media-heading user_name">{nick}</h4>
		{content}
		<p><small>{deleteComment}</small></p>
	</div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row box">
			<div class="col-md-8">
				<p>제목: ${vo.title}</p>
				<p>내용: ${vo.content}</p>
				<p>조회수: </p>
				<span id="fRecommend"></span>
			</div>
			<div class="col-md-4 form-group" id="featuredBox">
				<select name="item" class="form-control">
					<c:forEach var="item" items="${itemList}">
						<option value="${item.siNum}">물품명: ${item.title}</option>
					</c:forEach>
				</select><br><div id="itemInfo"></div>
				<div style="margin-top:15px;">
					수량<input type="number" name="amount" class="form-control"><button id="chooseItem" class="featuredButton">추가</button>
				</div>
				<div style="margin-top:20px;">	
				<form method="post" action="${pageContext.request.contextPath}/sharing/insertSItem" onsubmit="return submitItem();">
					<input type="hidden" name="sNum" value="${vo.sNum}">
						<div id="selectedItem"></div>
					<input type='submit' class='featuredButton' value='나눔 신청'>
				</form><br>
				</div>
				<button id="recommend" class="button button-like" >
					<i class="fa fa-heart"></i>
					<span>Like <span id="sRecommend"></span></span>
				</button>
				<!-- 아래거 회원 마이페이지로 옮겨야함 -->
				<!-- <a href="${pageContext.request.contextPath}/sharing/sharingParticipation?sNum=${vo.sNum}">나눔 신청자</a> -->
				
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="w3-right-align">
					<button type="button" class="w3-button" data-toggle="modal" data-target="#commentModal">댓글 작성</button>
					<button type="button" class="w3-button" onclick="javascript:location.href='${pageContext.request.contextPath}/funding/ingFundingList'">목록</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="page-header">
					<h1>댓글 <span id="commentCount"></span></h1>
				</div> 
				<div id="comment" class="comments-list"></div>
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
<div>
<div id="showProfile" hidden="hidden" title="회원 프로필"></div>
</div>

