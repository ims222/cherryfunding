<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <script type="text/javascript">

  	 	function modalshow(num){
 
  			$('#myModal').modal('show');
  			
  			$('#btn1').click(function(){
  				var value = num;
  				var url = "<c:url value='/admypage/wait?num="+value+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	 	
  	 	function modalshow2(num){
  	 	 
  			$('#myModal').modal('show');
  			
  			$('#btn1').click(function(){
  				var value = num;
  				var url = "<c:url value='/admypage/cwait?num="+value+"'/>";
  				location.href=url;  				
  			});
  			
  	 	};
  	
  
  </script>
  
  
</head>
<body>
	<div class="container2">
	<h2>���� Ȯ��</h2>
	<table class="table table-condensed" border="1" width="500">
		<tr>
			<th>�۹�ȣ</th>
			<th>���̵�</th>
			<th>����</th>
			<th>ī�װ�</th>
			<th>�����</th>
			<th>�󼼺���</th>
			<th>���ο���</th>
			
		</tr>
		<c:if test="${vo ne 'null'}">
		<c:forEach var="vo" items="${vo }">
			<tr>
				<td>${vo.fNum }</td>
				<td>${vo.aid }</td>
				<td>${vo.title }</td>
				<td>${vo.category }</td>
				<td>${vo.regdate }</td>
				<td><a href="<c:url value='/fundingList/detail?num=${vo.fNum }'/>">����</a></td>
				<td id="mm"><a data-toggle="modal" href="javascript:modalshow('${vo.fNum}');">${vo.confirm }</a></td>
			
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${co ne 'null'}">
	 	<c:forEach var="co" items="${co }">
			<tr>
				<td>${co.cNum }</td>
				<td>${co.id }</td>
				<td>${co.title }</td>
				<td>${co.category }</td>
				<td>${co.regdate }</td>
				<td><a href="<c:url value='/charityList/detail?num=${co.cNum }'/>">����</a></td>
				<td id="mm"><a data-toggle="modal" href="javascript:modalshow2('${co.cNum}');">${co.confirm }</a></td>
			
			</tr>
		</c:forEach>
		</c:if>
		
		
			 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">���� ����</h4>
        </div>
        <div class="modal-body">
          <p>���� �Ͻðڽ��ϱ�?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">Ȯ��</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
        </div>
      </div>
    </div>
  </div>
		

</table>

<form action="${pageContext.request.contextPath }/admin/csearch" method="post">
<select name="kinds">
	<option value='chirty' <c:if test="${kinds eq 'chirty' }">selected="selected"</c:if>>���</option>
	<option value='funding'<c:if test="${kinds eq 'funding' }">selected="selected"</c:if>>�ݵ�</option>

</select>

<select name="field">
	<option value='id' <c:if test="${field eq 'id' }">selected="selected"</c:if>>���̵�</option>
	<option value='title' <c:if test="${field eq 'title' }">selected="selected"</c:if>>������</option>
</select>

<input type="text" class="form-control" name="keyword" placeholder="search">
<input type="submit" value="ã��">

</form>
</div>

</body>
</html>