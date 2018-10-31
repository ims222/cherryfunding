<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main -->
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/charityList/detail?num=${summary.cEnd.cNum}" class="image featured">
					<img src="${pageContext.request.contextPath}/resources/upload/funding/${summary.cEnd.savename}"
					alt="${summary.cEnd.cpinfo}" height="200px"></a>
					<div class="box">
						<p>종료임박후원</p>
						<p>${summary.cEnd.title}</p>
						<p>${summary.cEnd.id}</p>
						<p>목표금액: ${summary.cEnd.amount}</p>
						<p>현재금액: ${summary.cEnd.cAmount}</p>
						
						<fmt:formatDate value="${summary.cEnd.eDate}" var="cEndeDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cEndeDate}" var="cEndeDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cEndeDateDate.time / (1000 * 60 * 60 * 24)}" var="cEndEnd" integerOnly="true"/>
						
						<jsp:useBean id="cEndToday" class="java.util.Date"/>
						<fmt:formatDate value="${cEndToday}" var="cEndTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cEndTodayDate}" var="cEndNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cEndNowDate.time / (1000 * 60 * 60 * 24)}" var="cEndNow" integerOnly="true"/>
						<p>D${cEndNow-cEndEnd}</p>
						<div class="progress">
							<c:set var="cEndBefore" value="${summary.cEnd.cAmount * 100 / summary.cEnd.amount}" />
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${cEndBefore}" type="percent"/>"
								aria-valuenow="${cEndBefore * 100}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${cEndBefore}" type="percent" />
							</div>
						</div>
					</div>
				</div>
					<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.cNew.cNum}" class="image featured">
					<img src="${pageContext.request.contextPath}/resources/upload/funding/${summary.cNew.savename}"
					alt="${summary.cNew.cpinfo}" height="200px"></a>
					<div class="box">
						<p>신규 후원</p>
						<p>${summary.cNew.title}</p>
						<p>${summary.cNew.id}</p>
						<p>목표금액: ${summary.cNew.amount}</p>
						<p>현재금액: ${summary.cNew.cAmount}</p>
					
						<fmt:formatDate value="${summary.cNew.sDate}" var="cNewsDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cNewsDate}" var="cNewsDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cNewsDateDate.time / (1000 * 60 * 60 * 24)}" var="cNewStart" integerOnly="true"/>
						
						<jsp:useBean id="cNewToday" class="java.util.Date"/>
						<fmt:formatDate value="${cNewToday}" var="cNewTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cNewTodayDate}" var="cNewNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cNewNowDate.time / (1000 * 60 * 60 * 24)}" var="cNewNow" integerOnly="true"/>
						<p>D${cNewNow - cNewStart}</p>
						<div class="progress">
							<c:set var="cNewBefore" value="${summary.cNew.cAmount * 100 / summary.cNew.amount}" />
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${cNewBefore}" type="percent"/>"
								aria-valuenow="${cNewBefore * 100}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${cNewBefore}" type="percent" />
							</div>
						</div>
					</div>
				</div>
					<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.cHot.cNum}" class="image featured">
					<img src="${pageContext.request.contextPath}/resources/upload/funding/${summary.cHot.savename}"
					alt="${summary.cHot.cpinfo}" height="200px"></a>
					<div class="box">
						<p>주목할만한 후원</p>
						<p>${summary.cHot.title}</p>
						<p>${summary.cHot.id}</p>
						<p>목표금액: ${summary.cHot.amount}</p>
						<p>현재금액: ${summary.cHot.cAmount}</p>
					
						<fmt:formatDate value="${summary.cHot.eDate}" var="cHoteDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cHoteDate}" var="cHoteDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cHoteDateDate.time / (1000 * 60 * 60 * 24)}" var="cHotEnd" integerOnly="true"/>
						
						<jsp:useBean id="cHotToday" class="java.util.Date"/>
						<fmt:formatDate value="${cHotToday}" var="cHotTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cHotTodayDate}" var="cHotNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cHotNowDate.time / (1000 * 60 * 60 * 24)}" var="cHotNow" integerOnly="true"/>
						<p>D${cHotNow-cHotEnd}</p>
						<div class="progress">
							<c:set var="cHotBefore" value="${summary.cHot.cAmount * 100 / summary.cHot.amount}" />
							<div class="progress-bar" role="progressbar"
								style="width: <fmt:formatNumber value="${cHotBefore}" type="percent"/>"
								aria-valuenow="${cHotBefore * 100}" aria-valuemin="0"
								aria-valuemax="100">
								<fmt:formatNumber value="${cHotBefore}" type="percent" />
							</div>
						</div>
					</div>
				</div>
					<div class="col-md-3">
						<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.cPrice.cNum}" class="image featured">
						<img src="${pageContext.request.contextPath}/resources/upload/funding/${summary.cPrice.savename}"
						alt="${summary.cPrice.cpinfo}" height="200px"></a>
						<div class="box">
							<p>참여금액이 높은 후원</p>
							<p>${summary.cPrice.title}</p>
							<p>${summary.cPrice.id}</p>
							<p>목표금액: ${summary.cPrice.amount}</p>
							<p>현재금액: ${summary.cPrice.cAmount}</p>
						
							<fmt:formatDate value="${summary.cPrice.eDate}" var="cPriceeDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${cPriceeDate}" var="cPriceeDateDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${cPriceeDateDate.time / (1000 * 60 * 60 * 24)}" var="cPriceEnd" integerOnly="true"/>
							
							<jsp:useBean id="cPriceToday" class="java.util.Date"/>
							<fmt:formatDate value="${cPriceToday}" var="cPriceTodayDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${cPriceTodayDate}" var="cPriceNowDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${cPriceNowDate.time / (1000 * 60 * 60 * 24)}" var="cPriceNow" integerOnly="true"/>
							<p>D${cPriceNow-cPriceEnd}</p>
							<div class="progress">
								<c:set var="cPriceBefore" value="${summary.cPrice.cAmount * 100 / summary.cPrice.amount}" />
								<div class="progress-bar" role="progressbar"
									style="width: <fmt:formatNumber value="${cPriceBefore}" type="percent"/>"
									aria-valuenow="${cPriceBefore * 100}" aria-valuemin="0"
									aria-valuemax="100">
									<fmt:formatNumber value="${cPriceBefore}" type="percent" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.fEnd.fnum}" class="image featured">
						<img src="${summary.fEnd.savename}"
						alt="${summary.fEnd.fpinfo}" height="200px"></a>
						<div class="box">
							<p>종료임박펀딩</p>
							<p>${summary.fEnd.title}</p>
							<p>${summary.fEnd.id}</p>
							<p>목표금액: ${summary.fEnd.amount}</p>
							<p>현재금액: ${summary.fEnd.camout}</p>
						
							<fmt:formatDate value="${summary.fEnd.edate}" var="fEndEdate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fEndEdate}" var="fEndEdateDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fEndEdateDate.time / (1000 * 60 * 60 * 24)}" var="fEndEnd" integerOnly="true"/>
							
							<jsp:useBean id="fEndToday" class="java.util.Date"/>
							<fmt:formatDate value="${fEndToday}" var="fEndTodayDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fEndTodayDate}" var="fEndNowDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fEndNowDate.time / (1000 * 60 * 60 * 24)}" var="fEndNow" integerOnly="true"/>
							<p>D${fEndNow-fEndEnd}</p>
							<div class="progress">
								<c:set var="fEndBefore" value="${summary.fEnd.camout * 100 / summary.fEnd.amount}" />
								<div class="progress-bar" role="progressbar"
									style="width: <fmt:formatNumber value="${fEndBefore}" type="percent"/>"
									aria-valuenow="${fEndBefore * 100}" aria-valuemin="0"
									aria-valuemax="100">
									<fmt:formatNumber value="${fEndBefore}" type="percent" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.fNew.fnum}" class="image featured">
						<img src="${summary.fNew.savename}"
						alt="${summary.fNew.fpinfo}" height="200px"></a>
						<div class="box">
							<p>새로 시작되는 펀딩</p>
							<p>${summary.fNew.title}</p>
							<p>${summary.fNew.id}</p>
							<p>목표금액: ${summary.fNew.amount}</p>
							<p>현재금액: ${summary.fNew.camout}</p>
						
							<fmt:formatDate value="${summary.fNew.sdate}" var="fNewSdate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fNewSdate}" var="fNewSdateDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fNewSdateDate.time / (1000 * 60 * 60 * 24)}" var="fNewStart" integerOnly="true"/>
							
							<jsp:useBean id="fNewToday" class="java.util.Date"/>
							<fmt:formatDate value="${fNewToday}" var="fNewTodayDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fNewTodayDate}" var="fNewNowDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fNewNowDate.time / (1000 * 60 * 60 * 24)}" var="fNewNow" integerOnly="true"/>
							<p>D${fNewNow - fNewStart}</p>
							<div class="progress">
								<c:set var="fNewBefore" value="${summary.fNew.camout * 100 / summary.fNew.amount}" />
								<div class="progress-bar" role="progressbar"
									style="width: <fmt:formatNumber value="${fNewBefore}" type="percent"/>"
									aria-valuenow="${fNewBefore * 100}" aria-valuemin="0"
									aria-valuemax="100">
									<fmt:formatNumber value="${fNewBefore}" type="percent" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.fHot.fnum}" class="image featured">
						<img src="${summary.fHot.savename}"
						alt="${summary.fHot.fpinfo}" height="200px"></a>
						<div class="box">
							<p>가장 많이 주목된 펀딩</p>
							<p>${summary.fHot.title}</p>
							<p>${summary.fHot.id}</p>
							<p>목표금액: ${summary.fHot.amount}</p>
							<p>현재금액: ${summary.fHot.camout}</p>
						
							<fmt:formatDate value="${summary.fHot.edate}" var="fHotEdate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fHotEdate}" var="fHotEdateDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fHotEdateDate.time / (1000 * 60 * 60 * 24)}" var="fHotEnd" integerOnly="true"/>
							
							<jsp:useBean id="fHotToday" class="java.util.Date"/>
							<fmt:formatDate value="${fHotToday}" var="fHotTodayDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fHotTodayDate}" var="fHotNowDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fHotNowDate.time / (1000 * 60 * 60 * 24)}" var="fHotNow" integerOnly="true"/>
							<p>D${fHotNow-fHotEnd}</p>
							<div class="progress">
								<c:set var="fHotBefore" value="${summary.fHot.camout * 100 / summary.fHot.amount}" />
								<div class="progress-bar" role="progressbar"
									style="width: <fmt:formatNumber value="${fHotBefore}" type="percent"/>"
									aria-valuenow="${fHotBefore * 100}" aria-valuemin="0"
									aria-valuemax="100">
									<fmt:formatNumber value="${fHotBefore}" type="percent" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.fPrice.fnum}" class="image featured">
						<img src="${summary.fPrice.savename}"
						alt="${summary.fPrice.fpinfo}" height="200px"></a>
						<div class="box">
							<p>참여금액이 제일 많은 펀딩</p>
							<p>${summary.fPrice.title}</p>
							<p>${summary.fPrice.id}</p>
							<p>목표금액: ${summary.fPrice.amount}</p>
							<p>현재금액: ${summary.fPrice.camout}</p>
						
							<fmt:formatDate value="${summary.fPrice.edate}" var="fPriceEdate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fPriceEdate}" var="fPriceEdateDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fPriceEdateDate.time / (1000 * 60 * 60 * 24)}" var="fPriceEnd" integerOnly="true"/>
							
							<jsp:useBean id="fPriceToday" class="java.util.Date"/>
							<fmt:formatDate value="${fPriceToday}" var="fPriceTodayDate" pattern="yyyyMMdd"/>
							<fmt:parseDate value="${fPriceTodayDate}" var="fPriceNowDate" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${fPriceNowDate.time / (1000 * 60 * 60 * 24)}" var="fPriceNow" integerOnly="true"/>
							<p>D${fPriceNow-fPriceEnd}</p>
							<div class="progress">
								<c:set var="fPriceBefore" value="${summary.fPrice.camout * 100 / summary.fPrice.amount}" />
								<div class="progress-bar" role="progressbar"
									style="width: <fmt:formatNumber value="${fPriceBefore}" type="percent"/>"
									aria-valuenow="${fPriceBefore * 100}" aria-valuemin="0"
									aria-valuemax="100">
									<fmt:formatNumber value="${fPriceBefore}" type="percent" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="box">
					<form method="post" action="${pageContext.request.contextPath}/testlogin">
						<c:choose>
							<c:when test="${not empty sessionScope.id}">
								${sessionScope.id} 님 <a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
								<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/testlogout'">
							</c:when>
							<c:otherwise>
								<input type="text" name="id" placeholder="아이디"><br>
								<input type="text" name="pwd" placeholder="비밀번호">
								<input type="submit" value="로그인">	
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				<div class="box">
					<p>전체 펀딩 갯수</p>
					<p>${summary.totFunding.CNT}</p>
					<p>전체 펀딩 금액</p>
					<p>${summary.totFunding.S}</p>
					<br>
					<p>오늘 펀딩 갯수</p>
					<p>${summary.todayFunding.CNT}</p>
					<p>오늘 펀딩 금액</p>
					<p>${summary.todayFunding.S}</p>
					<br>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- Content -->
		<div class="6u">
			<section>
				<ul class="style">
					<li class="fa fa-wrench">
						<h3>Integer ultrices</h3> <span>In posuere eleifend odio.
							Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
							viverra vulputate enim. Aliquam erat volutpat. Maecenas
							condimentum enim tincidunt risus accumsan.</span>
					</li>
					<li class="fa fa-leaf">
						<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
							Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
							viverra vulputate enim. Aliquam erat volutpat. Maecenas
							condimentum enim tincidunt risus accumsan.</span>
					</li>
				</ul>
			</section>
		</div>
		<div class="6u">
			<section>
				<ul class="style">
					<li class="fa fa-cogs">
						<h3>Integer ultrices</h3> <span>In posuere eleifend odio.
							Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
							viverra vulputate enim. Aliquam erat volutpat. Maecenas
							condimentum enim tincidunt risus accumsan.</span>
					</li>
					<li class="fa fa-road">
						<h3>Aliquam luctus</h3> <span>In posuere eleifend odio.
							Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque
							viverra vulputate enim. Aliquam erat volutpat. Maecenas
							condimentum enim tincidunt risus accumsan.</span>
					</li>
				</ul>
			</section>
		</div>
	</div>
