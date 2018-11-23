<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comment.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		isRecommed();
		commentCount();
		commentList();
		var errMsg = '${errMsg}';
		
		if(errMsg){
			alert(errMsg);
		}
		
		$( "#commentModal" ).on('show', function(){
		    alert("I want this to appear after the modal has opened!");
		});
		
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
		
		$("#insertComment").on('submit', insertComment);
		
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
		
	});
	
	function isRecommed(){
		$.ajax({
			url: '${pageContext.request.contextPath}/funding/fundingIsRecommend',
			data:{id:'${sessionScope.id}', fNum:'${vo.fNum}'},
			type:'post',
			dataType: 'json',
			success: function(data){
				if(data.result === 'ok'){
					$(".button-like").removeClass("liked");
				}else{
					$(".button-like").addClass("liked");
				}
				$('#fRecommend').text(data.fRecommend);
			}
		});
	}
	
	function commentDelete(fcNum){
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/commentDelete',
			data:{fcNum:fcNum},
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
			url: '${pageContext.request.contextPath}/funding/commentList',
			data: {fNum:'${vo.fNum}'},
			dataType: 'json',
			type: 'post',
			success: function(data){
				var result = "";
				var html = document.querySelector("#commentLine").innerHTML;
				data.forEach(function(value){
					var deleteComment = "&nbsp";
					if('${sessionScope.id}' === value.ID){
						deleteComment = "<button class='deleteComment' onclick='commentDelete(" + value.FCNUM +")'>삭제</button>";
					}
					result +=	html.replace("{nick}", value.nick)
								.replace("{savename}", value.savename)
								.replace("{nick2}", value.nick)
								.replace("{savename2}", value.savename)
								.replace("{content}", value.CONTENT)
								.replace("{regdate}", calDate(value.REGDATE))
								.replace("{deleteComment}", deleteComment);
				});
				document.querySelector('#comment').innerHTML = result;
			}
		});
	}
	
	
	function submitReward(){
		var id = '${sessionScope.id}';
		if(!id){
			alert("로그인 하셔요");
			return false;
		}
		return true;
	}
	
	var commentCount = function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/commentCount',
			data:{fNum: '${vo.fNum}'},
			dataType:'json',
			type:'post',
			success: function(data){
				$('#commentCount').text(data.commentCount);
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
			url:'${pageContext.request.contextPath}/funding/insertComment',
			dataType:'json',
			type:'post',
			data: {id:id, content:content, fNum:'${vo.fNum}'},
			success: function(data){
				$("#insertComment textarea[name='content']").val('');
				commentCount();
				commentList();
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
</style>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-8 w3-border-bottom"> 
				<div class="mContent">
					<h3>${vo.category}</h3>
					<h1>${vo.title}</h1>
					<img src="${savename}" class="w3-round" alt="{fpinfo}" width="50%" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 30px;">
				</div>
				
				<div class="w3-sand" style="padding:20px;">
					목표 금액 <fmt:formatNumber value="${vo.amount}" pattern="#,###"/>원 
					펀딩기간 <fmt:formatDate value="${vo.sdate}" pattern="yyyy.MM.dd"/>-<fmt:formatDate value="${vo.edate}" pattern="yyyy.MM.dd"/>
					<br>
					100% 이상 모이면 펀딩이 성공되는 프로젝트<br>
					이 프로젝트는 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다
				</div>
				
				<div class="contentStyle">
					${vo.content}
				</div>
			
			 	<div id="fHashtag">
			 		<c:forEach var="ht" items="${hashtag}">
			 			<a href="${pageContext.request.contextPath}/funding/searchHashtag?hashtag=${ht.hashtag}">#${ht.hashtag}</a>
			 		</c:forEach>
			 	</div>
 			</div>
 			<div class="col-md-4">
 				<div style="margin-bottom:20px;">
					<fmt:formatDate value="${vo.edate}" var="eDate" pattern="yyyyMMdd"/>
					<fmt:parseDate value="${eDate}" var="eDateDate" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${eDateDate.time / (1000 * 60 * 60 * 24)}" var="end" integerOnly="true"/>
					
					<jsp:useBean id="today" class="java.util.Date"/>
					<fmt:formatDate value="${today}" var="todayDate" pattern="yyyyMMdd"/>
					<fmt:parseDate value="${todayDate}" var="nowDate" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${nowDate.time / (1000 * 60 * 60 * 24)}" var="now" integerOnly="true"/>
					
 					<span class="w3-xxlarge">${end - now}</span><span class="w3-xlarge">일 남음</span>
 				</div>
 			
 				<c:set var="before" value="${vo.camout * 100 / vo.amount}" />
 				<c:choose>
					<c:when test="${before >= 100}">
						<c:set var="barBefore" value="100"/>
					</c:when>
					<c:otherwise>
						<c:set var="barBefore" value="${before}" />
					</c:otherwise>
				</c:choose>
				
 				<div style="margin-bottom:20px;">
					<div class="w3-border">
						<div class="w3-blue" style="height:5px;width:<fmt:formatNumber value="${barBefore/100}" type="percent" pattern="0%"/>"></div>
					</div>
 				</div>
 				
 				<div style="margin-bottom:20px;">
 					<span class="w3-xxlarge"><fmt:formatNumber value="${before/100}" type="percent" pattern="0%"/></span><span class="w3-xlarge"> 달성</span>
 				</div>
 				
 				<div style="margin-bottom:20px;">
 					<span class="w3-xxlarge"><fmt:formatNumber value="${vo.camout}" pattern="#,###"/></span><span class="w3-xlarge">원 펀딩</span>
 				</div>
 				
 				<div style="margin-bottom:20px;">
 				<span class="w3-xxlarge">${countSupporter}</span><span class="w3-xlarge"> 명의 서포터</span>
 				</div>
 				
				<button class="w3-btn w3-block w3-teal w3-xxlarge" onclick="location.href='${pageContext.request.contextPath}/funding/rewardList?fNum=${vo.fNum}';">펀딩 참여</button>
				
				<div style="margin-top: 10px;">
					<button id="recommend" class="button button-like">
						<i class="fa fa-heart"></i>
						<span>Like <span id="fRecommend"></span></span>
					</button>
				</div>
				<div style="margin-top: 10px;">
					<a href="${pageContext.request.contextPath}/funding/fundingParticipation?fNum=${vo.fNum}">참여내역</a>
					<br>
					조회수: ${vo.hit}
				</div>
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
<div id="showProfile" hidden="hidden" title="회원 프로필"></div>