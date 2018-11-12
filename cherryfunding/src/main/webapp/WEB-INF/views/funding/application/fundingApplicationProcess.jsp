<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/fine-uploader/fine-uploader-new.min.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/fine-uploader/fine-uploader.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/datepicker/datepicker.min.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/datepicker/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/datepicker/datepicker.en.js"></script>
<script type="text/javascript">
	$.fn.datepicker.language['en'] = {
	    days: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    daysShort: ['일', '월', '화', '수', '목', '금', '토'],
	    daysMin: ['일', '월', '화', '수', '목', '금', '토'],
	    months: ['1월','2월','3월','4월','5월','6월', '7월','8월','9월','10월','11월','12월'],
	    monthsShort: ['1','2','3','4','5','6', '7','8','9','10','11','12'],
	    today: '오늘',
	    clear: 'Clear',
	    dateFormat: 'yyyy/mm/dd',
	    timeFormat: 'hh:ii aa',
	    firstDay: 0,
	    navTitles: {
			days: '<i>yyyy</i> MM'
		}
	};

	$(document).ready(
			function() {
				$("#inputFile").on(
						'change',
						"input[name='fPicture']",
						function() {
							var last = $("input[name='fPicture']").last();
							if ($(last).is($(this))) {
								var file = $("<input>").attr('type', 'file')
										.attr('name', 'fPicture');
								var text = $('<input>').attr('type', 'text')
										.attr('name', 'fPinfo');
								$("#inputFile").append(file).append(text)
										.append('<br>');
							}

						});
				$("#inputReward").on(
						'change',
						"input[name='price']",
						function() {
							var last = $("input[name='price']").last();
							if ($(last).is($(this))) {
								var tr = $("<span></span>").text("리워드명");
								var rw = $("<input>").attr('type', 'text')
										.attr('name', 'reward');
								var tp = $("<span></span>").text('가격');
								var pr = $("<input>").attr('type', 'text')
										.attr('name', 'price');

								var ta = $("<span></span>").text("수량");
								var fa = $("<input>").attr("type", "number")
										.attr("name", "fAmount");

								$("#inputReward").append(tr).append(rw).append(
										tp).append(pr).append(ta).append(fa);
							}
						});
				$("#inputHashtag").on(
						'change',
						"input[data-hash='ht']",
						function() {
							var last = $("input[data-hash='ht']").last();
							if ($(last).is($(this))) {
								var h = $("<input>").attr("type", 'text').attr(
										'data-hash', 'ht').attr('name',
										'hashtag');
								$("#inputHashtag").append(h).append("<br>");
							}
						});

			});
	function appCommit() {
		//if(!$("#title").val()){
		// alert("제목을 입력해주세욧");
		// return false;
		//}
		//if(!$("#content").val()){
		//	alert("내용을 입력해주세욧");
		//	 return false;
		//}
		//if(!$("#amount").val()){
		//	alert("목표금액을 설정하세욧");
		//	return false;
		//}
		if (!$("#sdate").val()) {
			alert("시작일자를 선택하세요");
			return false;
		}
		if (!$("#edate").val()) {
			alert("종료일자를 선택하세요");
			return false;
		}

		var sd = new Date($("#sdate").val());
		var ed = new Date($("#edate").val());
		if (sd.getTime() > ed.getTime()) {
			alert("시작보다 종료를 더 먼저 입력했어여");
			return false;
		}

		var r = $("input[name='reward']");
		var ind = $("input[name='reward']").length;
		var check = 0;
		for (var i = 0; i < ind; i++) {
			if ($(r[i]).val()) {
				check++;
			}
		}
		if (check < 1) {
			alert("물품은 한가지 이상 입력하셔야 되욧");
			return false;
		}
		return true;
	}
</script>
<script type="text/template" id="qq-template-gallery">
     <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="buttons">
                <div class="qq-upload-button-selector qq-upload-button">
                    <div>Select files</div>
                </div>
                <button type="button" id="trigger-upload" class="qq-upload-button-selector qq-upload-button">
                    <i class="icon-upload icon-white"></i> Upload
                </button>
            </div>
            <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
                    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
					<input class="caption">
                </li>
            </ul>

            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Close</button>
                </div>
            </dialog>

            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">No</button>
                    <button type="button" class="qq-ok-button-selector">Yes</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Cancel</button>
                    <button type="button" class="qq-ok-button-selector">Ok</button>
                </div>
            </dialog>
        </div>
</script>
</head>
<style>
#qq-template-gallery {
	color: white;
	background-color: #00ABC7;
	font-size: 14px;
	padding: 7px 20px;
	background-image: none;
}

#qq-template-gallery .qq-upload-button {
	margin-right: 15px;
}

#qq-template-gallery .buttons {
	width: 36%;
}

