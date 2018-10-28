<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<section class="6u">
			<!-- 
				<a href="${pageContext.request.contextPath}" class="image featured">
				<img src="${pageContext.request.contextPath}/resources/upload/sharing/${vo.saveName}"
					alt="${vo.sPinfo}" height="200px"></a>
				<div class="box">
					<p>${vo.title}</p>
					<p>${vo.id}</p>
				</div>
			 -->
			 
			 <div class="box">
			 	<p>${vo.title}</p>
			 	<p>${vo.content}</p>
			 </div>
			</section>
			<section class="6u">
				<div class="box">
					<select>
					<c:forEach var="item" items="${itemList}">
						<option>물품명: ${item.title} 수량: ${item.amount}</option>
					</c:forEach>
					</select>
				</div>
			</section>
		</div>
	</div>
</div>