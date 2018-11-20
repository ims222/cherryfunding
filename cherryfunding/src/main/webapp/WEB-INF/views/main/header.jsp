<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.topnav2 {
    background-color: #333;
    overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav2 a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

/* Change the color of links on hover */
.topnav2 a:hover {
    background-color: #ddd;
    color: black;
}

/* Add an active class to highlight the current page */
.active2 {
    background-color: #4CAF50;
    color: white;
}

/* Hide the link that should open and close the topnav2 on small screens */
.topnav2 .icon {
    display: none;
}

@media screen and (max-width: 600px) {
  .topnav2 a:not(:first-child) {display: none;}
  .topnav2 a.icon {
    float: right;
    display: block;
  }
}

/* The "responsive" class is added to the topnav2 with JavaScript when the user clicks on the icon. This class makes the topnav2 look good on small screens (display the links vertically instead of horizontally) */
@media screen and (max-width: 600px) {
  .topnav2.responsive {position: relative;}
  .topnav2.responsive a.icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav2.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
<script>
function myFunction() {
    var x = document.getElementById("mytopnav2");
    if (x.className === "topnav2") {
        x.className += " responsive";
    } else {
        x.className = "topnav2";
    }
}
</script>
<div id="header" class="skel-panels-fixed container">
	<div class="topnav2" id="mytopnav2">
		<a data-voice="CherryFunding" class="active2" href="${pageContext.request.contextPath}/">CherryFunding</a>
		<a data-voice="후원" href="${pageContext.request.contextPath}/charity/ingCharityList"><i class='fas fa-seedling'></i> 후원</a>
		<a data-voice="펀딩" href="${pageContext.request.contextPath}/funding/ingFundingList"><i class='fas fa-piggy-bank'></i> 펀딩</a>
		<a data-voice="나눔" href="${pageContext.request.contextPath}/sharing/sharingList"><i class='fas fa-gift'></i> 나눔</a>
		<a data-voice="봉사" href="${pageContext.request.contextPath}/volunteer/volunteerList"><i class='fas fa-hand-holding-heart'></i> 봉사</a>
		<a data-voice="로그인" href="${pageContext.request.contextPath}/security/login"><i class='fas fa-hand-holding-heart'></i> 로그인</a>
		 <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
	</div>
</div>