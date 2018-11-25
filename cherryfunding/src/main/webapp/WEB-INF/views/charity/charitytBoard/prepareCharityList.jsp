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
			location.href= "${pageContext.request.contextPath}/charity/prepareCharityList?category=" + value;
		});
		$("#sort").on('change', function(){
			var value = $(this).val();
			location.href= "${pageContext.request.contextPath}/charity/prepareCharityList?sort=" + value;
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
			url:'${pageContext.request.contextPath}/charity/morePrepareCharityList',
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
						console.log('value', value);
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
	<a href="${pageContext.request.contextPath}/Charity/prepareCharityDetailforUser?cNum={cNum}">
	<img src="{savename}" class="w3-round" alt="{cpinfo}" height="200px" width="100%"></a>
	<div>
		<div style="height: 50px;>
			<p class="w3-left-align" style="word-break:break-all;">
				<a href="${pageContext.request.contextPath}/Charity/prepareCharityDetailforUser?cNum={cNum}">
				<h4>{title}</h4></a>
			</p>
		</div>
		<div>
			<div class="w3-left-align" style="float:left;">{category} | {nick}</div>
			<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
			<div class="w3-border">
				<div class="processBar" style="height:5px;width:{width}"></div>
			</div>
			<div class="w3-left-align" style="float:left;">{percent} · {camount}원</div>
			<div class="w3-right-align">{dday}일 후 시작</div>
		</div>
	</div>
</div>
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="w3-center">
			<div class="w3-bar" id="category">
				<button data-voice="전체보기" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">전체보기</button>
				<button data-voice="아동·청소년" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">아동·청소년</button>
				<button data-voice="어르신" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">어르신</button>
				<button data-voice="다문화" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">다문화</button>
				<button data-voice="장애인" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">장애인</button>
				<button data-voice="사회운동" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">사회운동</button>
				<button data-voice="동물" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">동물</button>
				<button data-voice="환경" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">환경</button>
			</div>
		</div>
		<div class="topnav">
			<span>준비중 후원</span>
			<select id="sort" class="dropbtn w3-button">
				<option value="latest" <c:if test="${sort eq 'latest'}">selected="selected"</c:if>>최신순</option>
				<option value="recommend" <c:if test="${sort eq 'recommend'}">selected="selected"</c:if>>추천순</option>
				<option value="popular" <c:if test="${sort eq 'popular'}">selected="selected"</c:if>>인기순</option>
				<option value="camount" <c:if test="${sort eq 'camount'}">selected="selected"</c:if>>참여금액순</option>
				<option value="end" <c:if test="${sort eq 'end'}">selected="selected"</c:if>>종료임박순</option>
			</select>
 			<div class="search-container">
					<input type="text" id="keyword" placeholder="Search.." name="search">
					<button id="search" type="submit">검색</button>
			</div>
		</div>
		<input type="hidden" id="pageNum" value="">
		<div id="list" class="w3-row">
		</div>
		<button id="showMore" class="w3-btn w3-block w3-teal">더보기</button>
	</div>
</div>