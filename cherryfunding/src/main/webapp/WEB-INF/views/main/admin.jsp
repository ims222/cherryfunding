<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

		
		function modalshow(){
			$('#myModal').modal("show");			
		};

</script>


<header>

<div>
	${sessionScope.aid}
</div>

<button class="h_button">회원가입</button>
<button class="h_button">로그인</button>
	<ul>
		<c:choose>
			<c:when test="${empty sessionScope.aid}">
				<li><a href="<c:url value='/adjoinagree'/>">회원가입</a></li>
				<%-- <li><a href="<c:url value='/adlogin'/>">로그인</a></li> --%>
				<li><a href="javascript:modalshow();">로그인</a></li>
			</c:when>
			
			<c:otherwise>
				<li><a href="<c:url value='/admypage'/>">관리자 마이페이지</a></li>
				<li><a href="<c:url value='/adlogout'/>">로그아웃</a></li>
			</c:otherwise>
		
		</c:choose>
	</ul>
	
	
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
	
</header>
