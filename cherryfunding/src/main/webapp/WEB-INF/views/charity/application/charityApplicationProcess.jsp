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
		$("#inputFile").on('change', "input[name='cPicture']", function(){
			var last = $("input[name='cPicture']").last();
			if($(last).is($(this))){
				var file = $("<input>").attr('type', 'file')
									.attr('name', 'cPicture');
				var text = $('<input>').attr('type', 'text')
									.attr('name', 'cPinfo');
				$("#inputFile").append(file).append(text).append('<br>');
			}
			
		});
		$("#inputReward").on('change', "input[name='price']", function(){
			var last = $("input[name='price']").last();
			if($(last).is($(this))){
				var tr = $("<span></span>").text("리워드명");
				var rw = $("<input>").attr('type', 'text')
									.attr('name', 'reward');
				var tp = $("<span></span>").text('가격');
				var pr = $("<input>").attr('type', 'text')
									.attr('name', 'price');
				$("#inputReward").append(tr).append(rw)
								.append(tp).append(pr).append('<br>');
			}
		});
		$("#inputHashtag").on('change', "input[data-hash='ht']", function(){
			var last = $("input[data-hash='ht']").last();
			if($(last).is($(this))){
				var h = $("<input>").attr("type", 'text')
					.attr('data-hash', 'ht')
					.attr('name', 'hashtag');
				$("#inputHashtag").append(h).append("<br>");
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
		
		if(check < 1){
			alert("물품은 한가지 이상 입력하셔야 되욧");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h1>후원 신청서</h1>
	<form method="post" action="${pageContext.request.contextPath}/support/supportApplication" enctype="multipart/form-data" onsubmit="return appCommit()">
		<input type="text" name="id" value="#{sessionScope.id }" readonly="readonly"><br>
		제목<input type="text" name="title"><br>
		내용<textarea cols="50" rows="10" name="content"></textarea><br>
		목표금액<input type="text" name="price"><br>
		시작날짜<input type="date" name="sdate"><br>
		종료날짜<input type="date" name="edate"><br>
		카테고리
		<select name="category">
			   <option value="">선택</option>
			   <option value="1">질병</option>
			   <option value="2">동물</option>
			   <option value="3">교육</option>
		</select><br>
		주소 <input type="text" name="addr"><br>

		<span>해시태그</span>
		<label for="hashtag">#1</label><input type="checkbox" name="hashtag" value="n1">
		<label for="hashtag">#2</label><input type="checkbox" name="hashtag" value="n2">
		<label for="hashtag">#3</label><input type="checkbox" name="hashtag" value="n3">
		<br>
		<div id="inputHashtag">
			<input type="text" name="hashtag" data-hash="ht"><br>
		</div>
		
		
		 등록<br>
		<div id="inputSupport">
			<span>후원명</span><input type="text" name="reward">
			<span>후원단위금액</span><input type="text" name="price"><br>
		</div>
		
		<div id="inputFile">
			사진업로드<br>
			<input type="file" name="cPicture">
			<input type="text" name="cPinfo"><br>
		</div>
		<input type="submit" value="submit">
	</form>
</body>
</html>