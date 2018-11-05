<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="https://html2canvas.hertzen.com/build/html2canvas.js"></script>
</head>
<body>
	<table border="1">
		<tr>
			<th>펀딩번호</th>
			<th>제목</th>
			<th>목표금액</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>카테고리</th>
			<th>승인구분</th>
			<th>승인자</th>
			<th>신청일</th>
			<th>신청자</th>
		</tr>
		<tr>
			<td>${vo.fNum}</td>	
			<td id="title">${vo.title}<button class="btn btn-primary" onclick="updateFunding('title')">수정</button></td>
			<td id="amount">${vo.amount}<button class="btn btn-primary" onclick="updateFunding('amount')">수정</button></td>
			<td id="sdate">${vo.sdate}</td>
			<td id="edate">${vo.edate}</td>
			<td id="category">${vo.category}<button class="btn btn-primary" onclick="updateFunding('category')">수정</button></td>
			<td>${vo.confirm}</td>
			<td id="aid">${vo.aid}<button class="btn btn-primary" onclick="updateFunding('aid')">수정</button></td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
		</tr>
	</table>
		<h2>첨부 이미지</h2>
	<table border="1">
	<tr>
	<c:forEach var="vo" items="${fPictureList}">
	<td>${vo.fpNum}</td>
	<td>${vo.orgname}</td>
	<td><img src="${vo.savename}" height="170px"></td>
	</c:forEach>
	</tr>
	</table>
<br>
이미지 끌어와서 편집하기
<br>
<button class="btn btn-primary" onclick="edit()">edit</button>
<button class="btn btn-primary" onclick="save()">save</button>
<div id="summernote">${vo.content}</div>
	<script type="text/javascript">
		$(function() {
			$('#summernote').summernote({
			disableDragAndDrop: true,
	    	height: 300,
			codemirror: {
				mode: 'text/html',
				htmlMode: true,
				lineNumbers: true,
				theme: 'monokai'
			}
		});
	});
	var edit = function() {
		$('#summernote').summernote({focus: true});
	};

	var save = function() {
		var markup = $('#summernote').summernote('code');
		$('#summernote').summernote('destroy');
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/editContent',
			data:{fNum:'${vo.fNum}', content:markup},
			dataType:'json',
			type:'post',
			success: function(data){
				alert('저장 했어요');
			}
		});
	};
	var updateFunding = function(col){
		var val = prompt("수정할 " + col + " 입력", '');
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/editContent',
			data:{ [col] : val, fNum:'${vo.fNum}'},
			dataType:'json',
			type:'post',
			success: function(data){
				//$('#' + col).html("");
				var btn = $('<button></button>').attr('class', 'btn btn-primary')
												.attr('onclick', "updateFunding('"+ col +"')")
												.text('수정');
					
				$('#' + col).text(data[col]).append(btn);
			}
		});
	};
		
		
	var fileSave = function() {
		$('#space').empty();
		alert($('#summernote').summernote('code'));
	};

	</script>
	<form onsubmit="fileSave()" enctype="multipart/form-data" method="post">
		<div id="space"></div>
		<input type="submit" value="저장">
	</form>	
</body>
</html>