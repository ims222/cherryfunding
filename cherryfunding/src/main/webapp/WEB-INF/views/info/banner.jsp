<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript">
function idCheck(){
	var id='${sessionScope.id}';
	if(!id){
		//$("#myModal").modal('show');
		alert('로그인 해주세욧');
	}else{
		window.location.href="${pageContext.request.contextPath}/volunteer/insertVolunteer";
	}
}
</script>
<style type="text/css">
.modal{
      position: absolute;
      top: 50%;
      z-index: 1050;
      width: auto;
      outline: none;
      }
.modal-backdrop{
  z-index: -1;
}
</style>
<!-- Banner -->
<div id="banner" class="container">
	<section>
		<p>
			안녕하세요 <strong>CherryFunding</strong>입니다.<br> 봉사신청은 아래 신청버튼을 눌러주세요<br> 
			<a href="http://templated.co">템플릿</a>
			<a href="http://twitter.com/templatedco">Twitter</a>.
			<a href="javascript: return false;"
			class="button medium" onclick="idCheck();">봉사신청하기</a>
		</p>
	</section>
	<div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>로그인 해주세요.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>  
</div>