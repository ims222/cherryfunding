<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7"></script>
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
			swal({
				  type: 'error',
				  title: '제목을 입력하세요.',
				});
			return false;
		}
		if(!$("#content").val()){
			swal({
				  type: 'error',
				  title: '내용을 입력하세요.',
				});
			return false;
		}
		if(!$("#dDay").val()){
			swal({
				  type: 'error',
				  title: '봉사일을 입력하세요.',
				});
			return false;
		}
		if(!$("#members").val()){
			swal({
				  type: 'error',
				  title: '필요인원 수를 입력하세요.',
				});
			return false;
		}
		if(!$("#place").val()){
			swal({
				  type: 'error',
				  title: '봉사 장소를 입력하세요.',
				});
			return false;
		}
		return true;
	}
</script>
<style>
input[type=text] {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
input[type=number] {
		  width: 50%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		input[type=date] {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		input[name="dateRange"] {
		  width: 60%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		textarea{
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		.btn {
		  background-color: #088A85;
		  color: white;
		  padding: 12px;
		  margin: 10px 0;
		  border: none;
		  width: 100%;
		  border-radius: 3px;
		  cursor: pointer;
		  font-size: 17px;
		}
		
		.btn:hover {
		    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
		}
		select {
		  margin-bottom: 1em;
		  padding: .25em;
		  font-weight: bold;
		  letter-spacing: .15em;
		  border-radius: 0;
  			}		
</style>
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
		<input type="submit" value="제출" class="btn">
	</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>


