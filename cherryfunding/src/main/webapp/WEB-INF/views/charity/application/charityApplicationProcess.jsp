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
	/* 
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
	*/
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/charity/charityApplication" enctype="multipart/form-data" onsubmit="return appCommit()">
		작성자 <input type="text" name="id" value="${sessionScope.id }" readonly="readonly"><br>
		제목<input type="text" name="title"><br>
		내용<textarea cols="50" rows="10" name="content"></textarea><br>
		목표금액<input type="text" name="price"><br>
		시작날짜<input type="date" name="sdate"><br>
		종료날짜<input type="date" name="edate"><br>
		카테고리
		<select name="category">
			   <option value="">선택</option>
			   <option value="아동·청소년">아동·청소년</option>
			   <option value="어르신">어르신</option>
			   <option value="다문화">다문화</option>
			   <option value="장애인">장애인</option>
			   <option value="사회운동">사회운동</option>
			   <option value="동물">동물</option>
			   <option value="환경">환경</option>
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
		<div id="inputCharity">
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