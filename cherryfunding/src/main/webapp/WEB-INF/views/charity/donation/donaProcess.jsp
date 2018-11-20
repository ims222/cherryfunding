<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("input[name='dona']").on('keyup', inputAmount);
	
	$('.donaOk').on('click', function(){
		var donaPrice = parseInt($("input[name='dona']").val());
		var userAmount = parseInt(uncomma($('#userAmount').text()));
		var content = $("input[name='content']").val();
		if(userAmount < donaPrice){
			$('#alertBalance').text("잔액이 부족합니다.");
			return;
		}else{
			$('#alertBalance').text("");
		}
		$.ajax({
			url:'${pageContext.request.contextPath}/charity/donaProcess',
			data:{cNum:'${cNum}', donaPrice:donaPrice, content:content},
			dataType:'json',
			type:'post',
			success: function(data){
				if(data.result === 'ok'){
					location.href="${pageContext.request.contextPath}/charity/donaOk?cdNum=" + data.cdNum;
				}else{
					$('#alertBalance').text("후원에 실패 했습니다.");
				}
			}
		});
	});
});




function inputAmount(){
	var curAmount = parseInt($(this).val());
	$(this).val($(this).val().replace(/[^0-9]/g,""));
}
</script>
<style type="text/css">
	.nattr {
		text-align: center;
		font-size: 21px;
	}
	.inputType {
		font-size: 20px;
	}
</style>
<div id="main">
	<div class="container">
		<div class="w3-center">
			<div class="w3-large" style="margin: 30px 30px;">
			"기부자님의 소중한 마음으로 놀라운 변화가 일어납니다."<br>
			투명한 기부 후기로 그 변화를 소개하고 보답하겠습니다!
			</div>
			
			<div class="col-md-3"></div>
			<div class="col-md-6 w3-left-align" style="padding: 50px; border: 1px solid #ccc">
			
				<div class="col-md-4 w3-center">
					<span class="nattr">기부자명</span><br>
					<span class="nattr">잔액</span><br>
					<span class="nattr">후원금액</span><br>
					<span class="nattr">후원메시지</span><br>
				</div>
				<div class="col-md-8 w3-center inputType">
					${userInfo.nick}<br>
					<span id="userAmount"><fmt:formatNumber value="${userInfo.balance}" pattern="#,###"/>원</span><br>
					<input type="number" name="dona" value="1000" step="1000" style="text-align: center;"><br>
					<input type="text" name="content" value="희망을 응원합니다 ♡" style="text-align: center;">
					<span id="alertBalance"></span>
				</div>
					
					 
					 
					
					
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-12">
				<button type="button" class="w3-button w3-teal donaOk">확인</button>
			</div>
		</div>
		
		<div class="col-md-8">
			<button>이전 페이지</button>
		</div>
	</div>
</div>



