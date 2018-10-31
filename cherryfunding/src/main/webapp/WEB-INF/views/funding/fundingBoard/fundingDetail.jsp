<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundingDetail.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="https://html2canvas.hertzen.com/build/html2canvas.js"></script>
</head>
<body>
	<h2>상세글 보기</h2>
	ddd
	<table border="1" width="500">
		<tr><td>글번호</td><td>${vo.fnum }</td><tr>
		<tr><td>제목</td><td>${vo.title }</td></tr>
		<tr><td>내용</td><td>${vo.content }</td></tr>
		<tr><td>목표금액</td><td>${vo.amount }</td></tr>
		<tr><td>현재금액</td><td>${vo.camout }</td></tr>
		<tr><td>시작일</td><td>${vo.sdate }</td></tr>
		<tr><td>종료일</td><td>${vo.edate }</td></tr>
		<tr><td>카테고리</td><td>${vo.category }</td></tr>
		<tr><td>승인구분</td><td>${vo.confirm }</td></tr>
		<tr><td>승인자</td><td>${vo.aid }</td></tr>
		<tr><td>주소</td><td>${vo.addr }</td></tr>
		<tr><td>등록일</td><td>${vo.regdate }</td></tr>
		<tr><td>아이디</td><td>${vo.id }</td></tr>
		<tr><td>조회수</td><td>${vo.hit }</td></tr>
		<tr>
		  <td>
		  <a href="<c:url value='/fundingList/update?num=${vo.fnum }'/>">수정</a>
		  <a href="<c:url value='/fundingList/delete?num=${vo.fnum }'/>">삭제</a>
		  </td>
		</tr>
	</table>
	<h2>첨부 이미지</h2>
	<table border="1">
	<tr>
	<c:forEach var="vo" items="${list }">
	<td>${vo.fpNum}</td>
	<td>${vo.orgname}</td>
	<td><img src="${pageContext.request.contextPath}/resources/upload/funding/${vo.savename}" height="170px"></td>
	</c:forEach>
	</tr>
	</table>
<br>
이미지 끌어와서 편집하기
<br>
<!-- <button id="edit" class="btn btn-primary" onclick="edit()" type="button">편집</button> -->
<button id="save" class="btn btn-primary" onclick="fileEdit()" type="button">수정완료</button>
<!-- <button id="save" class="btn btn-primary" onclick="fileSave()" type="button">저장</button> -->
<div id="summernote"><p><br></p></div>
	<script type="text/javascript">
	$(function() {
	  var $placeholder = $('.placeholder');
	  $('#summernote').summernote({
	    height: 300,
	    codemirror: {
	      mode: 'text/html',
	      htmlMode: true,
	      lineNumbers: true,
	      theme: 'monokai'
	    },
	    callbacks: {
	      onInit: function() {
	        $placeholder.show();
	      },
	      onFocus: function() {
	        $placeholder.hide();
	      },
	      onBlur: function() {
	        var $self = $(this);
	        setTimeout(function() {
	          if ($self.summernote('isEmpty') && !$self.summernote('codeview.isActivated')) {
	            $placeholder.show();
	          }
	        }, 300);
	      }
	    }
	  });
	});
	//var edit = function() {
		  //$('#summernote').summernote({focus: true});	//편집창으로 돌아가기
		//};
	function fileEdit() {
		var val=document.getElementById('summernote');
		var markupStr = $('#summernote').summernote('code');
		$("#space").append(markupStr);
	}
	function fileSave(file,el){
		//var newVal=document.getElementById('space');
		//alert(newVal.innerHTML);
		var formData = new FormData();
		formData.append('file', file);	//orgFilename이 file안에 들어가있어야함
		alert(file);
		//console.log('formData', formData);
		$.ajax({
			data: formData,
			type: 'post',
			url:'${pageContext.request.contextPath}/insertImg',	//이미지파일 저장 
			cache: false,
			contentType: false,
			encType: 'multipart/form-data',
			processData: false,
			success: function(url){
				alert('${pageContext.request.contextPath}/'+ url);
				//$(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+ url);
				//$summernote.summernote('insertNode', imgNode);
			}
		});
		
	}	

	</script>
<form onsubmit="fileSave()" enctype="multipart/form-data" method="post">
		<div id="space"></div>
		<input type="submit" value="저장">
</form>
</body>
</html>