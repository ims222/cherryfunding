<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var pageNum = 1;
	var vNum = 0;
	var html ='';
	$(document).ready(function(){
		$("#showmore").on('click', showmore);
	});
	function showmore(){
		pageNum += 1;
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerShowMore',
			type: 'get',
			data: {pageNum: pageNum, vNum: vNum},
		    dataType: 'json',
		    success: function(data){
		    	for(var i=0; i<data.list.length; i++){
		    		html += data.list[i].content;
		    		alert(data.list[i].vNum);
		    		vNum = data.list[i].vNum;	
		    	}
		    	$("#showDiv").append(html);
		    	
		    }	
		})
	}
	
</script>
<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row no-collapse-1">
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<section class="4u">
					<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum=${vo.vNum}" class="image featured">
					<script>
					vNum = ${vo.vNum}
					</script>
					<img src="${pageContext.request.contextPath}/resources/upload/volunteer/${vo.saveName}"
						alt="${vo.vpInfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
					</div>
				</section>
			</c:forEach>
		</div>
	<button id="showmore">더보기</button>
		<div id="showDiv" class="row no-collapse-1">
		</div>
	</div>
</div>