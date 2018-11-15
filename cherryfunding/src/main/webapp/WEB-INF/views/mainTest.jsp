<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testMain.css" type="text/css">
<Script id="sliderTemplate" type="text/template">
<div class="slide flex">
<div class="slide-image slider-link next">
	<img src="{savename}">
	<div class="overlay"></div>
</div>
<div class="slide-content">
	<div class="slide-date">30.09.2017.</div>
	<div class="slide-title">LOREM IPSUM DOLOR SITE MATE, AD EST ABHORREANT</div>
	<div class="slide-text">Lorem ipsum dolor sit amet, ad est
		abhorreant efficiantur, vero oporteat apeirian in vel. Et appareat
		electram appellantur est. Ei nec duis invenire. Cu mel ipsum
		laoreet, per rebum omittam ex.</div>
	<div class="slide-more">READ MORE</div>
</div>
</div>
</Script>
<script type="text/javascript">
	$(document).ready(function(){
		showMore();
	});
var showMore = function(){
	var pageNum = $('#pageNum').val();
	var category = $('#category').val();
	var sort = $('#sort').val();
	var keyword = $('#keyword').val();
	var field = $('#field').val();
		$.ajax({
		url:'${pageContext.request.contextPath}/funding/moreIngFundingList',
		data:{pageNum:pageNum, category:category, sort:sort, keyword:keyword, field:field},
		dataType:'json',
		type:'post',
		success:function(data){
			var result = $('#list').html(); 
			var html = document.querySelector('#sliderTemplate').innerHTML;
			if(data.list === 'no'){
				alert('마지막 페이지 입니다');
			}else{
				data.list.forEach(function(value){
					var camout = parseInt(value.CAMOUT);
					var amount = parseInt(value.AMOUNT);
					var before = Math.ceil((camout * 100) / amount);
					if(isNaN(before))
						before = 0;
					var barBefore = 0;
					if(before >= 100)
						barBefore = 100;
					else
						barBefore = before;
					result += html.replace("{savename}", value.savename);
					
					//result +=	html.replace(/{fNum}/gi, value.FNUM)
					//			.replace("{savename}", value.savename)
					//			.replace("{fpinfo}", value.fpinfo)
					//			.replace("{title}", value.TITLE)
					//			.replace("{nick}", value.nick)
					//			.replace("{amount}", amount)
					//			.replace("{camout}", camout)
					//			.replace("{category}", value.CATEGORY)
					//			.replace("{sdate}", value.SDATE)
					//			.replace("{edate}", value.EDATE)
					//			.replace("{recomm}", value.recomm)
					//			.replace("{dday}", value.DDAY)
					//			.replace(/{width}/gi, (barBefore) + "%" )
					//			.replace("{valuenow}", barBefore)
					//			.replace(/{percent}/gi, ((before/100) * 100) + "%"); 
				});
				document.querySelector('#mainSlider').innerHTML = result;
			}
		}
	});	
}
</script>
</head>
<body>
<div class="slider">
	<div class="slider-wrapper flex" id="mainSlider"></div>
</div>
<div class="arrows">
<a href="#" title="Previous" class="arrow slider-link prev"></a>
<a href="#" title="Next" class="arrow slider-link next"></a>
</div>
<script src="${pageContext.request.contextPath}/resources/js/testMain.js"></script>
</body>
</html>