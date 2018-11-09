<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	
	var array = [];
  
	$(document).ready(function(){
		showMore();
		$("#category").on('click', 'button', selectCategory);
		$("#sort").on('change', selectionOption);
		$("#keyword").on('keyup', related);
		$("#showMore").on('click', showMore);
		$("#keyword").autocomplete({source: array});
		
		$('#search').on('click', function(){
			$("#list").empty();
			$('#pageNum').val(1);
			showMore();
		});
	});
	var showMore = function(){
		var pageNum = $('#pageNum').val();
		var category = $('#category').val();
		var sort = $('#sort').val();
		var keyword = $('#keyword').val();
		var field = $('#field').val();
			$.ajax({
			url:'${pageContext.request.contextPath}/funding/moreIngFundingList',
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
						
						result +=	html.replace(/{fNum}/gi, value.FNUM)
									.replace("{savename}", value.savename)
									.replace("{fpinfo}", value.fpinfo)
									.replace("{title}", value.TITLE)
									.replace("{nick}", value.nick)
									.replace("{amount}", amount)
									.replace("{camout}", camout)
									.replace("{category}", value.CATEGORY)
									.replace("{sdate}", value.SDATE)
									.replace("{edate}", value.EDATE)
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
	
	function selectCategory(){
		$("#list").empty();
		$('#pageNum').val(1);
		$('#keyword').val('');
		$('#category').val($(this).text());
		showMore();
	}
	function selectionOption(){
		$("#list").empty();
		$('#pageNum').val(1);
		//var sort = $(this).val();
		showMore();
		//location.href= "${pageContext.request.contextPath}/funding/moreIngFundingList?sort=" + sort + "&category=" + category;
	}
	function related(){
		var keyword = $("#keyword").val();
		var field = $("#field option:selected").text();
		
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/relatedWords',
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
	function openCity(cityName) {
	    var i;
	    var x = document.getElementsByClassName("city");
	    for (i = 0; i < x.length; i++) {
	        x[i].style.display = "none"; 
	    }
	    document.getElementById(cityName).style.display = "block"; 
	}
</script>
<script id="fundingList" type="text/template">
<div class="w3-col m4 l4" style="padding: 20px;">
	<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum={fNum}">
	<img src="{savename}" class="w3-round" alt="{fpinfo}" height="200px" width="100%"></a>
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
			<div class="w3-border">
				<div class="w3-blue" style="height:5px;width:{width}"></div>
			</div>
			<div class="w3-left-align" style="float:left;">{percent} · {camout}원</div>
			<div class="w3-right-align">{dday}일 남음</div>
		</div>
	</div>
</div>
</script>
<style type="text/css">
	#list {
		font-family: 'Hanna', serif;
	}
</style>
<div id="main">
	<div class="container">
		<div class="w3-bar" id="category">
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">전체보기</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">테크·가전</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">패션·잡화</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">푸드</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">홈리빙</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">디자인소품</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">여행·레저</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">스포츠·모빌리티</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">반려동물</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">공연·컬쳐</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">소셜·캠페인</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">교육·키즈</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">게임·취미</button>
			<button type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">출판</button>
		</div>
		<form method="get" action="${pageContext.request.contextPath}/funding/ingFundingList">
			<input type="hidden" name="category" id="category" value="${category}">
			<select name="field" id="field">
				<option value="title" <c:if test="${field eq 'title'}">selected="selected"</c:if>>제목</option>
				<option value="content" <c:if test="${field eq 'content'}">selected="selected"</c:if>>내용</option>
				<option value="id" <c:if test="${field eq 'id'}">selected="selected"</c:if>>글쓴이</option>
			</select>
		</form>
		
		<div class="row">
			<div class="col-lg-6">
				<div class="input-group">
					<input type="text" id="keyword" value="" class="form-control" aria-label="...">
					<span class="input-group-btn">
						<button class="btn btn-default" id="search" type="button">검색</button>
					</span>
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->

		<select id="sort">
			<option value="latest" <c:if test="${sort eq 'latest'}">selected="selected"</c:if>>최신순</option>
			<option value="recommend" <c:if test="${sort eq 'recommend'}">selected="selected"</c:if>>추천순</option>
			<option value="popular" <c:if test="${sort eq 'popular'}">selected="selected"</c:if>>인기순</option>
			<option value="camount" <c:if test="${sort eq 'camount'}">selected="selected"</c:if>>참여금액순</option>
			<option value="end" <c:if test="${sort eq 'end'}">selected="selected"</c:if>>종료임박순</option>
		</select>
		<input type="hidden" id="pageNum" value="">
		<div id="list" class="w3-row">
		</div>
		<button id="showMore">더보기</button>
	</div>
</div>