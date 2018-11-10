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
ul {
	list-style: none;
}

#rewardInfo li {
	text-align: right;
    list-style-position: inside;
    float: right;
	clear: both;
}
</style>
<script id="selectedReward" type="text/template">
<li>
	<div class="selectedReward w3-container">
		<input type="hidden" name="rNum" value="{rNum}">
		<input type="hidden" name="price" value="{price}">
		<div class="rSpan">
			<span data-amount="{amount}">{title} (남은수량 {amount}개)</span>
		</div>
		
		<button class="rBtn decreaseAmount">-</button>
		<input type="text" class="rInput inputAmount" name="amount" value="1">
		<button class="rBtn increaseAmount">+</button>
		<input type="text" class="rInput totPrice" value="{price}" name="totPrice" style="width:100px; margin-left:10px;" readOnly="readOnly">
		<button class="rBtn" style="margin-left: 10px;">x</button>
	</div>
</li>
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
				var html = document.querySelector('#selectedReward').innerHTML;
				var result = "";
				
				result +=	html.replace("{title}", title)
							.replace(/{price}/gi, numberWithCommas(price))
							.replace(/{amount}/gi, amount)
							.replace("{rNum}", rNum);
				$('#rewardList').append(result);
			}
		});
	}
	
	function increaseAmount(e){
		var target = e.target;
		var curAmount = parseInt($(e.target).siblings("input[name='amount']").val());
		var limit = parseInt($(e.target).siblings(".rSpan").children('span').attr("data-amount"));
		if(limit === curAmount)
			return;
			
		var incAmount = curAmount + 1;
		var price = parseInt($(e.target).siblings("input[name='price']").val());
		$(target).siblings("input[name='amount']").val(incAmount);
		$(target).siblings("input[name='totPrice']").val(numberWithCommas((incAmount * price) + ""));
	}
	function decreaseAmount(e){
		var target = e.target;
		var curAmount = parseInt($(e.target).siblings("input[name='amount']").val());
		if(curAmount === 1)
			return;
		var incAmount = curAmount - 1;
		var price = parseInt($(e.target).siblings("input[name='price']").val());
		$(target).siblings("input[name='amount']").val(incAmount);
		$(target).siblings("input[name='totPrice']").val(numberWithCommas((incAmount * price) + ""));
	}
	
	function inputAmount(e){
		var curAmount = parseInt($(e.target).val());
		var price = parseInt($(e.target).siblings("input[name='price']").val());
		var limit = parseInt($(e.target).siblings(".rSpan").children('span').attr("data-amount"));
		if(e.keyCode < 48 || 57 < e.keyCode || e.keyCode != 8) {
			if(isNaN(curAmount)){
				$(e.target).siblings("input[name='totPrice']").val(0);
				return;
			}
			$(e.target).val(curAmount);
		}
		if(limit < curAmount){
			$(e.target).val(limit);
		}
		$(e.target).siblings("input[name='totPrice']").val(numberWithCommas((curAmount * price) + ""));
	}
	
	
	$(document).ready(function(){
		$('#myDropdown').on('click', 'a', function(){
			var rNum = $(this).attr('data-num');
			var a = $(".selectedReward>input[name='rNum']");
			for(var i = 0; i<a.length;i++){
				if(rNum == $(a[i]).val()){
					return;
				}
			}
			rewardDetail(rNum);
		});
		
		$('#rewardInfo').on('click', '.increaseAmount', increaseAmount);
		$('#rewardInfo').on('click', '.decreaseAmount', decreaseAmount);
		$('#rewardInfo').on('keyup', '.inputAmount', inputAmount);
	});
</script>
<div class="container w3-border">
	<div class="w3-border">
		<div class="dropdown">
			<button onclick="myFunction()" class="dropbtn">리워드 선택</button>
			<div id="myDropdown" class="dropdown-content">
				<c:forEach var="r" items="${rewardList}">
					<a href="#" data-num="${r.rNum}">${r.title}</a>
				</c:forEach>
			</div>
		</div>
		<div id="rewardInfo">
			<ul id="rewardList">
				
			</ul>
		</div>
		<div style="clear:both;">
			결제하신 금액은 별도 수수료 없이 펀딩을 진행하는 펀더에게 100% 전달됩니다.
		</div>
		<div>
			<button>펀딩 참여하기</button>
		</div>
	</div>
</div>

