<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.dropbtn {
	background-color: #3498DB;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd
}

.show {
	display: block;
}

.rSpan {
	display:table;
	float: left;
	margin-right: 10px;
	text-align: right;
	vertical-align: middle;
	height: 33px;
}
.rSpan span {
	display:table-cell;
	vertical-align: middle;
}

.rBtn {
	display: inline-block;
    position: relative;
	overflow: hidden;
	margin-left: -1px;
	float: left;
	width: 33px;
	height: 33px;
	border: 1px solid #ccc;
	background-color: #fff;
	vertical-align: middle;
}
.rBtn:hover {
	border-color: #666;
}
.rInput {
	vertical-align: middle;
	margin-left: -1px;
	float: left;
	height: 33px;
	width:41px;
    border: 1px solid #ccc;
    text-align: center;
    font-weight: bold;
}
</style>
<script id="selectedReward" type="text/template">
	<div class="w3-border">
		<input type="hidden" value="{rNum}">
		<div class="rSpan">
			<span>{title} (남은수량 {amount}개)</span>
		</div>
		
		<button class="rBtn">-</button>
		<input type="text" class="rInput" value="1">
		<button class="rBtn">+</button>
		<input type="text" class="rInput" value="{price}" style="width:100px;">
		<button class="rBtn">x</button>
	</div>
</script>

<script type="text/javascript">
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function rewardDetail(rNum){
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/rewardDetail',
			data:{rNum: rNum},
			dataType:'json',
			type:'post',
			success: function(data){
				var title = data.title;
				var price = data.price;
				var amount = data.amount;
				var rNum = data.rNum;
				//var reward = $('<div>').text("리워드명: " + title + " 가격: " + price + " 남은 수량: " + amount);
				var html = document.querySelector('#selectedReward').innerHTML;
				var result = "";
				
				result +=	html.replace("{title}", title)
							.replace("{price}", numberWithCommas(price))
							.replace("{amount}", amount)
							.replace("{rNum}", rNum);
				
				document.querySelector('#rewardInfo').innerHTML = result;
			}
		});
	}
	
	$(document).ready(function(){
		$('#myDropdown').on('click', 'a', function(){
			var rNum = $(this).attr('data-num'); 
			console.log($('#rewardInfo').find('.selectReward'));
			//$('#rewardInfo').find('.selectReward').forEach(function(value){
			//	if(rNum == value.attr('data-num'))
			//		return;
			//});
			rewardDetail(rNum);
		});
	});
</script>
<div class="container">
	<div class="dropdown">
		<button onclick="myFunction()" class="dropbtn">리워드 선택</button>
		<div id="myDropdown" class="dropdown-content">
			<c:forEach var="r" items="${rewardList}">
				<a href="#" data-num="${r.rNum}">${r.title}</a>
			</c:forEach>
		</div>
	</div>
	<div id="rewardInfo">
		<form method="post" action="">
			
		</form>
	</div>
</div>