#qq-template-gallery .qq-uploader .qq-total-progress-bar-container {
	width: 60%;
}
</style>
<div class="container">
	<form method="post" action="${pageContext.request.contextPath}/funding/fundingApplication" enctype="multipart/form-data" onsubmit="return appCommit()">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<label for="title">제목</label>
		<input type="text" name="title" id="title" value="${fvo.title}" placeholder="제목을 입력하세요">
		<span><form:errors path="fvo.title" /></span><br>
		<label for="content">내용</label><br>
		<textarea rows="5" cols="50" name="content" id="content" placeholder="내용을 입력하세요">${fvo.content}</textarea>
		<span><form:errors path="fvo.content" /></span><br>
		<label for="amount">목표금액</label>
		<input type="number" name="amount" id="amount" value="1000" min="1000" step="1000">
		<span><form:errors path="fvo.amount" /></span><br>
		
		
		<input type="text" name="dateRange" data-range="true" data-multiple-dates-separator=" - " data-language="en" class="datepicker-here"/>
		
		
		<label for="sdate">시작날짜</label>
		<input type="date" name="sdate" id="sdate" value="${fvo.sdate}"><span></span><br>
		<label for="edate">종료날짜</label>
		<input type="date" name="edate" id="edate" value="${fvo.edate}"><span></span><br>
		<label for="category">카테고리</label>
		<select name="category">
			<option value="테크·가전">테크·가전</option>
			<option value="패션·잡화">패션·잡화</option>
			<option value="뷰티">뷰티</option>
			<option value="푸드">푸드</option>
			<option value="홈리빙">홈리빙</option>
			<option value="디자인소품">디자인소품</option>
			<option value="여행·레저">여행·레저</option>
			<option value="스포츠·모빌리티">스포츠·모빌리티</option>
			<option value="반려동물">반려동물</option>
			<option value="공연·컬쳐">공연·컬쳐</option>
			<option value="소셜·캠페인">소셜·캠페인</option>
			<option value="교육·키즈">교육·키즈</option>
			<option value="게임·취미">게임·취미</option>
			<option value="출판">출판</option>
		</select><br>
		 해시태그<br>
		<input type="checkbox" name="hashtag" value="테크·가전" id="tech"><label for="tech">#테크·가전&nbsp</label>
		<input type="checkbox" name="hashtag" value="패션·잡화" id="fashion"><label for="fashion">#패션·잡화&nbsp</label>
		<input type="checkbox" name="hashtag" value="뷰티" id="beauty"><label for="beauty">#뷰티&nbsp</label>
		<input type="checkbox" name="hashtag" value="푸드" id="food"><label for="food">#푸드&nbsp</label>
		<input type="checkbox" name="hashtag" value="홈리빙" = id="homeliving"><label for="homeliving">#홈리빙&nbsp</label>
		<input type="checkbox" name="hashtag" value="디자인소품" id="design"><label for="design">#디자인소품&nbsp</label>
		<input type="checkbox" name="hashtag" value="여행·레저" id="tour"><label for="tour">#여행·레저&nbsp</label>
		<input type="checkbox" name="hashtag" value="스포츠·모빌리티" id="sports"><label for="sports">#스포츠·모빌리티&nbsp</label>
		<input type="checkbox" name="hashtag" value="반려동물" id="animal"><label for="animal">#반려동물&nbsp</label>
		<input type="checkbox" name="hashtag" value="공연·컬쳐" id="culture"><label for="culture">#공연·컬쳐&nbsp</label>
		<input type="checkbox" name="hashtag" value="소셜·캠페인" id="social"><label for="social">#소셜·캠페인&nbsp</label>
		<input type="checkbox" name="hashtag" value="교육·키즈" id="education"><label for="education">#교육·키즈&nbsp</label>
		<input type="checkbox" name="hashtag" value="게임·취미" id="game"><label for="game">#게임·취미&nbsp</label>
		<input type="checkbox" name="hashtag" value="출판" id="book"><label for="book">#출판&nbsp</label><br>
		<div id="inputHashtag">
			<input type="text" name="hashtag" data-hash="ht"><br>
		</div>

		리워드 등록<br>
		<div id="inputReward">
			<span>리워드명</span><input type="text" name="reward"> <span>가격</span><input
				type="text" name="price"> <span>수량</span><input
				type="number" name="fAmount">
		</div>

		<div id="inputFile">
			사진업로드<br> <input type="file" name="fPicture"> <input
				type="text" name="fPinfo"><br>
		</div>
		<input type="submit" value="제출">
	</form>
	<div id="fine-uploader-gallery"></div>
	<script>
		var galleryUploader = new qq.FineUploader(
				{
					autoUpload : false,
					element : document.getElementById("fine-uploader-gallery"),
					template : 'qq-template-gallery',
					request : {
						endpoint : '${pageContext.request.contextPath}/imgUpload'
					},
					thumbnails : {
						placeholders : {
							waitingPath : '${pageContext.request.contextPath}/resources/css/fine-uploader/placeholders/waiting-generic.png',
							notAvailablePath : '${pageContext.request.contextPath}/resources/css/fine-uploader/placeholders/not_available-generic.png'
						}
					},
					validation : {
						allowedExtensions : [ 'jpeg', 'jpg', 'gif', 'png' ]
					},
					callbacks : {
						onUpload : function(id) {
							var fileContainer = this.getItemByFileId(id);
							var captionInput = fileContainer.querySelector('.caption');
							var captionText = captionInput.value;

							this.setParams({
								caption : captionText
							}, id);
							//$(caoptionText).attr('readOny', 'readOnly');
						}
					}
				});
		qq(document.getElementById("trigger-upload")).attach("click", function() {
			galleryUploader.uploadStoredFiles();
        });
	</script>
</div>