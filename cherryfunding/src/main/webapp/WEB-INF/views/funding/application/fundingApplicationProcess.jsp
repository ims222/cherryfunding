<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/datepicker/datepicker.min.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/datepicker/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/datepicker/datepicker.en.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fine-uploader/fine-uploader.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/fine-uploader/fine-uploader-new.min.css" type="text/css" rel="stylesheet">
<style>
		.row {
		  display: -ms-flexbox; /* IE10 */
		  display: flex;
		  -ms-flex-wrap: wrap; /* IE10 */
		  flex-wrap: wrap;
		  margin: 0 -16px;
		}
		
		.col-25 {
		  -ms-flex: 25%; /* IE10 */
		  flex: 25%;
		}
		
		.col-50 {
		  -ms-flex: 50%; /* IE10 */
		  flex: 50%;
		}
		
		.col-75 {
		  -ms-flex: 75%; /* IE10 */
		  flex: 75%;
		}
		
		.col-25,
		.col-50,
		.col-75 {
		  padding: 0 16px;
		}
		
		.container {
		  background-color: #FFFFFF;
		  padding: 5px 20px 15px 20px;
		  border: 1px solid lightgrey;
		  border-radius: 3px;
		}
		
		input[type=text] {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		input[type=number] {
		  width: 50%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		input[type=date] {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		input[name="dateRange"] {
		  width: 60%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		textarea{
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		label {
		  margin-top: 10px;
		  margin-bottom: 10px;
		  display: block;
		}
		
		label.current {
		  margin-bottom: 10px;
		  margin-top: 10px;
		  display: inline;
		}
		
		span {
		  display: block;
		}
		
		.icon-container {
		  margin-bottom: 20px;
		  padding: 7px 0;
		  font-size: 24px;
		}
		
		.btn {
		  background-color: #088A85;
		  color: white;
		  padding: 12px;
		  margin: 10px 0;
		  border: none;
		  width: 100%;
		  border-radius: 3px;
		  cursor: pointer;
		  font-size: 17px;
		}
		
		.btn:hover {
		    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
		}
		
		.AddBtn {
			display: inline;
			position: relative;
			overflow: hidden;
			margin-left: -1px;
			float: left;
			min-width: 33px;
			height: 33px;
			border: 1px solid #ccc;
			background-color: #fff;
			vertical-align: middle;
		}
		
		span.price {
		  float: right;
		  color: grey;
		}
		.checks {position: relative;} .checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0 } .checks input[type="checkbox"] + label { display: inline-block; position: relative; padding-left: 30px; /* 글자와 체크박스 사이의 간격을 변경 */ cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; } .checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ content: ''; position: absolute; left: 0; top: -4px; /* 이 값을 변경해서 글자와의 정렬 */ width: 21px; /* 체크박스의 너비를 지정 */ height: 21px; /* 체크박스의 높이를 지정 */ line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ text-align: center; background: #fafafa; border: 1px solid #cacece; border-radius : 3px; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } .checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } .checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ content: '\2714'; /* 체크표시 유니코드 사용 */ color: #99a1a7; text-shadow: 1px 1px #fff; background: #e9ecee; border-color: #adb8c0; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }
	
		@media (max-width: 800px) {
		  .row {
		    flex-direction: column-reverse;
		  }
		  .col-25 {
		    margin-bottom: 20px;
		  }
		}
		select {
		  margin-bottom: 1em;
		  padding: .25em;
		  font-weight: bold;
		  letter-spacing: .15em;
		  border-radius: 0;
  			}
  		.MyButton {
	        background-color: #009999;
		    border: none;
		    color: white;
		    padding: 1px 7px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 25px;
		    margin: 4px 2px;
		    cursor: pointer;
		    font-size: 15px;
		}
}

</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7"></script>
<script type="text/javascript">

	var index = 0;
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
				$.ajax({
					url:'${pageContext.request.contextPath}/funding/getFnum',
					dataType:'json',
					type:'post',
					success: function(data){
						$("input[name='fNum']").val(data);
					}
				});
				
				
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
				
				$(document).on('focusout', "input[name='amount']", function(){
					var hundred = 100;
					var price = parseInt($(this).val());
					$(this).val(Math.floor(price/hundred) * hundred);
				})

			});
	/*
	function appCommit() {
		
		*/

		/* var sd = new Date($("#sdate").val());
		var ed = new Date($("#edate").val());
		if (sd.getTime() > ed.getTime()) {
			alert("시작보다 종료를 더 먼저 입력했어여");
			return false; 

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
		
	}*/
	function AddRewards(){
		
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
<div class="container">
	<form id="fundingApplication" method="post" action="${pageContext.request.contextPath}/funding/fundingApplication" enctype="multipart/form-data">
	<div class="row">
		<div class='col-lg-12' align="center"><h3>펀딩신청서</h3></div>
	</div>
	<div class="row">
		<div class='col-lg-12' align="center"><p></p></div>
	</div>
	<div class="row">
		<div class='col-lg-6'>	
			<input type="hidden" name="id" value="${sessionScope.id}">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" value="${fvo.title}" placeholder="제목을 입력하세요">
			<span><form:errors path="fvo.title" /></span>
			<label for="content">내용</label>
			<textarea rows="5" cols="50" name="content" id="content" placeholder="내용을 입력하세요">${fvo.content}</textarea>
			<span><form:errors path="fvo.content" /></span><br>
		</div> 
		<div class='col-lg-6'>
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
			</select>
			<label for="checks">해시태그</label>
			<div class="checks">
				<input type="checkbox"	class="checks" name="hashtag" value="테크·가전" id="tech"><label for="tech">#테크·가전</label>
				<input type="checkbox" name="hashtag" value="패션·잡화" id="fashion"><label for="fashion">#패션·잡화</label>
				<input type="checkbox" name="hashtag" value="뷰티" id="beauty"><label for="beauty">#뷰티</label>
				<input type="checkbox" name="hashtag" value="푸드" id="food"><label for="food">#푸드</label>
				<input type="checkbox" name="hashtag" value="홈리빙" id="homeliving"><label for="homeliving">#홈리빙</label>
			</div>
			<div class="checks">
				<input type="checkbox" name="hashtag" value="디자인소품" id="design"><label for="design">#디자인소품</label>
				<input type="checkbox" name="hashtag" value="여행·레저" id="tour"><label for="tour">#여행·레저</label>
				<input type="checkbox" name="hashtag" value="스포츠·모빌리티" id="sports"><label for="sports">#스포츠·모빌리티</label>
				<input type="checkbox" name="hashtag" value="반려동물" id="animal"><label for="animal">#반려동물</label>
			</div>
			<div class="checks">
				<input type="checkbox" name="hashtag" value="공연·컬쳐" id="culture"><label for="culture">#공연·컬쳐</label>
				<input type="checkbox" name="hashtag" value="소셜·캠페인" id="social"><label for="social">#소셜·캠페인</label>
				<input type="checkbox" name="hashtag" value="교육·키즈" id="education"><label for="education">#교육·키즈</label>
				<input type="checkbox" name="hashtag" value="게임·취미" id="game"><label for="game">#게임·취미</label>
				<input type="checkbox" name="hashtag" value="출판" id="book"><label for="book">#출판</label><br>
			</div>
			<div id="inputHashtag">
				<input type="text" name="hashtag" data-hash="ht"><br>
			</div>	
		</div>
		</div>
		<div class="row">
			<div class='col-lg-6'>
				<label for="amount">목표금액(달성금액)</label>
           		<input type="number" name="amount" id="amount" min="0" step="1000" pattern="#,###"><p style="display: inline;margin-left: 10px">원</p>
				<span><form:errors path="fvo.amount" /></span><br>
			</div>
			<div class='col-lg-6'>
				<label for="dateRange">펀딩기간(달력으로 입력)</label>	
				<input type="text" name="dateRange" data-range="true" data-multiple-dates-separator=" - " data-language="en" class="datepicker-here"/>
			</div>
		</div>
		<div class="row">
			<div class='col-lg-12' id="fine-uploader-gallery">
			</div>
		</div>
		<div class="row">
          	<div class='col-lg-12' name="inputReward">
	          <label for="rewardNum" style="display: inline;">리워드</label>
	          <button type="button" class="MyButton" name="showMore" style="display: inline;">+</button>
	          <button type="button" class="MyButton" name="showLess" style="display: inline;">-</button>
	          <label for="reward">리워드명</label><input type="text" name="reward"> 
	          <label for="price">가격</label>
	          <input type="number" name="price"><p style="display: inline;margin-left: 10px">원</p> 
	          <label for="fAmount">수량</label>
	          <input type="number" name="fAmount"><p style="display: inline;margin-left: 10px">개</p>
	        </div>
	    </div>
		<div class="row">
			<div class='col-lg-12'>
				<button id="fundingApplicationButton" type="button" class="btn" name="application">신  청</button>
			</div>
		</div>
		<input type="hidden" name="fNum" value="">				
	</form>
</div>
	<script>
    var cnt=1;
		//리워드 추가 버튼
	    $(document).on("click","button[name=showMore]",function(){
        cnt++;
	    var addRewardText =  
	    	'<div class="col-lg-12" name="inputReward" >'+
	    		'<label for="rewardNum" style="display: inline;">리워드' + cnt + '</label>'+
            	'<label for="reward">리워드명</label><input type="text" name="reward">'+
            	'<label for="price">가격</label><input type="number" name="price"><p style="display: inline;margin-left: 10px">원</p>'+
            	'<label for="fAmount">수량</label><input type="number" name="fAmount"><p style="display: inline;margin-left: 10px">개</p>'+ 
            '</div>';   
        var RewardHtml = $("div[name=inputReward]:last"); //last를 사용하여 마지막 태그 호출
        RewardHtml.after(addRewardText); //마지막 뒤에 붙인다.
    });
    //리워드 삭제 버튼
	    $(document).on("click","button[name=showLess]",function(){
	        console.log(cnt);
	    	if(cnt===1){
	    		//alert("리워드는 하나 이상은 반드시 입력해야합니다");
	    		swal({
				  type: 'error',
				  title: '리워드는 하나 이상은 반드시 입력해야 합니다.',
				});
	        	return false;
	        }
	    	var RewardHtml = $("div[name=inputReward]:last");
	        RewardHtml.remove(); //삭제 
	        cnt--;
	    });
	</script>
	
	<script type="text/javascript">
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
							console.log('id', id);
							var fileContainer = this.getItemByFileId(id);
							var captionInput = fileContainer.querySelector('.caption');
							var captionText = captionInput.value;
							
							var title = $("input[name='title']").val() ;
							var content = $("textarea[name='content']").val();
							var category = $("select[name='category']").val();
							var amount = $("input[name='amount']").val();
							var dateRange = $("input[name='dateRange']").val();
							var uid= $("input[name='id']").val();
							var fNum = $("input[name='fNum']").val();
							console.log('여기가 나와야  된다고 제미라미나ㅓ', fNum)
							
							console.log(title, content, category, amount, dateRange, uid, fNum);

							this.setParams({
								index : index,
								caption : captionText,
								title : title,
								content : content,
								category : category,
								amount : amount,
								dateRange : dateRange,
								uid : uid,
								fNum : fNum
							}, id);
							index++;
							
						},
						onComplete: function(id, name, responseJSON){
							console.log(id, name, '에프 넘아 나와라 ', $("input[name='fNum']").val());
							if(!$("input[name='fNum']").val()){
								$("input[name='fNum']").val(responseJSON.fNum);
							}
							
							
						},

						onAllComplete: function(succeeded){
							console.log('succeeded', succeeded);
							$('#fundingApplication').submit();
							
						}
					}
				});
	
		qq(document.getElementById("fundingApplicationButton")).attach("click", function() {
			if(!$("input[name='title']").val()){
				//alert("제목은 필수입력사항입니다");
				swal({
				  type: 'error',
				  title: '제목은 필수입력사항입니다.',
				});
				return false;
			}
			if(!$("textarea[name='content']").val()){
				//alert("내용은 필수입력사항입니다");
				swal({
				  type: 'error',
				  title: '내용은 필수입력사항입니다.',
				});
				return false;
			}
			if(!$("input[name='amount']").val()){
				//alert("목표금액은 필수입력사항입니다");
				swal({
				  type: 'error',
				  title: '목표금액은 필수입력사항입니다.',
				});
				return false;
			}
			if(!$("input[name='dateRange']").val()){
				//alert("펀딩기간은 필수입력사항입니다");
				swal({
				  type: 'error',
				  title: '펀딩기간은 필수입력사항입니다.',
				});
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
				//alert("물품은 한가지 이상 입력하셔야 되욧");
				swal({
					  type: 'error',
					  title: '물품은 한 가지 이상 입력하셔야 합니다.',
					});
				return false;
			}
			
			galleryUploader.uploadStoredFiles();
			
        });
	</script>