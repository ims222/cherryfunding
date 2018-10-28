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
			var last = $("input[name='price']").last();
			if($(last).is($(this))){
				var tr = $("<span></span>").text("물품명");
				var rw = $("<input>").attr('type', 'text')
									.attr('name', 'sItem');
				var tp = $("<span></span>").text('수량');
				var pr = $("<input>").attr('type', 'text')
									.attr('name', 'amount');
				$("#inputReward").append(tr).append(rw)
								.append(tp).append(pr).append('<br>');
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
		var r = $("input[name='sItem']");
		var ind = $("input[name='amount']").length;
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
<body>
	<form method="post" action="/share/insertSharing">
		<label for="title">제목</label><input type="text" name="title" id="title"><br>
		내용<br>
		<textarea name="content" rows="5" cols="5" id="content"></textarea>
		<br>
		<select name="category">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		
		물품 등록<br>
		<div id="inputItem">
			<span>물품명</span><input type="text" name="sItem">
			<span>수량</span><input type="text" name="amount"><br>
		</div>
		
		
		<div id="inputFile">
			사진업로드<br>
			<input type="file" name="sPicture">
			<input type="text" name="sPinfo"><br>
		</div>
		<input type="submit" value="제출">
	</form>
</body>
</html>


