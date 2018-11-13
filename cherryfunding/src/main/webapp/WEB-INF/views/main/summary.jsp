<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main -->
<div id="main">
	<div class="container">
		<div>
			<div class="row">
				<!-- 요약 -->
				<div class="col-md-3">
					<p>전체 후원 갯수</p>
					<p>${summary.totCharity.CNT}</p>
					<p>전체 후원 금액</p>
					<p>${summary.totCharity.S}원</p>
					<br>
					<p>오늘 후원 갯수</p>
					<p>${summary.todayCharityCount}</p>
					<p>오늘 후원 금액</p>
					<p>${summary.todayCharityPrice}원</p>
				</div>
				<!-- 종료임박후원 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/charityList/detail?num=${summary.cEnd.cNum}">
					<img src="${summary.cEnd.savename}"	alt="${summary.cEnd.cpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a href="#">${summary.cEnd.title} 종료임박후원</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.cEnd.eDate}" var="cEndeDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cEndeDate}" var="cEndeDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cEndeDateDate.time / (1000 * 60 * 60 * 24)}" var="cEndEnd" integerOnly="true"/>
					
						<jsp:useBean id="cEndToday" class="java.util.Date"/>
						<fmt:formatDate value="${cEndToday}" var="cEndTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cEndTodayDate}" var="cEndNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cEndNowDate.time / (1000 * 60 * 60 * 24)}" var="cEndNow" integerOnly="true"/>
						
						<c:set var="cEndBefore" value="${summary.cEnd.cAmount * 100 / summary.cEnd.amount}" />
						<c:choose>
							<c:when test="${cEndBefore >= 1000}">
								<c:set var="barcEndBefore" value="100"/>
							</c:when>
							<c:otherwise>
								<c:set var="barcEndBefore" value="${barcEndBefore}" />
							</c:otherwise>
						</c:choose>
						<div>
							<div class="w3-left-align" style="float:left;">${summary.cEnd.category} | ${summary.cEnd.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barcEndBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${cEndBefore/100}" type="percent"/> · ${summary.cEnd.cAmount}원</div>
							<div class="w3-right-align">${cEndEnd - cEndNow}일 남음</div>
						</div>
					</div>
				</div>
				<!-- 주목할만한 후원 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.cHot.cNum}">
					<img src="${summary.cHot.savename}"	alt="${summary.cHot.cpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a href="#">${summary.cHot.title} 주목할만한 후원</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.cHot.eDate}" var="cHoteDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cHoteDate}" var="cHoteDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cHoteDateDate.time / (1000 * 60 * 60 * 24)}" var="cHotEnd" integerOnly="true"/>
						
						<jsp:useBean id="cHotToday" class="java.util.Date"/>
						<fmt:formatDate value="${cHotToday}" var="cHotTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cHotTodayDate}" var="cHotNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cHotNowDate.time / (1000 * 60 * 60 * 24)}" var="cHotNow" integerOnly="true"/>
	
						<c:set var="cHotBefore" value="${summary.cHot.cAmount * 100 / summary.cHot.amount}" />
						<c:choose>
							<c:when test="${cHotBefore >= 1000}">
								<c:set var="barcHotBefore" value="100"/>
							</c:when>
							<c:otherwise>
								<c:set var="barcHotBefore" value="${barcHotBefore}" />
							</c:otherwise>
						</c:choose>
	
						<div>
							<div class="w3-left-align" style="float:left;">${summary.cHot.category} | ${summary.cHot.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barcHotBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${cHotBefore/100}" type="percent"/> · ${summary.cHot.cAmount}원</div>
							<div class="w3-right-align">${cHotEnd - cHotNow}일 남음</div>
						</div>
					</div>
				</div>
				<!-- 참여금액이 높은 후원 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/fundingList/detail?num=${summary.cPrice.cNum}">
					<img src="${summary.cPrice.savename}"	alt="${summary.cPrice.cpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a href="#">${summary.cPrice.title} 참여금액이 높은 후원</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.cPrice.eDate}" var="cPriceeDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cPriceeDate}" var="cPriceeDateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cPriceeDateDate.time / (1000 * 60 * 60 * 24)}" var="cPriceEnd" integerOnly="true"/>
						
						<jsp:useBean id="cPriceToday" class="java.util.Date"/>
						<fmt:formatDate value="${cPriceToday}" var="cPriceTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${cPriceTodayDate}" var="cPriceNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${cPriceNowDate.time / (1000 * 60 * 60 * 24)}" var="cPriceNow" integerOnly="true"/>
	
						<c:set var="cPriceBefore" value="${summary.cPrice.cAmount * 100 / summary.cPrice.amount}" />
							<c:choose>
								<c:when test="${cPriceBefore >= 1000}">
									<c:set var="barcPriceBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barcPriceBefore" value="${cPriceBefore}" />
								</c:otherwise>
							</c:choose>
	
						<div>
							<div class="w3-left-align" style="float:left;">${summary.cPrice.category} | ${summary.cPrice.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barcPriceBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${cPriceBefore/100}" type="percent"/> · ${summary.cPrice.cAmount}원</div>
							<div class="w3-right-align">${cPriceEnd - cPriceNow}일 남음</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 요약 -->
				<div class="col-md-3">
					<p>전체 펀딩 갯수</p>
					<p>${summary.totFunding.CNT}</p>
					<p>전체 펀딩 금액</p>
					<p>${summary.totFunding.S}원</p>
					<br>
					<p>오늘 펀딩 갯수</p>
					<p>${summary.todayFundingCount}</p>
					<p>오늘 펀딩 금액</p>
					<p>${summary.todayFundingPrice}원</p>
				</div>
				<!-- 종료임박펀딩 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum=${summary.fEnd.fNum}">
					<img src="${summary.fEnd.savename}"	alt="${summary.fEnd.fpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a href="#">${summary.fEnd.title} 종료임박펀딩</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.fEnd.edate}" var="fEndEdate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fEndEdate}" var="fEndEdateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fEndEdateDate.time / (1000 * 60 * 60 * 24)}" var="fEndEnd" integerOnly="true"/>
						
						<jsp:useBean id="fEndToday" class="java.util.Date"/>
						<fmt:formatDate value="${fEndToday}" var="fEndTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fEndTodayDate}" var="fEndNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fEndNowDate.time / (1000 * 60 * 60 * 24)}" var="fEndNow" integerOnly="true"/>
						
						<c:set var="fEndBefore" value="${summary.fEnd.camout * 100 / summary.fEnd.amount}" />
							<c:choose>
								<c:when test="${fEndBefore >= 1000}">
									<c:set var="barfEndBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barfEndBefore" value="${fEndBefore}" />
								</c:otherwise>
							</c:choose>
		
						<div>
							<div class="w3-left-align" style="float:left;">${summary.fEnd.category} | ${summary.fEnd.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barfEndBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${fEndBefore/100}" type="percent"/> · ${summary.fEnd.camout}원</div>
							<div class="w3-right-align">${fEndEnd - fEndNow}일 남음</div>
						</div>
					</div>
				</div>
				<!-- 가장 많이 주목된 펀딩 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum=${summary.fHot.fNum}">
					<img src="${summary.fHot.savename}"	alt="${summary.fHot.fpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a>${summary.fHot.title} 가장 많이 주목된 펀딩</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.fHot.edate}" var="fHotEdate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fHotEdate}" var="fHotEdateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fHotEdateDate.time / (1000 * 60 * 60 * 24)}" var="fHotEnd" integerOnly="true"/>
						
						<jsp:useBean id="fHotToday" class="java.util.Date"/>
						<fmt:formatDate value="${fHotToday}" var="fHotTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fHotTodayDate}" var="fHotNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fHotNowDate.time / (1000 * 60 * 60 * 24)}" var="fHotNow" integerOnly="true"/>
						
						<c:set var="fHotBefore" value="${summary.fHot.camout * 100 / summary.fHot.amount}" />
							<c:choose>
								<c:when test="${fHotBefore >= 1000}">
									<c:set var="barfHotBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barfHotBefore" value="${fHotBefore}" />
								</c:otherwise>
							</c:choose>
		
						<div>
							<div class="w3-left-align" style="float:left;">${summary.fHot.category} | ${summary.fHot.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barfHotBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${fHotBefore/100}" type="percent"/> · ${summary.fHot.camout}원</div>
							<div class="w3-right-align">${fHotEnd - fHotNow}일 남음</div>
						</div>
					</div>
				</div>
				<!-- 참여금액이 제일 많은 펀딩 -->
				<div class="col-md-3">
					<a href="${pageContext.request.contextPath}/funding/ingFundingDetailforUser?fNum=${summary.fPrice.fNum}">
					<img src="${summary.fPrice.savename}"	alt="${summary.fPrice.fpinfo}" class="w3-round listImage"></a>
					<div>
						<div class="listTitle">
							<p class="w3-left-align">
								<a href="#">${summary.fPrice.title} 가장 많이 주목된 펀딩</a>
							</p>
						</div>
						<fmt:formatDate value="${summary.fPrice.edate}" var="fPriceEdate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fPriceEdate}" var="fPriceEdateDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fPriceEdateDate.time / (1000 * 60 * 60 * 24)}" var="fPriceEnd" integerOnly="true"/>
						
						<jsp:useBean id="fPriceToday" class="java.util.Date"/>
						<fmt:formatDate value="${fPriceToday}" var="fPriceTodayDate" pattern="yyyyMMdd"/>
						<fmt:parseDate value="${fPriceTodayDate}" var="fPriceNowDate" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${fPriceNowDate.time / (1000 * 60 * 60 * 24)}" var="fPriceNow" integerOnly="true"/>
						
						<c:set var="fPriceBefore" value="${summary.fPrice.camout * 100 / summary.fPrice.amount}" />
							<c:choose>
								<c:when test="${fPriceBefore >= 1000}">
									<c:set var="barfPriceBefore" value="100"/>
								</c:when>
								<c:otherwise>
									<c:set var="barfPriceBefore" value="${fPriceBefore}" />
								</c:otherwise>
							</c:choose>
		
						<div>
							<div class="w3-left-align" style="float:left;">${summary.fPrice.category} | ${summary.fPrice.id}</div>
							<div class="w3-right-align"><p>추천 <span class="w3-badge w3-green">{recomm}</span></p></div>
							<div class="w3-border">
								<div class="w3-blue" style="height:5px;width:${barfPriceBefore/100}"></div>
							</div>
							<div class="w3-left-align" style="float:left;"><fmt:formatNumber value="${fPriceBefore/100}" type="percent"/> · ${summary.fPrice.camout}원</div>
							<div class="w3-right-align">${fHotEnd - fHotNow}일 남음</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>