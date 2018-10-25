<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>CherryFunding</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel-layers.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/skel.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style-wide.css" />
</noscript>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<!-- Wrapper -->
	<div class="wrapper style1">

		<!-- Header -->
		<div id="header" class="skel-panels-fixed">
			<div id="logo">
				<h1>
					<a href="${pageContext.request.contextPath}">CherryFunding</a>
				</h1>
				<span class="tag">by TEMPLATED</span>
			</div>
			<nav id="nav">
				<ul>
					<li class="active"><a href="/">Homepage</a></li>
					<li><a href="left-sidebar.html">Left Sidebar</a></li>
					<li><a href="right-sidebar.html">Right Sidebar</a></li>
					<li><a href="no-sidebar.html">No Sidebar</a></li>
				</ul>
			</nav>
		</div>

		<!-- Banner -->
		<div id="banner" class="container">
			<section>
				<p>
					안녕하세요 <strong>CherryFunding</strong>입니다.<br>
					자신의 제품을 크라우드펀딩하기 위해 펀딩신청하기를 눌러주세요.<br>
					<a href="http://templated.co">템플릿</a>
					<a href="http://twitter.com/templatedco">Twitter</a>.
				</p>
				<a href="${pageContext.request.contextPath}/funding/fundingApplication" class="button medium">펀딩신청하기</a>
			</section>
		</div>

		<!-- Extra -->
		<div id="extra">
			<div class="container"></div>
		</div>

		<!-- Main -->
		<div id="main">
			<div class="container">
			<div class="row no-collapse-1">
				<c:forEach var="vo" items="${list}" varStatus="vs">
				<section class="4u">
					<a href="#" class="image featured">
					<img src="${pageContext.request.contextPath}/resources/upload/${vo.savename}" alt="${vo.fpinfo}" height="200px"></a>
					<div class="box">
						<p>${vo.title}</p>
						<p>${vo.id}</p>
						<p>목표금액: ${vo.amount}</p>
						<p>현재금액: ${vo.camout}</p>
						
						<div class="progress">
						<c:set var="before" value="${vo.camout * 100 / vo.amount}"/>
							<div class="progress-bar" role="progressbar"
							 style="width: <fmt:formatNumber value="${before}" type="percent"/>" aria-valuenow="${before * 100}"
							  aria-valuemin="0" aria-valuemax="100"><fmt:formatNumber value="${before}" type="percent"/></div>
						</div>
					</div>
				</section>
			
				</c:forEach>
				</div>
				<div class="row">

					<!-- Content -->
					<div class="6u">
						<section>
							<ul class="style">
								<li class="fa fa-wrench">
									<h3>Integer ultrices</h3> <span>In posuere eleifend
										odio. Quisque semper augue mattis wisi. Maecenas ligula.
										Pellentesque viverra vulputate enim. Aliquam erat volutpat.
										Maecenas condimentum enim tincidunt risus accumsan.</span>
								</li>
								<li class="fa fa-leaf">
									<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
										Quisque semper augue mattis wisi. Maecenas ligula.
										Pellentesque viverra vulputate enim. Aliquam erat volutpat.
										Maecenas condimentum enim tincidunt risus accumsan.</span>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<ul class="style">
								<li class="fa fa-cogs">
									<h3>Integer ultrices</h3> <span>In posuere eleifend
										odio. Quisque semper augue mattis wisi. Maecenas ligula.
										Pellentesque viverra vulputate enim. Aliquam erat volutpat.
										Maecenas condimentum enim tincidunt risus accumsan.</span>
								</li>
								<li class="fa fa-road">
									<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
										Quisque semper augue mattis wisi. Maecenas ligula.
										Pellentesque viverra vulputate enim. Aliquam erat volutpat.
										Maecenas condimentum enim tincidunt risus accumsan.</span>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Footer -->
	<div id="footer" class="wrapper style2">
		<div class="container">
			<section>
				<header class="major">
					<h2>Mauris vulputate dolor</h2>
					<span class="byline">Integer sit amet pede vel arcu aliquet
						pretium</span>
				</header>
				<form method="post" action="#">
					<div class="row half">
						<div class="12u">
							<input class="text" type="text" name="name" id="name"
								placeholder="Name" />
						</div>
					</div>
					<div class="row half">
						<div class="12u">
							<input class="text" type="text" name="email" id="email"
								placeholder="Email" />
						</div>
					</div>
					<div class="row half">
						<div class="12u">
							<textarea name="message" id="message" placeholder="Message"></textarea>
						</div>
					</div>
					<div class="row half">
						<div class="12u">
							<ul class="actions">
								<li><input type="submit" value="Send Message"
									class="button alt" /></li>
							</ul>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- Copyright -->
	<div id="copyright">
		<div class="container">
			<div class="copyright">
				<p>
					Design: <a href="http://templated.co">TEMPLATED</a> Images: <a
						href="http://unsplash.com">Unsplash</a> (<a
						href="http://unsplash.com/cc0">CC0</a>)
				</p>
				<ul class="icons">
					<li><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
					<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
					<li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>