<%@page import="com.cherryfunding.spring.util.S3Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.a {
	text-indent: 2em;
	font-size: large;
	}
	.title{
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
</style>
<% 
	S3Util s3=new S3Util();
	String img1=s3.getFileURL("info/Crowdfunding2.jpg");
	String img2=s3.getFileURL("info/Crowdfunding3.png");
%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
		    
			<p class="title" style="font-size:xx-large;">크라우드 펀딩 :  대중이 만드는 새로운 금융문화</p>
			<p class="a">크라우드펀딩(Crowdfunding)이란, 단어가 주는 의미 그대로 Crowd + Funding 즉, 대중이 함께 만드는 기금이라는 의미이다. </p>
			<p class="a">자금을 필요로 하는 사람이 기존 금융 기관이나, 자금력이 풍부한 소수로부터 자금을 융통하는 형태가 아니라, </p>
			<p class="a">자금이 필요한 자신의 상황과 사연을 이야기하고 그 이야기에 공감하는 많은 사람들이 ‘꼭 이루어졌으면 좋겠다’는 마음으로 조금씩 기금을 마련하게 되는 것이다. </p>
			<img src="<%=img2 %>" width="700px" height="400px" align="middle" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 30px;">
			
			<p class="title" style="font-size:xx-large;">크라우드 펀딩 :  제품이 소비자에게 가는 과정을 바꾸다</p>
			<p class="a">아이디어를 제품으로 만드는 것은 어렵다. 하지만 그보다 더 어려운 것이 제품을 시장에 내놓고 소비자의 손까지 가도록 만드는 과정이다. 
			<p class="a">제품이 공장에서 대량으로 생산되기 위해서는 큰 자금이 필요하고, 생산을 진행한다고 해도 실제로 소비자들의 반응이 어떨지는 계산할 수 없다. 생산자에게는 이 과정이 너무나 큰 부담이다. </p>
			<p class="a">그래서 많은 생산자들이 제품 생산을 앞두고 크라우드 펀딩을 진행한다. 크라우드 펀딩을 통해 이들은 대중으로부터 자금을 받을 수 있을 뿐만 아니라, </p>
			<p class="a">시장성을 미리 평가해볼 수 있으며 덤으로 마케팅 효과까지 누릴 수 있다. </p>
 			<p class="a">이렇게 제품 생산자들의 부담을 크게 줄일 수 있는 새로운 방법이 된 크라우드 펀딩. 이로 인해 현재 킥스타터에서 제품 디자인은 현재 8,701개의 프로젝트가 운영될만큼 아주 인기 있는 분야가 되었다. </p>
 			<img src="<%=img1 %>" width="700px" height="400px" align="middle" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 30px;">
		</div>
	</div>
</div>
