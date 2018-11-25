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
		$('#list').append(document.querySelector('#loadingTemplate').innerHTML);
		var pageNum = $('#pageNum').val();
		var category = $('#category').val();
		var sort = $('#sort').val();
		var keyword = $('#keyword').val();
		var field = $('#field').val();
			$.ajax({
			url:'${pageContext.request.contextPath}/funding/morePrepareFundingList',
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
									.replace("{camout}", comma(camout))
									.replace("{category}", value.CATEGORY)
									.replace("{recomm}", value.recomm)
									.replace("{dday}", value.DDAY)
									.replace(/{width}/gi, barBefore + "%" )
									.replace("{valuenow}", barBefore)
									.replace(/{percent}/gi, Math.ceil((before/100) * 100) + "%"); 
						
						
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
		showMore();
	}
	
	
	function related(){//준비중 인 것만 나오게... 부탁드려요....
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
</script>
<script id="fundingList" type="text/template">
<div class="w3-col m4 l4 " style="padding: 20px;">
	<a href="${pageContext.request.contextPath}/funding/prepareFundingDetailforUser?fNum={fNum}">
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
				<div class="processBar" style="height:5px;width:{width}"></div>
			</div>
			<div class="w3-left-align" style="float:left;">{percent} · {camout}원</div>
			<div class="w3-right-align">{dday}일 후 시작</div>
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
		<div class="w3-bar" id="category">
			<button data-voice="전체보기" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">전체보기</button>
			<button data-voice="테크·가전" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">테크·가전</button>
			<button data-voice="패션·잡화" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">패션·잡화</button>
			<button data-voice="푸드" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">푸드</button>
			<button data-voice="홈리빙" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">홈리빙</button>
			<button data-voice="디자인소품" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">디자인소품</button>
			<button data-voice="여행·레저" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">여행·레저</button>
			<button data-voice="스포츠·모빌리티" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">스포츠·모빌리티</button>
			<button data-voice="반려동물" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">반려동물</button>
			<button data-voice="공연·컬쳐" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">공연·컬쳐</button>
			<button data-voice="소셜·캠페인" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">소셜·캠페인</button>
			<button data-voice="교육·키즈" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">교육·키즈</button>
			<button data-voice="게임·취미" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">게임·취미</button>
			<button data-voice="출판" type="button" class="w3-bar-item w3-button w3-pale-yellow w3-hover-purple">출판</button>
		</div>
				
		<div class="topnav">
			<span>준비중 펀딩</span>
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