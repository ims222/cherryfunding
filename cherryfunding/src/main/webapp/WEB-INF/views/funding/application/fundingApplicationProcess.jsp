<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#inputFile").on('change', "input[name='fPicture']", function(){
			var last = $("input[name='fPicture']").last();
			if($(last).is($(this))){
				var file = $("<input>").attr('type', 'file')
									.attr('name', 'fPicture');
				var text = $('<input>').attr('type', 'text')
									.attr('name', 'fPinfo');
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
				
				var ta = $("<span></span>").text("수량");
				var fa = $("<input>").attr("type", "number")
									.attr("name", "fAmount");
				
				$("#inputReward").append(tr).append(rw)
								.append(tp).append(pr)
								.append(ta).append(fa);
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
	<form method="post" action="${pageContext.request.contextPath}/funding/fundingApplication" enctype="multipart/form-data" onsubmit="return appCommit()">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"><br>
		
		<label for="content">내용</label><br>
		<textarea rows="5" cols="50" name="content" id="content"></textarea><br>
		
		<label for="amount">목표금액</label>
		<input type="number" name="amount" id="amount"><br>
		
		<label for="sDate">시작날짜</label>
		<input type="date" name="sDate" id="sDate"><br>
		<label for="eDate">종료날짜</label>
		<input type="date" name="eDate" id="eDate"><br>
		
		<label for="category">카테고리</label>
		<select name="category">
			<option value="테크·가전">테크·가전</option>
			<option value="패션·잡화">패션·잡화</option>
			<option value="뷰티">뷰티</option>
			<option value="푸드">푸드</option>
			<option value="홈리빙">홈리빙</option>
			<option value="디자인소품">디자인소품</option>
			<option value="여행·레저">여행·레저</option>
			<option value="스포츠·모빌리티">스포츠·모빌리티</option>
			<option value="반려동물">반려동물</option>
			<option value="공연·컬쳐">공연·컬쳐</option>
			<option value="소셜·캠페인">소셜·캠페인</option>
			<option value="교육·키즈">교육·키즈</option>
			<option value="게임·취미">게임·취미</option>
			<option value="출판">출판</option>
		</select>
		<br>
		
		
		<span>해시태그</span>
		<label for="hashtag">#1</label><input type="checkbox" name="hashtag" value="n1">
		<label for="hashtag">#2</label><input type="checkbox" name="hashtag" value="n2">
		<label for="hashtag">#3</label><input type="checkbox" name="hashtag" value="n3">
		<br>
		<div id="inputHashtag">
			<input type="text" name="hashtag" data-hash="ht"><br>
		</div>
		
		
		리워드 등록<br>
		<div id="inputReward">
			<span>리워드명</span><input type="text" name="reward">
			<span>가격</span><input type="text" name="price">
			<span>수량</span><input type="number" name="fAmount">
		</div>
		
		<div id="inputFile">
			사진업로드<br>
			<input type="file" name="fPicture">
			<input type="text" name="fPinfo"><br>
		</div>
		<input type="submit" value="제출">
	</form>
</body>
</html>