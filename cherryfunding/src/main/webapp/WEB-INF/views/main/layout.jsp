<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE HTML>
<html>
<head>
<title>CherryFunding</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel-layers.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/skel.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style-wide.css" />
</noscript>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<script src="http://code.responsivevoice.org/responsivevoice.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//responsiveVoice.setDefaultVoice("Korean Female");
		//responsiveVoice.speak("안녕하세요");
		
		$('body').on('keyup', function(e){
			if(e.keyCode === 9){
				var target = $(e.target);
				var text = target.text();
				if($(target).attr('class') === 'image featured'){
					text = $(target).find('img').attr('alt');
				}
				//responsiveVoice.speak(text);		
			}
		});
	});

</script>
</head>
<body>

	<!-- Wrapper -->
	<div class="wrapper style1">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="banner" />
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>