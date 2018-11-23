<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-ko-KR.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7"></script>
<link href="${pageContext.request.contextPath}/resources/css/summernote/summernote.css" type="text/css" rel="stylesheet">
<style type="text/css">
#fundingInfo {
	font-size: 15px;
}

/* Slideshow container */
.slideshow-container {
  max-width: 800px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

.mySlides img{
	height: 450px;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade0 {
  -webkit-animation-name: fade0;
  -webkit-animation-duration: 1.5s;
  animation-name: fade0;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade0 {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade0 {
  from {opacity: .4} 
  to {opacity: 1}
}
</style>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {
	  slideIndex = 1
  } 
  if (n < 1) {
	  slideIndex = slides.length
  }
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
 $(slides[slideIndex-1]).css('display', 'block');
 $(dots[slideIndex-1]).addClass('active');
}
</script>
<div class="container">
	<table class="table">
		<tr> 
			<th scope="col" width="9%;">펀딩번호</th>
			<th scope="col" width="20%;">제목</th>
			<th scope="col" width="10%;">목표금액</th>
			<th scope="col" width="8%;">시작일자</th>
			<th scope="col" width="8%;">종료일자</th>
			<th scope="col" width="10%;">카테고리</th>
			<th scope="col" width="9%;">승인구분</th>
			<th scope="col" width="10%;">승인자</th>
			<th scope="col" width="8%;">신청일</th>
			<th scope="col" width="8%;">신청자</th> 
		</tr>
		<tr>
			<td scope="row">${vo.fNum}</td>	
			<td id="title">${vo.title}<button class="btn btn-primary" onclick="updateFunding('title')">수정</button></td>
			<td id="amount">${vo.amount}<button class="btn btn-primary" onclick="updateFunding('amount')">수정</button></td>
			<td id="sdate">${vo.sdate}</td>
			<td id="edate">${vo.edate}</td>
			<td id="category">${vo.category}<button class="btn btn-primary" onclick="updateFunding('category')">수정</button></td>
			<td>${vo.confirm}</td>
			<td id="aid">${vo.aid}<button class="btn btn-primary" onclick="updateFunding('aid')">수정</button></td>
			<td>${vo.regdate}</td>
			<td>${vo.id}</td>
		</tr>
	</table>
	
	<!-- Slideshow container -->
<div class="slideshow-container">

	<c:forEach var="vo" items="${fPictureList}" varStatus="vs">
		<div class="mySlides fade0" <c:if test="${vs.first}">style="display:block;"</c:if>>
		    <div class="numbertext">${vs.count} / ${fn:length(fPictureList)}</div>
		    <img src="${vo.savename}" style="width:100%">
			<div class="text">${vo.fpinfo}</div>
  		</div>
	</c:forEach>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
	<c:forEach var="vo" items="${fPictureList}" varStatus="vs">
		 <span class="dot <c:if test="${vs.first}">active</c:if>" onclick="currentSlide(${vs.count})"></span> 
	</c:forEach>
</div>
	
	
<button class="btn btn-primary" onclick="edit()">edit</button>
<button class="btn btn-primary" onclick="save()">save</button>
<div id="summernote">${vo.content}</div>
	<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			lang: 'ko-KR',
			disableDragAndDrop: true, 
	    	height: 500,
			codemirror: {
				mode: 'text/html',
				htmlMode: true,
				lineNumbers: true,
				theme: 'monokai'
			}
		});
	});
	var edit = function() {
		$('#summernote').summernote({focus: true});
	};

	var save = function() {
		var markup = $('#summernote').summernote('code');
		$('#summernote').summernote('destroy');
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/editContent',
			data:{fNum:'${vo.fNum}', content:markup},
			dataType:'json',
			type:'post',
			success: function(data){
				//alert('저장 완료');
				swal({
				  type: 'success',
				  title: 'Your work has been saved',
				  showConfirmButton: false,
				  timer: 1500
				})
			}
		});
	};
	var updateFunding = function(col){
		var val = prompt("수정할 " + col + " 입력", '');
		
		console.log('col', col);
		$.ajax({
			url:'${pageContext.request.contextPath}/funding/editContent',
			data:{ [col]:val, fNum:'${vo.fNum}'},
			dataType:'json',
			type:'post',
			success: function(data){
				var btn = $('<button></button>').attr('class', 'btn btn-primary')
												.attr('onclick', "updateFunding('"+ col +"')")
												.text('수정');
					
				$('#' + col).text(data[col]).append(btn);
			}
		});
	};
	</script>
</div>
