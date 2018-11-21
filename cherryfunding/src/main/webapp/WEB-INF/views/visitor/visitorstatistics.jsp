<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript" src="http://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
	#div2{
		position: absolute;
    	top: 0;
    	right: 0;
    	margin:31px -300px 0px 0px;
	}
</style>
<title>Insert title here</title>

<script type="text/javascript">

		$(function() {
			 $( "#testDatepicker" ).datepicker({
				 dateFormat:'yy/mm/dd',
		         changeMonth: true, 
		         changeYear: true,
		         nextText: '다음 달',
		         prevText: '이전 달',
		         showOn: "both",
		         onSelect: function (dateText, inst) {
		                 alert('날짜선택 = ' + dateText);
		                 
		            $.ajax({
		            	url:"<c:url value='/visitorr'/>",
		            	data:{dataText:dateText},
		            	type:"GET",
		            	dataType:"json",
		            	success:function(date){
		            		var count = Number(date);
		            		google.charts.load('current',{'packages':['corechart']});
		            		google.charts.setOnLoadCallback(drawVisualization);
		            		
		            		function drawVisualization(){
		            			var data = google.visualization.arrayToDataTable([
		            				
		            				['항목','인원'],
		            				['하루 일일 통계',count]
		            			]);
		            			
		            		var options = {
		            				title: dateText,
		            				width : 500,
		            				height: 400,
		            				vAxis: {title:'일일 통계'},
		            				hAxis: {title:'총:'+count+'명'},
		            				seriesType: 'bars',
		            				series: {5: {type:'line'}}
		            		};
		            		
		            		
		            		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		            		chart.draw(data,options);
		            		
		            		
		            	}
		            		
		            		////////////////////////////// 오늘 펀딩 모인 금액
		    				
		            		google.charts.load('current',{'packages':['corechart']});
		            		google.charts.setOnLoadCallback(drawVisualization4);
		            		
		            		function drawVisualization4(){
		            			var data = google.visualization.arrayToDataTable([
		            				
		            				['항목','원'],
		            				['하루 모인 펀딩 금액',${tfprice}],
		            			]);
		            			
		            		var options = {
		            				title: '하루 모인 펀딩 금액 통계',
		            				width : 500,
		            				height: 400,
		            				vAxis: {title:'금액 통계'},
		            				hAxis: {title:'펀딩 총 금액: '+${tfprice}+'원'},
		            				seriesType: 'bars',
		            				series: {5: {type:'line'}}
		            		};
		            		
		            		
		            		var chart = new google.visualization.ComboChart(document.getElementById('chart_div4'));
		            		chart.draw(data,options);
		    			
		            		};
		    				
		    				
		    				////////////////////////////// 오늘 모인 기부 금액

		            		google.charts.load('current',{'packages':['corechart']});
		            		google.charts.setOnLoadCallback(drawVisualization5);
		            		
		            		function drawVisualization5(){
		            			var data = google.visualization.arrayToDataTable([
		            				
		            				['항목','원'],
		            				['하루 모인 기부 금액',${tcprice}],
		            			]);
		            			
		            		var options = {
		            				title: '하루 모인 기부 금액 통계',
		            				width : 500,
		            				height: 400,
		            				vAxis: {title:'금액 통계'},
		            				hAxis: {title:'기부 총 금액: '+${tcprice}+'원'},
		            				seriesType: 'bars',
		            				series: {5: {type:'line'}}
		            		};
		            		var chart = new google.visualization.ComboChart(document.getElementById('chart_div5'));
		            		chart.draw(data,options);
		    			
		            		};
		            	},
		            	error:function(data){
		            	}
		            });
		         }
		    });//여기 까지가 달력을 이용해서 그래프 가져오는 ajax 부분
		    
		    	//일일 인원 접속 통계
				google.charts.load('current',{'packages':['corechart']});
        		google.charts.setOnLoadCallback(drawVisualization);
        		
        		function drawVisualization(){
        			var data = google.visualization.arrayToDataTable([
        				
        				['항목','인원'],
        				['하루 일일 통계',${todaycount}]
        			]);
        			
        		var options = {
        				title: '하루 일일 통계',
        				width : 500,
        				height: 400,
        				vAxis: {title:'일일 통계'},
        				hAxis: {title:'총:'+${todaycount}+'명'},
        				seriesType: 'bars',
        				series: {5: {type:'line'}}
        		};
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        		chart.draw(data,options);
        		};
        		
        		////////////////////////////// 펀딩 , 총 금액 그래프
        		
				google.charts.load('current',{'packages':['corechart']});
        		google.charts.setOnLoadCallback(drawVisualization2);
        		
        		function drawVisualization2(){
        			var data = google.visualization.arrayToDataTable([
        				
        				['항목','원'],
        				['총 펀딩 금액',${ftotalprice}]
        			]);
        			
        		var options = {
        				title: '펀딩 총 금액 통계',
        				width : 500,
        				height: 400,
        				vAxis: {title:'금액 통계'},
        				hAxis: {title:'펀딩  총 금액: '+${ftotalprice}+'원'},
        				seriesType: 'bars',
        				series: {5: {type:'line'}}
        		};
        		
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
        		chart.draw(data,options);
			
        		};
        		
//////////////////////////////기부 , 총 금액 그래프
        		google.charts.load('current',{'packages':['corechart']});
        		google.charts.setOnLoadCallback(drawVisualization3);
        		
        		function drawVisualization3(){
        			var data = google.visualization.arrayToDataTable([
        				
        				['항목','원'],
        				['총 기부 금액',${ctotalprice}]
        			]);
        			
        		var options = {
        				title: '기부 총 금액 통계',
        				width : 500,
        				height: 400,
        				vAxis: {title:'금액 통계'},
        				hAxis: {title:'기부 총 금액: '+${ctotalprice}+'원'},
        				seriesType: 'bars',
        				series: {5: {type:'line'}}
        		};
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart_div3'));
        		chart.draw(data,options);
			
        		};
        		
				////////////////////////////// 오늘 펀딩 모인 금액
				
        		google.charts.load('current',{'packages':['corechart']});
        		google.charts.setOnLoadCallback(drawVisualization4);
        		
        		function drawVisualization4(){
        			var data = google.visualization.arrayToDataTable([
        				
        				['항목','원'],
        				['하루 모인 펀딩 금액',${tfprice}]
        			]);
        			
        		var options = {
        				title: '하루 모인 펀딩 금액 통계',
        				width : 500,
        				height: 400,
        				vAxis: {title:'금액 통계'},
        				hAxis: {title:'펀딩 총 금액: '+${tfprice}+'원'},
        				seriesType: 'bars',
        				series: {5: {type:'line'}}
        		};
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart_div4'));
        		chart.draw(data,options);
			
        		};
				
				////////////////////////////// 오늘 모인 기부 금액

        		google.charts.load('current',{'packages':['corechart']});
        		google.charts.setOnLoadCallback(drawVisualization5);
        		
        		function drawVisualization5(){
        			var data = google.visualization.arrayToDataTable([
        				
        				['항목','원'],
        				['하루 모인 기부 금액',${tcprice}]
        			]);
        			
        		var options = {
        				title: '하루 모인 기부 금액 통계',
        				width : 500,
        				height: 400,
        				vAxis: {title:'금액 통계'},
        				hAxis: {title:'기부 총 금액: '+${tcprice}+'원'},
        				seriesType: 'bars',
        				series: {5: {type:'line'}}
        		};
        		
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart_div5'));
        		chart.draw(data,options);
			
        		};
		});
		
</script>

</head>
<body>

	<input type="text" id="testDatepicker">
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="width:900px; height: 500px;">
				<div id="chart_div">FusionCharts XT will load here!</div>
			</div>
		</div>

		<div class="row" id="div2">
			<div class="col-sm-6" style="width:900px; height: 500px;">
				<div id="chart_div2" >FusionCharts XT will load here!</div>
			</div>
			
			<div class="col-sm-6" style="width:900px; height: 500px;">
				<div id="chart_div3" >FusionCharts XT will load here!</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-6" style="width:900px; height: 500px;">
				<div id="chart_div4" >FusionCharts XT will load here!</div>
			</div>
			
			<div class="col-sm-6" style="width:900px; height: 500px;">
				<div id="chart_div5" >FusionCharts XT will load here!</div>
			</div>
		</div>

	</div>
	

</body>
</html>