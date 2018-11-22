<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  		

  	 	function modalshow(num){
  	 		var adid ="${sessionScope.adid}";
  	 	  
  			$("#myModal").modal("show")
  			
  			$("#btn1").click(function(){
  				var value = num;
  				
  				var url = "<c:url value='/admypage/confirm?num="+value+"&adid="+adid+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	 	
  	 	function modaldelshow(num){
  	 	 
    			$("#myModal").modal("show")
    			
    			$("#btn1").click(function(){
    				var fNum = num;
    				
    				var url = "<c:url value='/funding/confirmdelete?fNum="+fNum+"'/>";
    				location.href=url;  				
    			});
    			
    	 	};
    		function modaldelshow2(num){
   	  	 	 
    			$("#myModal").modal("show")
    			
    			$("#btn1").click(function(){
    				var cNum = num;
    				
    				var url = "<c:url value='/charity/delete?cNum="+cNum+"'/>";
    				location.href=url;  				
    			});
    			
    	 	};
  	 	

  	 	function modalshow2(num){
  	 		var adid ="${sessionScope.adid}";
  			$("#myModal").modal("show")
  			
  			$("#btn1").click(function(){
  				var cNum = num;
  				var url = "<c:url value='/admypage/chirtyconfirm?num="+cNum+"&adid="+adid+"'/>";
  				location.href=url;
  			});
  			
  	 	};
  	
  
  </script>
	
	<div class="container2">
	<h2>승인 요청</h2><br>
	
<form action="${pageContext.request.contextPath }/admin/wsearch" method="post">


<select name="kinds">
	<option value='chirty' <c:if test="${kinds eq 'chirty' }">selected="selected"</c:if>>기부</option>
	<option value='funding'<c:if test="${kinds eq 'funding' }">selected="selected"</c:if>>펀딩</option>

</select>

<select name="field">
	<option value='id' <c:if test="${field eq 'id' }">selected="selected"</c:if>>아이디</option>
	<option value='title' <c:if test="${field eq 'title' }">selected="selected"</c:if>>글제목</option>
</select><br>

<input type="text" class="form-control" name="keyword" placeholder="search" style="width:1080px;float:left;">
&nbsp<input type="submit" class="btn btn-info" value="찾기">
</form><br>
	<table class="table table-striped" width="500">
		<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>등록일</th>
			<th>상세보기</th>
			<th>승인여부</th>
			<th>삭제</th>
			
		</tr>
		<c:if test="${vo ne 'null'}">
		<c:forEach var="vo" items="${vo }">
		<c:set var="name" value="${vo.fNum }"/>
			<tr>
				<td>${vo.fNum }</td>
				<td>${vo.id }</td>
				<td>${vo.title }</td>
				<td>${vo.category }</td>
				<td>${vo.regdate }</td>
				<td><a href="<c:url value='/fundingList/detail?num=${vo.fNum }'/>">상세보기</a></td>
				<td id="mm"><a data-toggle="modal" href='javascript:modalshow("${vo.fNum}");'>${vo.confirm }</a></td>
				<td><a href='javascript:modaldelshow("${vo.fNum}");'>삭제</a></td>
				
			
			</tr>
		</c:forEach>
		</c:if>
		
		
		<c:if test="${co ne 'null'}">
		<c:forEach var="co" items="${co }">
			<tr>
				<td>${co.cNum }</td>
				<td>${co.aId }</td>
				<td>${co.title }</td>
				<td>${co.category }</td>
				<td>${co.regdate }</td>
				<td><a href="<c:url value='/charityList/detail?num=${co.cNum }'/>">상세보기</a></td>
				<td><a data-toggle="modal" href="javascript:modalshow2('${co.cNum}');">${co.confirm }</a></td>
				<td><a href='javascript:modaldelshow2("${co.cNum}");'>삭제</a></td>
				
			
			</tr>
		</c:forEach>
		</c:if>
		
		
		
		 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">승인 여부</h4>
        </div>
        <div class="modal-body">
          <p>승인 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
		
</table>

</div>
