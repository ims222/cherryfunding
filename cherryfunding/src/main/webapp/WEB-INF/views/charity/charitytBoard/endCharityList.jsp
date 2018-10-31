<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#category").on('click', 'button', function(e){
			var value = $(this).text();
			location.href= "${pageContext.request.contextPath}/charity/endCharityList?category=" + value;
		});
	});
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
		<form method="get" action="${pageContext.request.contextPath}/charity/endCharityList">
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
				<section class="4u">
					<a href="${pageContext.request.contextPath}/charityList/detail?num=${vo.cNum}" class="image featured"> 
					<img src="${vo.savename}" alt="${vo.cpinfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
						<p>목표금액: ${vo.amount}</p>
						<p>현재금액: ${vo.cAmount}</p>

						<div class="progress">
							<c:set var="before" value="${vo.cAmount * 100 / vo.amount}" />
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${before}" type="percent"/>"
								aria-valuenow="${before * 100}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${before}" type="percent" />
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