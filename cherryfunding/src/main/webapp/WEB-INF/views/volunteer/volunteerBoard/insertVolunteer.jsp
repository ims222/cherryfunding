<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inputFile").on('change', "input[name='sPicture']", function(){
			var last = $("input[name='sPicture']").last();
			if($(last).is($(this))){
				var file = $("<input>").attr('type', 'file')
									.attr('name', 'sPicture');
				var text = $('<input>').attr('type', 'text')
									.attr('name', 'sPinfo');
				$("#inputFile").append(file).append(text).append('<br>');
			}
			
		});
		$("#inputItem").on('change', "input[name='amount']", function(){
			var last = $("input[name='amount']").last();
			if($(last).is($(this))){
				var iname = $("<span></span>").text("물품명");
				var item = $("<input>").attr('type', 'text')
									.attr('name', 'sItem');
				var am = $("<span></span>").text('수량');
				var amtxt = $("<input>").attr('type', 'text')
									.attr('name', 'amount');
				$("#inputItem").append(iname).append(item)
								.append(am).append(amtxt).append('<br>');
			}
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
		if(!$("#dDay").val()){
			alert("봉사 날짜를 입력하세욧");
			return false;
		}
		if(!$("#members").val()){
			alert("필요인원수를 입력하세욧");
			return false;
		}
		if(!$("#place").val()){
			alert("봉사 장소를 입력하세욧ㅅㅅ");
			return false;
		}
		return true;
	}
</script>

<body>
<div id="main">
	<div class="container">
	<div class="row">
		<div class='col-lg-12' style="margin-top: 20px; margin-bottom: 10%;">
	<form method="post" action="${pageContext.request.contextPath}/volunteer/insertVolunteer" enctype="multipart/form-data" onsubmit="return appCommit()">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<label for="title">제목</label><input type="text" name="title" id="title"><br>
		카테고리<br>
		<select name="category">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br>
		
		내용<br>
		<textarea name="content" rows="5" cols="5" id="content"></textarea>
		<br>
		
		봉사일자<br>
		<input type="date" name="dDay" id="dDay">
		<br>
		필요인원<br>
		<input type="number" name="members" id="members">
		<br>
		장소<br>
		<input type="text" name="place" id="place">
		
			<div id="inputFile">
			사진업로드<br>
			<input type="file" name="vPicture">
			<input type="text" name="vPinfo"><br>
		</div>
		<input type="submit" value="제출">
	</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>


