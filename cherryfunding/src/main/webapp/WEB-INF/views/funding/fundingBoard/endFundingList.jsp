<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#category").on('click', 'button', function(e){
			var value = $(this).text();
			location.href= "${pageContext.request.contextPath}/funding/endFundingList?category=" + value;
		});
	});
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
		<div class="row no-collapse-1">
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/funding/endFundingDetailforUser?fNum=${vo.fNum}" class="image featured"> <img
						src="${vo.savename}"
						alt="${vo.fpinfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
						<p>목표금액: ${vo.amount}원</p>
						<p>현재금액: ${vo.camout}원</p>
						<c:set var="before" value="${vo.camout * 100 / vo.amount}" />
							<c:choose>
								<c:when test="${before >= 1000}">
									<c:set var="barBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barBefore" value="${before}" />
								</c:otherwise>
							</c:choose>
						<div class="progress">
							<c:set var="before" value="${vo.camout * 100 / vo.amount}" />
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${barBefore/100}" type="percent"/>"
								aria-valuenow="${before * 100000}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${before/100}" type="percent" />
							</div>
						</div>
					</div>
				</div>
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