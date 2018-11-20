<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		
		$("#recommend").on('click', function(){
			var recomm;
			var id='${sessionScope.id}';
			if(!id){
				alert("로그인 해주세욧");
				return;
			}
			$.ajax({
				url: '${pageContext.request.contextPath}/charity/charityIsRecommend',
				data:{id:'${sessionScope.id}', cNum: '${vo.cNum}'},
				dataType: 'json',
				success: function(data){
					if(data.result === 'ok'){
						recomm = 'recomm';
					}else{
						recomm = 'cancel';
					}
					$.ajax({
						url:'${pageContext.request.contextPath}/charity/charityRecommend',
						data: {id:id, cNum: '${vo.cNum}', recomm:recomm},
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
		
	});
	
	function isRecommed(){
		$.ajax({
			url: '${pageContext.request.contextPath}/charity/charityIsRecommend',
			data:{id:'${sessionScope.id}', cNum:'${vo.cNum}'},
			type:'post',
			dataType: 'json',
			success: function(data){
				if(data.result === 'ok'){
					$(".button-like").removeClass("liked");
				}else{
					$(".button-like").addClass("liked");
				}
				$('#cRecommend').text(data.cRecommend);
			}
		});
	}
	
	function commentDelete(ccNum){
		$.ajax({
			url:'${pageContext.request.contextPath}/charity/commentDelete',
			data:{ccNum:ccNum},
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
			url: '${pageContext.request.contextPath}/charity/commentList',
			data: {cNum:'${vo.cNum}'},
			dataType: 'json',
			type: 'post',
			success: function(data){
				var result = "";
				var html = document.querySelector("#commentLine").innerHTML;
				data.forEach(function(value){
					var deleteComment = "&nbsp";
					if('${sessionScope.id}' === value.ID){
						deleteComment = "<button class='deleteComment' onclick='commentDelete(" + value.CCNUM +")'>삭제</button>";
					}
					result +=	html.replace("{nick}", value.nick)
								.replace("{savename}", value.savename)
								.replace("{content}", value.CONTENT)
								.replace("{regdate}", calDate(value.REGDATE))
								.replace("{deleteComment}", deleteComment);
				});
				document.querySelector('#comment').innerHTML = result;
			}
		});
	}
	
	var commentCount = function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/charity/commentCount',
			data:{cNum: '${vo.cNum}'},
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
			url:'${pageContext.request.contextPath}/charity/insertComment',
			dataType:'json',
			type:'post',
			data: {id:id, content:content, cNum:'${vo.cNum}'},
			success: function(data){
				$("#insertComment textarea[name='content']").val('');
				commentCount();
				commentList();
			}
		});
	}


</script>
<script id="commentLine" type="text/template">
<div class="media">
	<p class="pull-right"><small> {regdate} </small></p>
	<a class="media-left" href="#">
		<img src="{savename}" class="w3-circle" width="50px">
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
		<div class="row">
			<div class="col-md-8 w3-border-bottom"> 
				<div class="mContent">
					<h3>${vo.category}</h3>
					<h1>${vo.title}</h1>
				</div>
				
				<div class="w3-sand" style="padding:20px;">
					목표 금액 <fmt:formatNumber value="${vo.amount}" pattern="#,###"/>원 
					후원기간 <fmt:formatDate value="${vo.sDate}" pattern="yyyy.MM.dd"/>-<fmt:formatDate value="${vo.eDate}" pattern="yyyy.MM.dd"/>
					<br>
					100% 이상 모이면 후원이 성공되는 프로젝트<br>
					이 프로젝트는 후원 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다
				</div>
				
				<div class="contentStyle">
					${vo.content}
				</div>
			
			 	<div id="cHashtag">
			 		<c:forEach var="ht" items="${hashtag}">
			 			<a href="${pageContext.request.contextPath}/funding/searchHashtag?hashtag=${ht.hashtag}">#${ht.hashtag}</a>
			 		</c:forEach>
			 	</div>
 			</div>
 			<div class="col-md-4">
 				<div style="margin-bottom:20px;">
					<fmt:formatDate value="${vo.eDate}" var="eDate" pattern="yyyyMMdd"/>
					<fmt:parseDate value="${eDate}" var="eDateDate" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${eDateDate.time / (1000 * 60 * 60 * 24)}" var="end" integerOnly="true"/>
					
					<jsp:useBean id="today" class="java.util.Date"/>
					<fmt:formatDate value="${today}" var="todayDate" pattern="yyyyMMdd"/>
					<fmt:parseDate value="${todayDate}" var="nowDate" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${nowDate.time / (1000 * 60 * 60 * 24)}" var="now" integerOnly="true"/>
					
 					<span class="w3-xxlarge">${end - now}</span><span class="w3-xlarge">일 남음</span>
 				</div>
 			
 				<c:set var="before" value="${vo.cAmount * 100 / vo.amount}" />
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
 					<span class="w3-xxlarge"><fmt:formatNumber value="${vo.cAmount}" pattern="#,###"/></span><span class="w3-xlarge">원 후원</span>
 				</div>
 				
 				<div style="margin-bottom:20px;">
 				<span class="w3-xxlarge">${countSupporter}</span><span class="w3-xlarge"> 명의 서포터</span>
 				</div>
 				
				<button class="w3-btn w3-block w3-teal w3-xxlarge" onclick="location.href='${pageContext.request.contextPath}/charity/donation?cNum=${vo.cNum}';">후원 신청</button>
				
				
				<button id="recommend" class="button button-like">
					<i class="fa fa-heart"></i>
					<span>Like <span id="cRecommend">0</span></span>
				</button>
				
				
				<a href="${pageContext.request.contextPath}/funding/fundingParticipation?cNum=${vo.cNum}">참여내역</a>
				<br>
				조회수: ${vo.hit}
				
 			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="w3-right-align">
					<button type="button" class="w3-button" data-toggle="modal" data-target="#commentModal">댓글 작성</button>
					<button type="button" class="w3-button" onclick="javascript:location.href='${pageContext.request.contextPath}/charity/ingCharityList'">목록</button>
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
