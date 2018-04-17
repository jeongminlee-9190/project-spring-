<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<style type="text/css">
		.row1{
			margin-top: 50px;
			margin-bottom: 80px;
			text-align: left;
		}
	</style>
	
	<input type="hidden" id="January" value="${ChartDTO.sJanuaryCnt}">
	<input type="hidden" id="February" value="${ChartDTO.sFebruaryCnt}">
	<input type="hidden" id="March" value="${ChartDTO.sMarchCnt}">
	<input type="hidden" id="April" value="${ChartDTO.sAprilCnt}">
	<input type="hidden" id="sSubwayDTO" value="${sSubwayDTO}" size="30">
	<c:forEach var="dto" items="${sSubwayDTO}" varStatus="status">
		<input type="hidden" id="sSubway${status.index}" value="${dto.sSubway}">
		<input type="hidden" id="sSubwayCnt${status.index}" value="${dto.sSubwayCnt}">
	</c:forEach>
	
	
	<div class="container-fluid">
		<div class="row row1">
			<div class="col-sm-2"></div>
			<div class="col-sm-4">
				<h6>상점 회원 증가 추이(단위: 명)</h6>
				<div style="width: 50%">
					<canvas id="canvas1" height="200" Width="300"></canvas>
				</div>
			</div>
			<div class="col-sm-6">
				<h6>지하철 역 별 상점 수(단위: 건)</h6>
				<div style="width: 50%">
					<canvas id="canvas2" height="300" Width="500"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">
		/* var months = ["1월","2월","3월","4월"]; */
		var barChart = null;
		var January = document.getElementById("January").value;
		var February = document.getElementById("February").value;
		var March = document.getElementById("March").value;
		var April = document.getElementById("April").value;
		var lineChart = null;
		var lineChartData = {
			labels : ["1월","2월","3월","4월"],
			datasets : [
				{
					label: "My First dataset",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(100,0,220,1)",
					pointColor : "rgba(100,0,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [January,February,March,April]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas1").getContext("2d");
			lineChart = new Chart(ctx).Line(lineChartData, {
				///Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - Whether the line is curved between points
				bezierCurve : true,
				//Number - Tension of the bezier curve between points
				bezierCurveTension : 0.4,
				//Boolean - Whether to show a dot for each point
				pointDot : true,
				//Number - Radius of each point dot in pixels
				pointDotRadius : 4,
				//Number - Pixel width of point dot stroke
				pointDotStrokeWidth : 1,
				//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
				pointHitDetectionRadius : 20,
				//Boolean - Whether to show a stroke for datasets
				datasetStroke : true,
				//Number - Pixel width of dataset stroke
				datasetStrokeWidth : 2,
				//Boolean - Whether to fill the dataset with a colour
				datasetFill : true,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("canvas1").on("click", function(e) {
			var activePoints = lineChart.getPointsAtEvent(e);
			console.log(activePoints);

			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});
	</script>
	
	
	<script type="text/javascript">
		var barChart = null;
		var barChartData = {
			labels : [document.getElementById("sSubway0").value,
					document.getElementById("sSubway1").value,
					document.getElementById("sSubway2").value,
					document.getElementById("sSubway3").value,
					document.getElementById("sSubway4").value,
					document.getElementById("sSubway5").value,
					document.getElementById("sSubway6").value,
					document.getElementById("sSubway7").value,
					document.getElementById("sSubway8").value,
					document.getElementById("sSubway9").value,
					document.getElementById("sSubway10").value
					],
			datasets : [{
							fillColor : "rgba(220,220,220,0.5)",
							strokeColor : "rgba(220,220,220,0.8)",
							highlightFill: "rgba(220,220,220,0.75)",
							highlightStroke: "rgba(220,220,220,1)",
							data : [document.getElementById("sSubwayCnt0").value,
									document.getElementById("sSubwayCnt1").value,
									document.getElementById("sSubwayCnt2").value,
									document.getElementById("sSubwayCnt3").value,
									document.getElementById("sSubwayCnt4").value,
									document.getElementById("sSubwayCnt5").value,
									document.getElementById("sSubwayCnt6").value,
									document.getElementById("sSubwayCnt7").value,
									document.getElementById("sSubwayCnt8").value,
									document.getElementById("sSubwayCnt9").value,
									document.getElementById("sSubwayCnt10").value
							]
						}]
		};
		
		$(function() {
			var ctx = document.getElementById("canvas2").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				},
				/* responsive : true */
			});
		});
			
		$("canvas2").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);
			
			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});
	</script>