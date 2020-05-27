<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<canvas id="myChart" width="300" height="300"></canvas>
<script>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ["층류","철학","종교","사회과학","자연과학","기술과학","예술","언어","문학","역사"],
			datasets: [{
				data: [0,3,0,12,5,0,10,20,60,10],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(204, 153, 204, 0.2)',
					'rgba(255, 102, 000, 0.2)',
					'rgba(000, 102, 255, 0.2)',
					'rgba(102, 204, 000, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(204, 153, 204, 1)',
					'rgba(255, 102, 000, 1)',
					'rgba(000, 102, 255, 1)',
					'rgba(102, 204, 000, 1)'
				],
				borderWidth: 1
			}]
		},
		centerText: {
	        display: true,
	        text: "총 67권"
	    },
		options: {
			responsive: true,
			title: {
		        display: true,
		        text: '나의 독서 점유율'
		      },
			legend: {
				display: false,
				position: 'right'
		    },
			maintainAspectRatio: false,
		    scaleShowLabels : false,
			gridLines: {
				   display: false
				}
		}
	});

	Chart.Chart.pluginService.register({
	    beforeDraw: function(chart) {
	        if (chart.config.centerText.display !== null &&
	            typeof chart.config.centerText.display !== 'undefined' &&
	            chart.config.centerText.display) {
	            drawTotals(chart);
	        }
	    },
	});
	 
	function drawTotals(chart) {
	 
	    var width = chart.chart.width,
	    height = chart.chart.height,
	    ctx = chart.chart.ctx;
	 
	    ctx.restore();
	    var fontSize = 1.3;
	    ctx.font = fontSize + "em sans-serif";
	    ctx.textBaseline = "middle";
	 
	    var text = chart.config.centerText.text,
	    textX = Math.round((width - ctx.measureText(text).width) / 2),
	    textY = (height / 2)+17;
	 
	    ctx.fillText(text, textX, textY);
	    ctx.save();
	}
	 
	window.onload = function() {
	    var ctx = document.getElementById("chart-area").getContext("2d");
	    window.myDoughnut = new Chart(ctx, config);
	};
</script>
</body>
</html>