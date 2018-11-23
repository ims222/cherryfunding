<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7"></script>
<script type="text/javascript">
	var pageNum = 1;
	var vNum = 0;
	$(document).ready(function(){
		firstShow();
		$("#showmore").on('click', showmore);		
	});
	function showmore(){
		$('#showDiv').append(document.querySelector('#loadingTemplate').innerHTML);
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerShowMore',
			type: 'get',
			data: {pageNum: pageNum, vNum: vNum},
		    dataType: 'json',
		    success: function(data){
		    	var html = '';
		    	if(vNum == 1){
		    		//$("#myModal").modal('show');
		    		swal({
					  type: 'error',
					  title: '마지막 페이지입니다.',
					});
					return;
		    	}
		    	for(var i=0; i<data.list.length; i++){
		    		vNum = data.list[i].vNum;
		    		html += '<div class="w3-col m4 l4 " style="padding: 20px;">';
		    		html += '<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum='
			    			+ data.list[i].vNum
		    				+ '" class="image featured">';		    				
		    		html += '<div style="min-height:200px"><img src="${pageContext.request.contextPath}/resources/upload/volunteer/'
		    			+ data.list[i].saveName + '" alt="'
		    			+ data.list[i].vpInfo 
		    			+'" height="200px" class="w3-round" width="100%"></a></div>';
		    		html += '<div class="box">';
		    		html += '<h4>' + data.list[i].title + '</h4>';
		    		html += '<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">' 
			    		+ data.list[i].recommend + '</span></p></div>';
		    		html += '</div>';
		    		html += '</div>';
		    	}
		    	$("#showDiv").append(html);
		    },
			complete :function(){
				$('.loading').remove();
			}	
		})
		pageNum += 1;
	}
	function getRecommend(vNum){
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerGetRecommend',
			data: {vNum: vNum},
			type: 'get',
			dataType: 'text',
			success: function(data){
				$("#showRecomm").empty();
				$("#showRecomm").append(data);
			}
		})
	}
	
	function firstShow(){
		$('#showDiv').append(document.querySelector('#loadingTemplate').innerHTML);
		$.ajax({
			url: '${pageContext.request.contextPath}/volunteer/volunteerFirstShow',
			type: 'get',
			data: {pageNum: pageNum, vNum: vNum},
		    dataType: 'json',
		    success: function(data){
		    	var html = '';
		    	if(vNum == 1){
		    		//$("#myModal").modal('show');
		    		swal({
					  type: 'error',
					  title: '마지막 페이지입니다.',
					});
					return;
		    	}
		    	for(var i=0; i<data.list.length; i++){
		    		vNum = data.list[i].vNum;
		    		html += '<div class="w3-col m4 l4 " style="padding: 20px;">';
		    		html += '<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum='
			    			+ data.list[i].vNum
		    				+ '" class="image featured">';		    				
		    		html += '<div style="min-height:200px"><img src="${pageContext.request.contextPath}/resources/upload/volunteer/'
		    			+ data.list[i].saveName + '" alt="'
		    			+ data.list[i].vpInfo 
		    			+'" height="200px" class="w3-round" width="100%"></a></div>';
		    		html += '<div class="box">';
		    		html += '<h4>' + data.list[i].title + '</h4>';
		    		
		    		html += '<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">' 
		    		+ data.list[i].recommend + '</span></p></div>';
		    		html += '</div>';
		    		html += '</div>';
		    	}
		    	$("#showDiv").append(html);
		    },
			complete :function(){
				$('.loading').remove();
			}	
		})
		pageNum += 1;
	}
	
</script>
<script id="loadingTemplate" type="text/template">
<div class="spinner loading">
	<div class="rect1"></div>
	<div class="rect2"></div>
	<div class="rect3"></div>
	<div class="rect4"></div>
	<div class="rect5"></div>
</div>
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
		<!--<div class="row no-collapse-1">  -->
		<!-- 
			<c:forEach var="vo" items="${list}" varStatus="vs">
				<div class="w3-col m4 l4" style="padding: 20px;">
					<a href="${pageContext.request.contextPath}/volunteer/volunteerDetail?vNum=${vo.vNum}" class="image featured">
					
					<div style="min-height:200px">
					<img src="${pageContext.request.contextPath}/resources/upload/volunteer/${vo.saveName}"
						class="w3-round" alt="${vo.vpInfo}" height="200px" width="100%" onload="getRecommend(${vo.vNum});"></a>
					</div>	
					<div class="box">
						<h4>${vo.title}</h4>
						<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green" id="showRecomm">여기에</span></p></div>
					</div>
					
				</div>
			</c:forEach>
			-->
		<!-- </div> -->
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