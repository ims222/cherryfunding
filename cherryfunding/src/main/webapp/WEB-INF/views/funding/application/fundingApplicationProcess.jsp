<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inputFile").on('change', "input[name='fPicture']", function(){
			var file = $("<input>").attr('type', 'file')
					.attr('name', 'fPicture');
			var text = $('<input>').attr('type', 'text')
					.attr('name', 'fPinfo');
			var br = $('<br>');
			$("#inputFile").append(file).append(text).append(br);
		});

	});
	function appCommit(){
		if(!$("#title").val()){
		 alert("제목을 입력해주세욧");
		 return false;
		}
		if(!$("#content").val()){
			alert("내용을 입력해주세욧");
			 return false;
		}
		if(!$("#amount").val()){
			alert("목표금액을 설정하세욧");
			return false;
		}
		if(!$("#sDate").val()){
			alert("시작일자를 선택하세요");
			return false;
		}
		if(!$("#eDate").val()){
			alert("종료일자를 선택하세요");
			return false;
		}
		
		var sd = new Date($("#sDate").val());
		var ed = new Date($("#eDate").val());
		if(sd.getTime() > ed.getTime()){
			alert("시작보다 종료를 더 먼저 입력했어여");
			return false;
		}
		
		var r = $("input[name='reward']");
		var ind = $("input[name='reward']").length;
		var check = 0;
		for(var i = 0;i<ind;i++){
			if($(r[i]).val()){
				check++;
			}
		}
		if(check < 1){
			alert("물품은 한가지 이상 입력하셔야 되욧");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h1>funding application</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/funding/fundingApplication" enctype="multipart/form-data" onsubmit="return appCommit()">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"><br>
		
		<label for="content">제목</label><br>
		<textarea rows="5" cols="50" name="content" id="content"></textarea><br>
		
		<label for="amount">목표금액</label>
		<input type="number" name="amount" id="amount"><br>
		
		<label for="sDate">시작날짜</label>
		<input type="date" name="sDate" id="sDate"><br>
		<label for="eDate">종료날짜</label>
		<input type="date" name="eDate" id="eDate"><br>
		
		<label for="category">카테고리</label>
		<select name="category">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br>
		해시태그 <input type="text" name="hashtag">
		<label for="hashtag">#1</label><input type="checkbox" name="hashtag" value="n1">
		<label for="hashtag">#2</label><input type="checkbox" name="hashtag" value="n2">
		<label for="hashtag">#3</label><input type="checkbox" name="hashtag" value="n3">
		<br>
		
		리워드 등록<br>
		물품명1<input type="text" name="reward">
		가격1<input type="text" name="price"><br>
		물품명2<input type="text" name="reward">
		가격2<input type="text" name="price"><br>
		물품명3<input type="text" name="reward">
		가격3<input type="text" name="price"><br>
		<div id="inputFile">
		사진업로드<br>
		<input type="file" name="fPicture"><input type="text" name="fPinfo"><br>
		</div>
		<input type="submit" value="submit">
	</form>
</body>
</html>