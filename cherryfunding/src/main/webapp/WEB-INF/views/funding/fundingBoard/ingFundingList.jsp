	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		showMore();
		$("#category").on('click', 'button', selectionOption);
		$("#sort").on('change', selectionOption);

		$("#keyword").on('keyup', related);

		$("#showMore").on('click', showMore);
	});
	var showMore = function(){
		var pageNum = $('#pageNum').val();
			$.ajax({
			url:'${pageContext.request.contextPath}/funding/moreIngFundingList',
			data:{pageNum:pageNum},
			dataType:'json',
			type:'post',
			success:function(data){
				var result = $('#list').html(); 
				var html = document.querySelector('#fundingList2').innerHTML;
				if(data.list === 'no'){
					alert('마지막 페이지 입니다');
				}else{
					data.list.forEach(function(value){
						result +=	html.replace(/{fNum}/gi, value.fNum)
									.replace("{savename}", value.savename)
									.replace("{fpinfo}", value.fpinfo)
									.replace("{title}", value.title)
									.replace("{id}", value.id)
									.replace("{amount}", value.amount)
									.replace("{camout}", value.camout);
									//.replace("{edate}", "18-08-11");
									//.replace("{edate}", new Date(value.edate).toString());
					});
					document.querySelector('#list').innerHTML = result;
					console.log('data.pageNum', data.pageNum);
					$('#pageNum').val(data.pageNum);
					console.log('pageNum', $('#pageNum').val());	
				}
			}
		});	
	}
	function replaceAll(str, searchStr, replaceStr) {
		  return str.split(searchStr).join(replaceStr);
	}
	function selectionOption(){
		var category = $(this).text();
		var sort = $(this).val();
		location.href= "${pageContext.request.contextPath}/funding/ingFundingList?sort=" + sort + "&category=" + category;
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
				alert(data);
			}
		});
		
	}
</script>

<script id="fundingList2" type="text/template">
<section class="4u">
	<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum={fNum}"
	class="image featured">
	<img src="{savename}" alt="{fpinfo}" height="200px"></a>
	<div class="box">
		<p>펀딩번호: {fNum}</p>
		<p>{title}</p>
		<p>{id}</p>
		<p>목표금액: {amount}원</p>
		<p>현재금액: {camout}원</p>
	</div>
</section>
</script>
<!-- Main -->
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
			<input type="text" name="keyword" id="keyword" value="${keyword}">
			<div id="result"></div>
			<input type="submit" value="검색">		
		</form>
		<select id="sort">
			<option value="latest" <c:if test="${sort eq 'latest'}">selected="selected"</c:if>>최신순</option>
			<option value="recommend" <c:if test="${sort eq 'recommend'}">selected="selected"</c:if>>추천순</option>
			<option value="popular" <c:if test="${sort eq 'popular'}">selected="selected"</c:if>>인기순</option>
			<option value="camount" <c:if test="${sort eq 'camount'}">selected="selected"</c:if>>참여금액순</option>
			<option value="end" <c:if test="${sort eq 'end'}">selected="selected"</c:if>>종료임박순</option>
		</select>
		<input type="hidden" id="pageNum" value="">
		<div class="row no-collapse-1" id="list">
		</div>
		<button id="showMore">더보기</button>
		<div class="row">
			<!-- Content -->
			<div class="6u">
				<section>
					<ul class="style">
						<li class="fa fa-wrench">
							<h3>Integer ultrices</h3> <span>In posuere eleifend odio.
								Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
								viverra vulputate enim. Aliquam erat volutpat. Maecenas
								condimentum enim tincidunt risus accumsan.</span>
						</li>
						<li class="fa fa-leaf">
							<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
								Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
								viverra vulputate enim. Aliquam erat volutpat. Maecenas
								condimentum enim tincidunt risus accumsan.</span>
						</li>
					</ul>
				</section>
			</div>
			<div class="6u">
				<section>
					<ul class="style">
						<li class="fa fa-cogs">
							<h3>Integer ultrices</h3> <span>In posuere eleifend odio.
								Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
								viverra vulputate enim. Aliquam erat volutpat. Maecenas
								condimentum enim tincidunt risus accumsan.</span>
						</li>
						<li class="fa fa-road">
							<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
								Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
								viverra vulputate enim. Aliquam erat volutpat. Maecenas
								condimentum enim tincidunt risus accumsan.</span>
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>
</div>