<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<section class="4u">
					<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum=${vo.vNum}" class="image featured">
					<img src="${pageContext.request.contextPath}/resources/upload/volunteer/${vo.saveName}"
						alt="${vo.vpInfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
					</div>
				</section>
			</c:forEach>
		</div>
	</div>
</div>