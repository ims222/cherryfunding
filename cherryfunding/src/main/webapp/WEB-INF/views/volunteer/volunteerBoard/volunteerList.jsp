<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
		    	if(vNum == 1){
		    		$("#myModal").modal('show');
					return;
		    	}
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
		    		html += '</div>';
		    		html += '</section>';
		    	}
		    	$("#showDiv").append(html);
		    }	
		})
	}
	
</script>
<style type="text/css">
.modal{
      position: absolute;
      top: 90%;
      z-index: 1050;
      width: auto;
      outline: none;
      }
.modal-backdrop{
  z-index: -1;
}
</style>
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
	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>마지막 페이지입니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>  
</div>