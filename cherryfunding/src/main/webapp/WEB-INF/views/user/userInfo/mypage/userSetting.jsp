<%@page import="com.cherryfunding.spring.vo.UserSettingVo"%>
<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>UserSetting.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>

/* 라디오버튼 */

label.btn span {
  font-size: 1.2em ;
}

label input[type="radio"] ~ i.fa.fa-circle-o{
    color: #c8c8c8;    display: inline;
}
label input[type="radio"] ~ i.fa.fa-dot-circle-o{
    display: none;
}
label input[type="radio"]:checked ~ i.fa.fa-circle-o{
    display: none;
}
label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o{
    color: #0000FF;    display: inline;
}
label:hover input[type="radio"] ~ i.fa {
color: #7AA3CC;
}

div[data-toggle="buttons"] label.active{
    color: #0000FF;
}

div[data-toggle="buttons"] label {
display: inline-block;
padding: 6px 12px;
margin-bottom: 0;
font-size: 14px;
font-weight: normal;
line-height: 2em;
text-align: left;
white-space: nowrap;
vertical-align: top;
cursor: pointer;
background-color: none;
border: 0px solid 
#c8c8c8;
border-radius: 3px;
color: #c8c8c8;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
-o-user-select: none;
user-select: none;
}

div[data-toggle="buttons"] label:hover {
color: #7AA3CC;
}

div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {
-webkit-box-shadow: none;
box-shadow: none;
}


/* 토글 

  .toggleBG1{background: #CCCCCC; width: 70px; height: 30px; border: 1px solid #CCCCCC; border-radius: 15px;}
  .toggleBG2{background: #CCCCCC; width: 70px; height: 30px; border: 1px solid #CCCCCC; border-radius: 15px;}
  .toggleFG{background: #FFFFFF; width: 30px; height: 30px; border: none; border-radius: 15px; position: relative; left: 0px;}
*/

* {box-sizing:border-box}
  .cmn-toggle {
    position: absolute;
    margin-left: -9999px;
    visibility: hidden;
  }
  .cmn-toggle + label {
    display: block;
    position: relative;
    cursor: pointer;
    outline: none;
    user-select: none;    
  }

  
  
  input.cmn-toggle-round-flat + label {
    padding: 2px;
    width: 52px;
    height: 21px;
    background-color:#b3b3b3;
    border-radius:13px;
    transition: background 0.4s;
  }
  
  
  input.cmn-toggle-round-flat + label:after {
    display: block;
    position: absolute; 
    content: "";
  }
  input.cmn-toggle-round-flat + label:after {
    top: 2px;
    left: 2px;
    bottom: 4px;
    width: 17px;
    height:17px;
    background-color: #fff;
    border-radius:50%;
    transition: margin 0.4s, background 0.4s;
    
  }
  /*
  input.cmn-toggle-round-flat + label:before {
    top: 2px;
    left: 2px;
    bottom: 2px;
    right: 2px;
    background-color:#b3b3b3;
    border-radius:50%;
    transition: background 0.4s;   
  }
  
  */
  input.cmn-toggle-round-flat:checked + label {
    background-color: #0000FF;    
  }
  input.cmn-toggle-round-flat:checked + label:after {
    margin-left: 32px;
    background-color: #fff;
  }

  input.cmn-toggle + label span:after {font-size:13px; font-weight:500; color:#fff}

  input.cmn-toggle + label span:after {display:block; position:absolute; top:1px; right:7px }
  input.cmn-toggle:checked + label span:after {display:block; position:absolute; top:1px; left:10px}
/* 테이블 */

.wrap{
	margin-left : 100px;
	margin-top : 50px;

}

table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 300px;
    padding: 10px;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
}
table.type04 p {
    font-size: 18px;
}
</style>
<script type="text/javascript">
	$(document).on('click','#toggle1',function(){
		if($('#toggle1').val()=='y'){
			$('#toggle1').val("n");
		}else{
			$('#toggle1').val("y");
		}
		console.log($("#toggle1").val());
	});
	
	$(document).on('click','#toggle2',function(){
		if($('#toggle2').val()=='y'){
			$('#toggle2').val("n");
		}else{
			$('#toggle2').val("y");
		}
		console.log($("#toggle2").val());
	});
	
	function updateSetting(){
		var lang=$("input:radio[name='lang']:checked").val();
		console.log(lang);
		var voice=$("#toggle1").val();
		var alarm=$("#toggle2").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/updateSettings',
			data: {id:"${sessionScope.id}",lang:lang,voice:voice,alarm:alarm},
			dataType: 'json',
			type: 'post'
		});
	}
</script>
<body>
<div class="wrap">
	<h2>환경설정</h2>
	<div>
	<p style="font-weight: bold;display: inline;font-size: 15px">${sessionScope.id}</p><p style="display: inline">님의 환경설정입니다</p>
	</div>
	<table class="type04">
		<tr>
		  <td>언어</td>
		  <td> 
		      <div class="btn-group" data-toggle="buttons" onchange="updateSetting()">
		        <label class="btn <c:if test="${vo.lang eq 'kor'}">active</c:if>">
		          <input type="radio" name='lang' value="kor" <c:if test="${vo.lang eq 'kor'}">checked</c:if>><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-check-circle-o fa-2x"></i>
		          <span>한국어</span>
		        </label>
		        <label class="btn <c:if test="${vo.lang eq 'eng'}">active</c:if>">
		          <input type="radio" name='lang' value="eng" <c:if test="${vo.lang eq 'eng'}">checked</c:if>><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-check-circle-o fa-2x"></i>
		          <span>English</span>
		        </label>
		        <label class="btn <c:if test="${vo.lang eq 'jap'}">active</c:if>">
		          <input type="radio" name='lang' value="jap" <c:if test="${vo.lang eq 'jap'}">checked</c:if>><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-check-circle-o fa-2x"></i>
		          <span>日本語</span>
		        </label>
      		   </div>
		  </td>
		</tr>
		<tr>
		  <td>음성지원</td>
		  <td>
			<div class="switch">
			   <input id="toggle1" class="cmn-toggle cmn-toggle-round-flat" type="checkbox" value="${vo.voice}" onchange="updateSetting()" <c:if test="${vo.voice eq 'y'}">checked</c:if>>
			   <label for="toggle1"><span></span></label>
			 </div>
		  </td>
		</tr>
		<tr>
		  <td>알람설정</td>
		  <td>
		   <div class="switch">
			   <input id="toggle2" class="cmn-toggle cmn-toggle-round-flat" type="checkbox" value="${vo.alarm}" onchange="updateSetting()" <c:if test="${vo.alarm eq 'y'}">checked</c:if>>
			   <label for="toggle2"><span></span></label>
			 </div>
		  </td>
		</tr>
	</table>
</div>
</body>
</html>