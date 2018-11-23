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

ul {
	list-style: none;
}

#rewardInfo li {
	text-align: right;
    list-style-position: inside;
    margin-bottom: 15px;
    float: right;
	clear: both;
}
.table > tbody > tr > td {
     vertical-align: middle;
}
</style>
<script id="selectedReward" type="text/template">
<li>
	<div class="selectedReward w3-container">
		<input type="hidden" name="rNum" value="{rNum}">
		<input type="hidden" name="price" value="{orgPrice}">
		<div class="rSpan">
			<span data-amount="{amount}">{title} (남은수량 {amount}개)</span>
		</div>
		
		<button class="rBtn decreaseAmount"><i class="fas fa-minus"></i></button>
		<input type="text" class="rInput inputAmount" name="amount" value="{currentAmount}">
		<button class="rBtn increaseAmount"><i class="fas fa-plus"></i></button>
		<input type="text" class="rInput totPrice" value="{price}" name="totPrice" style="width:100px; margin-left:10px;" readOnly="readOnly">
		<button class="rBtn removeReward" style="margin-left: 10px;"><i class="fa fa-remove"></i></button>
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
				var currentAmount = 0;
				if(amount > 0)
					currentAmount = 1;
				result +=	html.replace("{title}", title)
							.replace("{orgPrice}", price)
							.replace(/{price}/gi, comma(price))
							.replace(/{amount}/gi, amount)
							.replace("{currentAmount}", currentAmount)
							.replace("{rNum}", rNum);
				$('#rewardList').append(result);
				var totPrice = parseInt(uncomma($('#totPrice').text()));
				$('#totPrice').text(comma(price + totPrice));
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
		$(target).siblings("input[name='totPrice']").val(comma((incAmount * price) + ""));
		totPrice();
	}
	function decreaseAmount(e){
		var target = e.target;
		var curAmount = parseInt($(e.target).siblings("input[name='amount']").val());
		if(curAmount <= 1){
			return;
		}
		var incAmount = curAmount - 1;
		var price = parseInt($(e.target).siblings("input[name='price']").val());
		$(target).siblings("input[name='amount']").val(incAmount);
		$(target).siblings("input[name='totPrice']").val(comma((incAmount * price) + ""));
		totPrice();
	}
	
	function inputAmount(){
		var curAmount = parseInt($(this).val());
		var price = $(this).siblings("input[name='price']").val();
		var limit = parseInt($(this).siblings(".rSpan").children('span').attr("data-amount"));
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		
		if(isNaN(curAmount)){
			$(this).val(0);
			curAmount = 0;
		}
		
		if(limit < curAmount) { //초과 검사
			$(this).val(limit);
			curAmount = limit;
		}
		$(this).siblings("input[name='totPrice']").val(comma((curAmount * price) + ""));
		totPrice();
	}
	
	function totPrice(){
		var select = $('.selectedReward');
		var totPrice = 0;
		for(let i = 0; i<select.length; i++){
			var price = parseInt($(select[i]).find("input[name='price']").val());
			var amount = parseInt($(select[i]).find("input[name='amount']").val());
			
			totPrice += (price * amount);
		}
		$('#totPrice').text(comma(totPrice));
	}
	
	function removeReward(){
		$(this).closest('li').remove();
		totPrice();
	}
	
	
	$(document).ready(function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/getRewardList',
			data:{fNum:'${vo.fNum}'},
			dataType:'json',
			type:'post',
			success: function(data){
				for(var i=0;i< data.length; i++){
					rewardDetail(data[i].rNum);
				}
			}
		});
		
		
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
		$('#rewardInfo').on('click', '.removeReward', removeReward);
		$('#getUserInfo').on('click', function(){
			$.ajax({
				url:'${pageContext.request.contextPath}/funding/getUserInfo',
				dataType:'json',
				type:'post',
				success: function(data){
					
					$('#nick').text(data.nick);
					$('#balance').text(comma(data.balance) + " 원");
					var totPrice = uncomma($('#totPrice').text());
					$('#paymentAmount').text(comma(totPrice) + " 원");
					
					var afterBalance = parseInt(data.balance) - parseInt(totPrice);
					$('#afterBalance').text(comma(afterBalance) + " 원");
					$('#pDate').text(formatDate(new Date()));
					
					$('#userInfo').fadeIn();
				}
			});
		});
		$('#applicationReward').on('click', function(){
			var select = $('.selectedReward');
			if(select.length === 0){
				alert('리워드를 선택하세요');
				return;
			}
			var obj = new Object();
			obj.id='${sessionScope.id}';
			var arr = new Array();
			for(var i = 0; i< select.length; i++) {
				var o = new Object();
				o.rNum = $(select[i]).find("input[name='rNum']").val();
				o.price = $(select[i]).find("input[name='price']").val();
				o.amount = $(select[i]).find("input[name='amount']").val();
				arr.push(o);
			}
			obj.reward = arr;
			$.ajax({
				url:'${pageContext.request.contextPath}/funding/applicationReward',
				data:{fNum:'${fNum}', reward:JSON.stringify(obj)},
				dataType:'json',
				type:'post',
				success: function(data){
					if(data.result === 'ok'){
						console.log('reward', data.reward);
						var r = data.reward;
						
						var form = document.createElement("form");
					    form.setAttribute("method", "POST");
					    form.setAttribute("action", "${pageContext.request.contextPath}/funding/rewardOk");
					    
					    for(var i=0;i<r.length;i++){
							
							var hiddenField1 = document.createElement("input");
				            hiddenField1.setAttribute("type", "hidden");
				            hiddenField1.setAttribute("name", 'rNum');
				            hiddenField1.setAttribute("value", r[i].rNum);
				            form.appendChild(hiddenField1);
				            
				            var hiddenField2 = document.createElement("input");
				            hiddenField2.setAttribute("type", "hidden");
				            hiddenField2.setAttribute("name", 'price');
				            hiddenField2.setAttribute("value", r[i].price);
				            form.appendChild(hiddenField2);
				            
				            var hiddenField3 = document.createElement("input");
				            hiddenField3.setAttribute("type", "hidden");
				            hiddenField3.setAttribute("name", 'amount');
				            hiddenField3.setAttribute("value", r[i].amount);
				            form.appendChild(hiddenField3);
						}

					    document.body.appendChild(form);
					    form.submit();
					}else if(data.result === 'amountOver')
						alert('수량이 부족합니다');
					else if(data.result === 'wrongId')
						alert('로그인이 필요한 서비스입니다');
					else
						alert('리워드 신청 실패');
				}
			});
		});
	});
