<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>UserSetting.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>

  .toggleBG{background: #CCCCCC; width: 70px; height: 30px; border: 1px solid #CCCCCC; border-radius: 15px;}
  .toggleFG{background: #FFFFFF; width: 30px; height: 30px; border: none; border-radius: 15px; position: relative; left: 0px;}

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
$(document).on('click', '.toggleBG', function () {
    var toggleBG = $(this);
    var toggleFG = $(this).find('.toggleFG');
    var left = toggleFG.css('left');
    if(left == '40px') {
        toggleBG.css('background', '#CCCCCC');
        toggleActionStart(toggleFG, 'TO_LEFT');
    }else if(left == '0px') {
        toggleBG.css('background', '#53FF4C');
        toggleActionStart(toggleFG, 'TO_RIGHT');
    }
});
 
// 토글 버튼 이동 모션 함수
function toggleActionStart(toggleBtn, LR) {
    // 0.01초 단위로 실행
    var intervalID = setInterval(
        function() {
            // 버튼 이동
            var left = parseInt(toggleBtn.css('left'));
            left += (LR == 'TO_RIGHT') ? 5 : -5;
            if(left >= 0 && left <= 40) {
                left += 'px';
                toggleBtn.css('left', left);
            }
        }, 10);
    setTimeout(function(){
        clearInterval(intervalID);
    }, 201);
}
</script>
<body>
<div class="wrap">
	<h2>환경설정</h2>
	<div>
	<p style="font-weight: bold;display: inline;font-size: 15px">${sessionScope.id}</p><p style="display: inline">님의 환경설정입니다</p>
	</div>
	<table class="type04">
		<tr>
		  <td>언어</td>
		  <td>
				</td>
		  <td></td>
		</tr>
		<tr>
		  <td>음성지원</td>
		  <td><div class='toggleBG'><button class='toggleFG'></button></div></td>
		  <td></td>
		</tr>
	</table>
</div>
</body>
</html>

