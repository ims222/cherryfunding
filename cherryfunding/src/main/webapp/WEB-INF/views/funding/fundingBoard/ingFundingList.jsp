	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#category").on('click', 'button', selectionOption);
		$("#sort").on('change', selectionOption);
		$("#keyword").on('keyup', related);
	});
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
		<div class="row no-collapse-1">
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<section class="4u">
					<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum=${vo.fNum}"
					class="image featured">
					<img src="${vo.savename}" alt="${vo.fpinfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
						<p>목표금액: ${vo.amount}원</p>
						<p>현재금액: ${vo.camout}원</p>
						<fmt:formatDate value="${vo.edate}" var="edate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${edate}" var="edateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${edateDate.time / (1000 * 60 * 60 * 24)}" var="end" integerOnly="true"/>
						
						<jsp:useBean id="today" class="java.util.Date"/>
						<fmt:formatDate value="${today}" var="todayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${todayDate}" var="nowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${nowDate.time / (1000 * 60 * 60 * 24)}" var="now" integerOnly="true"/>
						<p>D${now-end}</p>
						<div class="progress">
							<c:set var="before" value="${vo.camout * 100 / vo.amount}" />
							<c:choose>
								<c:when test="${before >= 1000}">
									<c:set var="barBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barBefore" value="${before}" />
								</c:otherwise>
							</c:choose>
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${barBefore/100}" type="percent"/>"
								aria-valuenow="${barBefore * 10000}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${before/100}" type="percent" />
							</div>
						</div>
					</div>
				</section>
			</c:forEach>
		</div>
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