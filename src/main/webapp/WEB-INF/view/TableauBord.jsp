<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
		 pageEncoding="UTF-8"%>
<html>

<head>
	<title>Nombre de postulant par section </title>
	<script src="<c:url value="/resources/Chart.js-2.7.2/dist/Chart.bundle.js"/>"></script>
	<script src="<c:url value="/resources/Chart.js-2.7.2/samples/utils.js"/>"></script>
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>

<body>
	<div id="container" style="width: 75%;">
		<canvas id="canvas"></canvas>
	</div>
	<script>
		var MONTHS = ['Technologie', 'Sciences exactes', 'Sciences de la nature et de vie', 'Sciences économiques et commerciales', 'Sciences sociales et humaines ', 'Littérature et langues', 'Droits et administrations'];
		var color = Chart.helpers.color;
		var horizontalBarChartData = {
			labels: ['Technologie', 'Sciences exactes', 'Sciences de la nature et de vie', 'Sciences économiques et commerciales', 'Sciences sociales et humaines ', 'Littérature et langues', 'Droits et administrations'],
			datasets: [{
				label: 'Nombre postulant',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [${liste[1]},${liste[2]},${liste[3]},${liste[4]},${liste[5]},${liste[6]},${liste[7]}]
				/*[
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]*/
			}/**, {
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}**/]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myHorizontalBar = new Chart(ctx, {
				type: 'horizontalBar',
				data: horizontalBarChartData,
				options: {
					// Elements options apply to all of the options unless overridden in a dataset
					// In this case, we are setting the border of each horizontal bar to be 2px wide
					elements: {
						rectangle: {
							borderWidth: 2,
						}
					},
					responsive: true,
					legend: {
						position: 'right',
					},
					title: {
						display: true,
						text: 'Nombre de postulant par section'
					}
				}
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			horizontalBarChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myHorizontalBar.update();
		});

		var colorNames = Object.keys(window.chartColors);

		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[horizontalBarChartData.datasets.length % colorNames.length];
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + horizontalBarChartData.datasets.length,
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				data: []
			};

			for (var index = 0; index < horizontalBarChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			horizontalBarChartData.datasets.push(newDataset);
			window.myHorizontalBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (horizontalBarChartData.datasets.length > 0) {
				var month = MONTHS[horizontalBarChartData.labels.length % MONTHS.length];
				horizontalBarChartData.labels.push(month);

				for (var index = 0; index < horizontalBarChartData.datasets.length; ++index) {
					horizontalBarChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myHorizontalBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			horizontalBarChartData.datasets.splice(0, 1);
			window.myHorizontalBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			horizontalBarChartData.labels.splice(-1, 1); // remove the label first

			horizontalBarChartData.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myHorizontalBar.update();
		});
	</script>
</body>

</html>
