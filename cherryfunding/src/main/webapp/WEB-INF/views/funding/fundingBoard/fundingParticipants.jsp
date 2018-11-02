<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/fundingParticipants',
			data:{fNum:'${fNum}'},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(Object.keys(data));
				for(var n in data){
					console.log(data[n]);
					var fDetail = data[n];
					for(var i=0;i<fDetail.length;i++){
						$('body').append('fdNum: ' + fDetail[i].fdNum + ', id: ' + fDetail[i].id + ', fNum: ' + fDetail[i].fNum + '<br>');	
					}
				}
			}
		});
	});
</script>
<body>


</body>
</html>