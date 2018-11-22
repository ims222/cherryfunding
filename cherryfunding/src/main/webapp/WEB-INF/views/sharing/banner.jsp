<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#welcome
	{
		overflow: hidden;
		padding: 2em 100px 0em 100px;
		text-align: center;
		color: #7D6774;
		background-color: #333;
	}
	
	#welcome .content
	{
		padding: 0em 8em;
	}
	
	#welcome .title h2
	{
		color: #C6C2C4;
	}
	
	#welcome a,
	#welcome strong
	{
		color: #C6C2C4;
	}
#menu
	{
	}
	
	#menu ul
	{
		display: inline-block;
		padding: 0em 2em;
		text-align: center;
	}
	
	#menu li
	{
		display: inline-block;
	}
	
	#menu li a, #menu li span
	{
		display: inline-block;
		padding: 1.3em 1.5em;
		text-decoration: none;
		font-size: 1em;
		font-weight: 200;
		text-transform: uppercase;
		outline: 0;
		color: #FFF;
	}
	
	#menu li:hover a, #menu li.active a, #menu li.active span
	{
		background: #912D56;
		border-radius: 50%;
	}
	
	#menu .current_page_item a
	{
		color: #FFF;
	}
</style>	
<!-- Banner -->
<div class="container">
	<div id="welcome">
	<h3>안녕하세요 <strong>CherryFunding</strong>입니다.<br></h3><h4>나눔글을 등록하시려면 아래 글쓰기 버튼을 눌러주세요</h4><br> 
		<div id="menu">
			<ul>
				<li><a href="http://templated.co" >템플릿</a></li>
				<li><a href="http://twitter.com/templatedco">트위터</a></li>
				<li><a href="${pageContext.request.contextPath}/sharing/insertSharing"
			class="button medium">글쓰기</a></li>
			</ul>
		</div>
	</div>	

	
</div>