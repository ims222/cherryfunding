<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	var pageNum = 1;
	var vNum = 0;
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
		    	var html = '';
		    	for(var i=0; i<data.list.length; i++){
		    		vNum = data.list[i].vNum;
		    		html += '<section class="4u">';
		    		html += '<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum='
			    			+ data.list[i].vNum
		    				+ '" class="image featured">';		    				
		    		html += '<img src="${pageContext.request.contextPath}/resources/upload/volunteer/'
		    			+ data.list[i].saveName + '" alt="'
		    			+ data.list[i].vpInfo 
		    			+'" height="200px"></a>';
		    		html += '<div class="box">';
		    		html += data.list[i].vNum;
		    		html += '<p>' + data.list[i].title + '</p>';
					html += '<p>' + data.list[i].id + '</p>';
		    		html += '</div>';
		    		html += '</section>';
		    	}
		    	console.log(data);
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
						<p>${vo.vNum}</p>
						<p>${vo.title}</p>
					</div>
				</section>
			</c:forEach>
		</div>
	<div id="showDiv" class="row no-collapse-1"></div><br>
	<button id="showmore" class="w3-btn w3-block w3-teal">더보기</button>
	</div>
</div>