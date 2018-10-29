<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<script>
	
	$(document).ready(function(){
		$('#summernote').summernote({
			placeholder: 'Hello bootstrap 4',
			tabsize: 2,
			height: 500,
			callbacks: {
				onImageUpload: function(files, editor, welEditable){
					alert("온이미지");
					for(var i=files.length - 1; i >=0; i--){
						sendFile(files[i], this);
					}
				}
			}
		});
		
		$("#btn").on('click', function(){
			var markupStr = $('#summernote').summernote('code');
			$("#space").append(markupStr);
		});
	});
	function sendFile(file, el){
		alert("sendfile");
		var formData = new FormData();
		formData.append('file', file);
		alert(formData);
		console.log('formData', formData);
		$.ajax({
			data: formData,
			type: 'post',
			url:'${pageContext.request.contextPath}/insertImg',
			cache: false,
			contentType: false,
			encType: 'multipart/form-data',
			processData: false,
			success: function(url){
				alert('${pageContext.request.contextPath}/'+ url);
				$(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+ url);
				//$summernote.summernote('insertNode', imgNode);
			}
		});
		
	}
</script>





<body>
	<h1>cicadas</h1>
	
	${sessionScope.id} <br>
	<form method="post" action="/insertImg">
		<div id="summernote"></div>
	</form>
<button id="btn">머문</button>
<div id="space"></div>


<form method="post" action="${pageContext.request.contextPath}/imgUpload" enctype="multipart/form-data">
	<input type="file" name="file"><br>
	<input type="file" name="file"><br>
	<input type="file" name="file"><br>
	<input type="file" name="file"><br>
	<input type="file" name="file"><br>
	<input type="submit" value="submit">
</form>
</body>
</html>