<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(document).ready(function(){
		showMore();
		//$("#category").on('click', 'button', selectCategory);
		//$("#sort").on('change', selectionOption);
		//$("#keyword").on('keyup', related);
		$("#showMore").on('click', showMore);
		//$("#keyword").autocomplete({source: array});
		
		$('#search').on('click', function(){
			$("#list").empty();
			$('#pageNum').val(1);
			showMore();
		});
	});
	var showMore = function(){
		$('#list').append(document.querySelector('#loadingTemplate').innerHTML);
		var pageNum = $('#pageNum').val();
		var category = $('#category').val();
		var sort = $('#sort').val();
		var keyword = $('#keyword').val();
		var field = $('#field').val();
			$.ajax({
			url:'${pageContext.request.contextPath}/funding/moreEndFundingList',
			data:{pageNum:pageNum, category:category, sort:sort, keyword:keyword, field:field},
			dataType:'json',
			type:'post',
			success:function(data){
				var result = $('#list').html(); 
				var html = document.querySelector('#fundingList').innerHTML;
				if(data.list === 'no'){
					alert('마지막 페이지 입니다');
				}else{
					data.list.forEach(function(value){
						var camout = parseInt(value.CAMOUT);
						var amount = parseInt(value.AMOUNT);
						var before = Math.ceil((camout * 100) / amount);
						if(isNaN(before))
							before = 0;
						var barBefore = 0;
						if(before >= 100)
							barBefore = 100;
						else
							barBefore = before;
						
						var success = "";
						if(camout >= amount)
							success = "성공";
						else
							success = "실패";
						result +=	html.replace(/{fNum}/gi, value.FNUM)
									.replace("{savename}", value.savename)
									.replace("{fpinfo}", value.fpinfo)
									.replace("{title}", value.TITLE)
									.replace("{nick}", value.nick)
									.replace("{camout}", comma(camout))
									.replace("{category}", value.CATEGORY)
									.replace("{recomm}", value.recomm)
									.replace(/{width}/gi, barBefore + "%" )
									.replace("{valuenow}", barBefore)
									.replace(/{percent}/gi, Math.ceil((before/100) * 100) + "%")
									.replace("{isSuccess}", success);
						
						
					});
					document.querySelector('#list').innerHTML = result;
					$('#pageNum').val(data.pageNum);
					$('#category').val(data.category);
					$("#field option").filter(function() {
					    return $(this).text() == data.field; 
					}).prop('selected', true);
					$('#keyword').val(data.keyword);
					
				}
			},
			complete :function(){
				$('.loading').remove();
			}
		});	
	}
</script>
<script id="fundingList" type="text/template">
<div class="w3-col m4 l4 " style="padding: 20px;">
	<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum={fNum}">
	<img src="{savename}" class="w3-round" alt="{fpinfo}" height="200px" width="100%"></a>
	<div>
		<div style="height: 50px; overflow:hidden;>
			<p class="w3-left-align" style="word-break:break-all;">
				<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum={fNum}">
				<h4>{title}</h4></a>
			</p>
		</div>
		<div>
			<div class="w3-left-align" style="float:left;">{category} | {nick}</div>
			<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
			<div class="w3-border">
				<div class="w3-blue" style="height:5px;width:{width}"></div>
			</div>
			<div class="w3-left-align" style="float:left;">{percent} · {camout}원</div>
			<div class="w3-right-align">종료 · {isSuccess}</div>
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
		<div class="btn-group" role="group" aria-label="category" id="category">
			<button type="button" class="btn btn-secondary">전체보기</button>
			<button type="button" class="btn btn-secondary">테크·가전</button>
			<button type="button" class="btn btn-secondary">패션·잡화</button>
			<button type="button" class="btn btn-secondary">푸드</button>
			<button type="button" class="btn btn-secondary">홈리빙</button>
			<button type="button" class="btn btn-secondary">디자인소품</button>
			<button type="button" class="btn btn-secondary">여행·레저</button>
			<button type="button" class="btn btn-secondary">스포츠·모빌리티</button>
			<button type="button" class="btn btn-secondary">반려동물</button>
			<button type="button" class="btn btn-secondary">공연·컬쳐</button>
			<button type="button" class="btn btn-secondary">소셜·캠페인</button>
			<button type="button" class="btn btn-secondary">교육·키즈</button>
			<button type="button" class="btn btn-secondary">게임·취미</button>
			<button type="button" class="btn btn-secondary">출판</button>
		</div>
		<form method="get" action="${pageContext.request.contextPath}/funding/endFundingList">
			<input type="hidden" name="category" value="${category}">
			<select name="field">
				<option value="title" <c:if test="${field eq 'title'}">selected="selected"</c:if>>제목</option>
				<option value="content" <c:if test="${field eq 'content'}">selected="selected"</c:if>>내용</option>
				<option value="id" <c:if test="${field eq 'id'}">selected="selected"</c:if>>글쓴이</option>
			</select>
			<input type="text" name="keyword" value="${keyword}">
			<input type="submit" value="검색">		
		</form>
		
		
		<input type="hidden" id="pageNum" value="">
		
		<div id="list" class="w3-row">
		</div>
		<button id="showMore" class="w3-btn w3-block w3-teal">더보기</button>
		
		
	</div>
</div>