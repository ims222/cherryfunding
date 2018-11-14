<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	var array = [];
	$(document).ready(function(){
		$("#category").on('click', 'button', function(e){
			var value = $(this).text();
			location.href= "${pageContext.request.contextPath}/charity/ingCharityList?category=" + value;
		});
		$("#sort").on('change', function(){
			var value = $(this).val();
			location.href= "${pageContext.request.contextPath}/charity/ingCharityList?sort=" + value;
		});
		$("#keyword").on('keyup', related);
		$("#keyword").autocomplete({source: array});
		
		showMore();
		$('#showMore').on('click', showMore);
	});
	
	var showMore = function(){
		var pageNum = $('#pageNum').val();
		var category = $('#category').val();
		var sort = $('#sort').val();
		var keyword = $('#keyword').val();
		var field = $('#field').val();
			$.ajax({
			url:'${pageContext.request.contextPath}/charity/moreIngCharityList',
			data:{pageNum:pageNum, category:category, sort:sort, keyword:keyword, field:field},
			dataType:'json',
			type:'post',
			success:function(data){
				var result = $('#list').html(); 
				var html = document.querySelector('#charityList').innerHTML;
				if(data.list === 'no'){
					alert('마지막 페이지 입니다');
				}else{
					data.list.forEach(function(value){
						var camount = parseInt(value.CAMOUNT);
						var amount = parseInt(value.AMOUNT);
						var before = Math.ceil((camount * 100) / amount);
						if(isNaN(before))
							before = 0;
						var barBefore = 0;
						if(before >= 100)
							barBefore = 100;
						else
							barBefore = before;
						
						result +=	html.replace(/{cNum}/gi, value.CNUM)
									.replace("{savename}", value.savename)
									.replace("{cpinfo}", value.cpinfo)
									.replace("{title}", value.TITLE)
									.replace("{nick}", value.nick)
									.replace("{camount}", comma(camount))
									.replace("{category}", value.CATEGORY)
									.replace("{recomm}", value.recomm)
									.replace("{dday}", value.DDAY)
									.replace(/{width}/gi, (barBefore) + "%" )
									.replace("{valuenow}", barBefore)
									.replace(/{percent}/gi, ((before/100) * 100) + "%"); 
					});
					document.querySelector('#list').innerHTML = result;
					$('#pageNum').val(data.pageNum);
					$('#category').val(data.category);
					$("#field option").filter(function() {
					    return $(this).text() == data.field; 
					}).prop('selected', true);
					$('#keyword').val(data.keyword);
				}
			}
		});	
	}
	
	function related(){
		var keyword = $("#keyword").val();
		var field = $("#field option:selected").text();
		$.ajax({
			url:'${pageContext.request.contextPath}/charity/relatedWords',
			data: {keyword: keyword, field: field},
			dataType: 'json',
			type:'get',
			success: function(data){
				for(var i=0; i<data.length; i++){
					array[i]=data[i];
				}
			}
		});
	}
</script>
<script id="charityList" type="text/template">
<div class="w3-col m4 l4" style="padding: 20px;">
	<a href="${pageContext.request.contextPath}/charityList/detail?num=${vo.cNum}">
	<img src="{savename}" class="w3-round" alt="{cpinfo}" height="200px" width="100%"></a>
	<div>
		<div style="height: 50px;>
			<p class="w3-left-align" style="word-break:break-all;">
				<a href="${pageContext.request.contextPath}/charityList/detail?num=${vo.cNum}">
				<h4>{title}</h4></a>
			</p>
		</div>
		<div>
			<div class="w3-left-align" style="float:left;">{category} | {nick}</div>
			<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
			<div class="w3-border">
				<div class="w3-blue" style="height:5px;width:{width}"></div>
			</div>
			<div class="w3-left-align" style="float:left;">{percent} · {camount}원</div>
			<div class="w3-right-align">{dday}일 남음</div>
		</div>
	</div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="btn-group" role="group" aria-label="category" id="category">
			<button type="button" class="btn btn-secondary">전체보기</button>
			<button type="button" class="btn btn-secondary">아동·청소년</button>
			<button type="button" class="btn btn-secondary">어르신</button>
			<button type="button" class="btn btn-secondary">다문화</button>
			<button type="button" class="btn btn-secondary">장애인</button>
			<button type="button" class="btn btn-secondary">사회운동</button>
			<button type="button" class="btn btn-secondary">동물</button>
			<button type="button" class="btn btn-secondary">환경</button>
		</div>
		<form method="get" action="${pageContext.request.contextPath}/charity/ingCharityList">
			<input type="hidden" name="category" value="${category}">
			<select name="field">
				<option value="title" <c:if test="${field eq 'title'}">selected="selected"</c:if>>제목</option>
				<option value="content" <c:if test="${field eq 'content'}">selected="selected"</c:if>>내용</option>
				<option value="id" <c:if test="${field eq 'id'}">selected="selected"</c:if>>글쓴이</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${keyword}">
			<input type="submit" value="검색">		
		</form>
		<select id="sort">
			<option value="latest">최신순</option>
			<option value="recommend">추천순</option>
			<option value="popular">인기순</option>
			<option value="camount">참여금액순</option>
			<option value="end">종료임박순</option>
		</select>
		<input type="hidden" id="pageNum" value="">
		<div id="list" class="w3-row">
		</div>
		<button id="showMore" class="w3-btn w3-block w3-teal">더보기</button>
	</div>
</div>