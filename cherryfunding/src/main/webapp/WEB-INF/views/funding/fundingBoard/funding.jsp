<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<section class="4u">
					<a href="#" class="image featured"> <img
						src="${pageContext.request.contextPath}/resources/upload/${vo.savename}"
						alt="${vo.fpinfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
						<p>목표금액: ${vo.amount}</p>
						<p>현재금액: ${vo.camout}</p>
						<div class="progress">
							<c:set var="before" value="${vo.camout * 100 / vo.amount}" />
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
	</div>
</div>