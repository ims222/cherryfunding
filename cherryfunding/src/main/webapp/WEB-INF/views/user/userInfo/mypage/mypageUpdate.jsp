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

	// 데이터 수정
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
	
	//닉네임 글자 수 제한
	function fnChkByte(obj) {
	    var maxByte = 16; //최대 입력 바이트 수
	    var str = obj.value;
	    var str_len = str.length;
	 
	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";
	 
	    for (var i = 0; i < str_len; i++) {
	        one_char = str.charAt(i);
	 
	        if (escape(one_char).length > 4) {
	            rbyte += 2; //한글2Byte
	        } else {
	            rbyte++; //영문 등 나머지 1Byte
	        }
	 
	        if (rbyte <= maxByte) {
	            rlen = i + 1; //return할 문자열 갯수
	        }
	    }
	    if (rbyte > maxByte) {
	        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
	        str2 = str.substr(0, rlen); //문자열 자르기
	        obj.value = str2;
	        fnChkByte(obj, maxByte);
	    } else {
	        document.getElementById('byteInfo').innerText = rbyte+"/16byte";
	    }
	};
	
	//닉네임 유효성 인증(한글 및 영대소문자만)
	function isValidId(e){
 		var regx = /^[가-힣a-zA-Z]+$/;
 		if(!regx.test($("#newnick").val())) { 
 			alert("한글 및 영대소문자만 입력 가능합니다");
 			$("#newnick").val('');
		    $("#newnick").focus(); 
 		}else{
			   updateInfo(event);
			   $("#Modal_nick").modal('hide');
		}
	};
	
	//이메일 유효성 인증
	function isValidEmail(e){
		var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(!regExp.test($("#newemail").val())) { 
			      alert("이메일 주소가 유효하지 않습니다"); 
			      $("#newemail").val('');
			      $("#newemail").focus(); 
			   }else{
				   updateInfo(event);
				   $("#Modal_email").modal('hide');
			   }
		};
	//연락처 유효성 인증
	function isValidPhone(e){
		var phone=$("#newphone").val()
		var p=phone.split('-').join('');
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
			if(!regPhone.test(p)) { 
			      alert("연락처 형식이 유효하지 않습니다. 숫자 또는 '-'기호를 사용해 입력해 주십시오"); 
			      $("#newphone").val('');
			      $("#newphone").focus(); 
			   }else{
				   updateInfo(event);
				   $("#Modal_phone").modal('hide');
			   }
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
		  <td><button type="button" class="btn" data-toggle="modal" data-target="#Modal_addr" name="addr">수정</button></td>
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
          <input type="text" id="newnick" name="newnick" onkeyup="fnChkByte(this);">
          <span id="byteInfo"></span>
        </div>
        <div class="modal-footer">
          <button type="button" id="btn1" class="btn btn-default" data-target="nick" onclick="isValidId(this)">저장</button>
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
          <button type="button" id="btn2" class="btn btn-default" data-target="email" onclick="isValidEmail(this);">저장</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="Modal_phone" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">휴대폰번호 변경</h4>
        </div>
        <div class="modal-body">
          <p>원하는 휴대폰번호를 입력해 주세요</p>
          <input type="text" id="newphone" name="newphone">
        </div>
        <div class="modal-footer">
          <button type="button" id="btn3" class="btn btn-default" data-target="phone" onclick="isValidPhone(this);">저장</button>
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

