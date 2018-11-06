<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>mypageUpdate.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</head>
<style>
.wrap{
	margin-left : 100px;
	margin-top : 50px;

}

table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 300px;
    padding: 10px;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
}
table.type04 p {
    font-size: 18px;
}
</style>
<script type="text/javascript">
	var updateInfo = function(e){
		var col=$(e.target).attr("data-target");	
		var val=$("#new" + col).val();
		$.ajax({
			url:'${pageContext.request.contextPath}/users/updateUsers',
			data: { [col]:val,id:'${vo.id}'},
			dataType:'json',
			type:'post',
			success: function(data){
				$('#' + col).empty();
				$('#' + col).text(data[col]);
			}
		});
	};
</script>
<body>
<div class="wrap">
	<h2>회원정보 수정</h2>
	<p style="font-weight: bold;display: inline;font-size: 15px">${sessionScope.id}</p><p style="display: inline">님의 회원정보입니다</p>
	<p>회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 동의 없이는 공개 또는 제 3자에게 제공되지 않습니다.<p>
	<table class="type04">
		<tr>
		  <td>아이디</td>
		  <td>${vo.id}</td>
		  <td></td>
		</tr>
		<tr>
		  <td>닉네임</td>
		  <td id="nick">${vo.nick}</td>
		  <td><button type="button" class="btn" data-toggle="modal" data-target="#Modal_nick" name="nick">수정</button></td>
		</tr>
		<tr>
		  <td>이메일</td>
		  <td id="email">${vo.email}</td>
		  <td><button type="button" class="btn" data-toggle="modal" data-target="#Modal_email" name="email">수정</button></td>
		</tr>
		<tr>
		  <td>연락처</td>
		  <td id="phone">${vo.phone}</td>
		  <td><button type="button" class="btn" data-toggle="modal" data-target="#Modal_phone" name="phone">수정</button></td>
		</tr>
		<tr>
		  <td>주소</td>
		  <td id="addr">${vo.addr}</td>
		  <td><button type="button" class="btn" data-toggle="modal" data-target="#Modal_addr" name="addr" onclick="updateInfo(event)">수정</button></td>
		</tr>
		</table>
		</div>
	<!-- modal -->
  	<div class="modal fade" id="Modal_nick" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">닉네임 변경</h4>
        </div>
        <div class="modal-body">
          <p>원하는 닉네임을 입력해 주세요</p>
          <input type="text" id="newnick" name="newnick">
        </div>
        <div class="modal-footer">
          <button type="button" id="btn1" class="btn btn-default" data-dismiss="modal" data-target="nick" onclick="updateInfo(event);">저장</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="Modal_email" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">이메일 변경</h4>
        </div>
        <div class="modal-body">
          <p>원하는 이메일을 입력해 주세요</p>
          <input type="text" id="newemail" name="newemail">
        </div>
        <div class="modal-footer">
          <button type="button" id="btn2" class="btn btn-default" data-dismiss="modal" data-target="email" onclick="updateInfo(event);">저장</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="Modal_phone" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">연락처 변경</h4>
        </div>
        <div class="modal-body">
          <p>원하는 연락처을 입력해 주세요</p>
          <input type="text" id="newphone" name="newphone">
        </div>
        <div class="modal-footer">
          <button type="button" id="btn3" class="btn btn-default" data-dismiss="modal" data-target="phone" onclick="updateInfo(event);">저장</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="Modal_addr" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">주소 변경</h4>
        </div>
        <div class="modal-body">
          <p>원하는 주소를 입력해 주세요</p>
          <input type="text" id="newaddr" name="newaddr">
        </div>
        <div class="modal-footer">
          <button type="button" id="btn4" class="btn btn-default" data-dismiss="modal" data-target="addr" onclick="updateInfo(event);">저장</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>

