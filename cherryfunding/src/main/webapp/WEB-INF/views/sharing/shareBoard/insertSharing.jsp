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
				<form method="post" action="${pageContext.request.contextPath}/sharing/insertSharing" enctype="multipart/form-data" onsubmit="return appCommit()">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<label for="title">제목</label><input type="text" name="title" id="title"><br>
				내용<br>
				<textarea name="content" rows="5" cols="5" id="content"></textarea>
				<br>
				카테고리<br>
				<select name="category">
					<option value="의류">의류</option>
					<option value="도서">도서</option>
					<option value="악세서리">악세서리</option>
					<option value="가전제품">가전제품</option>
					<option value="인테리어">인테리어</option>
				</select>
				<br>
				
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
				<input type="submit" value="제출" class="btn">
				</form>
			</div>
		</div>
	</div>
</div>	
</body>
</html>


