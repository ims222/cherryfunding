<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		showMore();
		$('#showMore').on('click', showMore);
	});
	var showMore = function(){
		$('#list').append(document.querySelector('#loadingTemplate').innerHTML);
		var pageNum = $('#pageNum').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/sharing/moreSharingList',
			data : {
				pageNum : pageNum
			},
			dataType : 'json',
			type : 'post',
			success : function(data) {
				var result = $('#list').html(); 
				var html = document.querySelector('#sharingList').innerHTML;
				if(data.list === 'no'){
					alert('마지막 페이지 입니다');
				}else{
					data.list.forEach(function(value){
						result +=	html.replace(/{sNum}/gi, value.SNUM)
									.replace("{savename}", value.savename)
									.replace("{spinfo}", value.spinfo)
									.replace("{title}", value.TITLE)
									.replace("{nick}", value.nick)
									.replace("{category}", value.CATEGORY)
									.replace("{recomm}", value.recomm);
					});
					document.querySelector('#list').innerHTML = result;
					$('#pageNum').val(data.pageNum);
				}
			},
			complete :function(){
				$('.loading').remove();
			}
		});
	}
</script>
<script id="sharingList" type="text/template">
<div class="w3-col m4 l4" style="padding: 20px;">
	<a href="${pageContext.request.contextPath}/sharing/sharingDetail?sNum={sNum}">
	<img src="{savename}" class="w3-round" alt="{spinfo}" height="200px" width="100%"></a>
	<div>
		<div style="height: 50px;>
			<p class="w3-left-align" style="word-break:break-all;">
				<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum={fNum}">
				<h4>{title}</h4></a>
			</p>
		</div>
		<div>
			<div class="w3-left-align" style="float:left;">{category} | {nick}</div>
			<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
		</div>
	</div>
</div>
</script>
<script id="loadingTemplate" type="text/template">
<div class="spinner loading">
	<div class="rect1"></div>
	<div class="rect2"></div>
	<div class="rect3"></div>
	<div class="rect4"></div>
	<div class="rect5"></div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<input type="hidden" id="pageNum" value="">
		<div id="list" class="w3-row">
		</div>
		<button id="showMore" class="w3-btn w3-block w3-teal">더보기</button>
	</div>
</div>