</script>
<div class="container w3-border">
	<div class="container w3-border">
		<!-- 
		<div class="dropdown">
			<button onclick="myFunction()" class="dropbtn">리워드 선택</button>
			<div id="myDropdown" class="dropdown-content">
				<c:forEach var="r" items="${rewardList}">
					<a href="#" data-num="${r.rNum}">${r.title}</a>
				</c:forEach>
			</div>
		</div>
		-->
		<div id="rewardInfo">
			<ul id="rewardList">
				
			</ul>
		</div>
		<div style="clear:both;">
			<div class="w3-right-align" style="padding: 20px">
				<span class="w3-xlarge">총 결제금액</span>
				<strong class="w3-xlarge" id="totPrice">0</strong>
				<span class="w3-xlarge">원</span>
			</div>
			<div class="w3-center w3-border-top" style="padding: 10px">
				<span class="w3-large">결제하신 금액은 별도 수수료 없이 펀딩을 진행하는 펀더에게 100% 전달됩니다.</span>
			</div>
			<div>
				<button id="getUserInfo" class="w3-btn w3-block w3-teal">펀딩 참여하기</button>
			</div>
		</div>
		<div id="userInfo" style="display:none; margin-top: 10px;">
			<table class="table">
				<tbody>
					<tr>
						<th>닉네임 </th> 
							<td><span id="nick"></span></td>
					</tr>
					<tr>
						<th>잔액 </th> 
							<td><span id="balance"></span></td>
					</tr>
					<tr>
						<th>결제액 </th> 
							<td><span id="paymentAmount"></span></td>
					</tr>
					<tr>
						<th>결제 후 잔액 </th> 
							<td><span id="afterBalance"></span></td>
					</tr>
					<tr>
						<th>결제일 </th> 
							<td><span id="pDate"></span></td>
					</tr>
				</tbody>
			</table>
		<div class="w3-center w3-border-top" style="padding: 10px">
			<span class="w3-large">위의 내용대로 결제를 계속 진행하시려면 결제 버튼을 눌러주세요.</span>
		</div>	
		<button id="applicationReward" class="w3-btn w3-block w3-teal">결제</button>
		</div>
	</div>
</div>

