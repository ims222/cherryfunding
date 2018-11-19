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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout2.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/responsiveVoice/responsiveVoice.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		if('${sessionScope.id}'){
			var voice = '${sessionScope.setting.voice}';
			console.log('welcomeVoice', window.welcomeVoice);
			if(voice === 'y' && typeof window.welcomeVoice == "undefined") {
				responsiveVoice.setDefaultVoice("Korean Female");
				//responsiveVoice.speak("안녕하세요");
				window.welcomeVoice = "complete";
			}
		}
		
	
		$('body').on('keyup', function(e){ // 음성
			var voice = '${sessionScope.setting.voice}';
			if(e.keyCode === 9 && voice === 'y'){
				var $target = $(e.target);
				if (typeof $target.attr('data-voice') == "undefined"){
					return;
				}else{
					responsiveVoice.speak($target.attr('data-voice'));
				}
					
			}
		});
		
		
		
	    $(window).scroll(function(){
	        if ($(this).scrollTop() > 200) {
	            $('#scroll').fadeIn(); 
	        } else { 
	            $('#scroll').fadeOut(); 
	        } 
	    }); 
	    $('#scroll').click(function(){ 
	        $("html, body").animate({ scrollTop: 0 }, 600); 
	        return false; 
	    });
	});
</script>
</head>
<body>
	<!-- Wrapper -->
	<div class="w3-container">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="banner" />
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />
	</div>
	<a href="#" data-voice="상단으로" id="scroll" style="display: none;"><span></span></a>
</body>
</html>