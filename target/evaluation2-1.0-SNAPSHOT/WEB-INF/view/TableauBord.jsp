<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %><html lang="en">
<html>
<head>
	<meta charset="utf-8" />
	<title>MESRS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
	<meta content="Coderthemes" name="author" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!--Morris Chart CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/CUN/plugins/morris/morris.css"/>">

	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/resources/CUN/css/bootstrap.min.css"/>" rel="stylesheet">
	<!-- MetisMenu CSS -->
	<link href="<c:url value="/resources/CUN/css/metisMenu.min.css"/>" rel="stylesheet">
	<!-- Icons CSS -->
	<link href="<c:url value="/resources/CUN/css/icons.css"/>" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/CUN/css/style.css"/>" rel="stylesheet">
	<!--Start of Zendesk Chat Script-->

	<link href="<c:url value="/resources/CUN/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/CUN/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

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

<div id="page-wrapper">

	<!-- Top Bar Start -->
	<div class="topbar">
		<!-- Top navbar -->
		<div class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="">

					<!-- Mobile menu button -->
					<div class="pull-left">
						<button type="button" class="button-menu-mobile visible-xs visible-sm">
							<i class="fa fa-bars"></i>
						</button>
						<span class="clearfix"></span>
					</div>



					<!-- Top nav Right menu -->
					<ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right">
						<li class="dropdown top-menu-item-xs">
							<a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true">
								<i class="mdi mdi-bell"></i> <span class="label label-danger">2</span>
							</a>

						</li>

						<li class="dropdown top-menu-item-xs">
							<a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-user"></i></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)"><i class="ti-user m-r-10"></i> Profil</a></li>

								<li class="divider"></li>
								<li> <a href="/logout"><i class="ti-power-off m-r-10"></i> Deconnexion</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div> <!-- end container -->
		</div> <!-- end navbar -->
	</div>
	<!-- Top Bar End -->


	<!-- Page content start -->
	<div  class="page-contentbar">

		<!--left navigation start-->
		<aside class="sidebar-navigation">
			<div class="scrollbar-wrapper">
				<div>
					<button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
						<i class="mdi mdi-close"></i>
					</button>
					<br><br> <br><br> <br><br>
					<!--- End User Detail box -->

					<!-- Left Menu Start -->
					<ul class="metisMenu nav" id="side-menu">
						<li><a href="/CUN"><i class="ti-home"></i> Accueil </a></li>



					</ul>
				</div>
			</div><!--Scrollbar wrapper-->
		</aside>
		<!--left navigation end-->

		<!-- START PAGE CONTENT -->

		<div id="page-right-content" style="height: 1000px;">

			<div class="row">
				<div class="col-sm-12">
					<h3 class="m-b-20 header-title" style="color: #067790; text-align: center;">Tableau de bord</h3>
				</div>
			</div>

			<div class="col-sm-12" style="margin-left: 100px; width: 780px;">
				<div class="card-box widget-inline" >
					<div class="row" >

						<div class="col-lg-3 col-sm-6" style="width: 250px;">
							<div class="widget-inline-box text-center">
								<span class="label label-info">Nombre d'enseignants inscrits</span> <br>
								<h3 class="m-t-10"> <b data-plugin="counterup">${nb_ens} </b></h3>
								<p class="text-muted" > Enseignants </p>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6" style="width: 250px;">
							<div class="widget-inline-box text-center">
								<span class="label label-danger">Nombre de candidatures rejetées</span>
								<h3 class="m-t-10"> <b data-plugin="counterup">${nb_rejet}</b></h3>
								<p class="text-muted"> Candidats  </p>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6" style="width: 250px;">
							<div class="widget-inline-box text-center">
								<span class="label label-success">Nombre de candidatures acceptées</span>
								<h3 class="m-t-10"> <b data-plugin="counterup">${nb_acceptees}</b></h3>
								<p class="text-muted">Candidats</p>
							</div>
						</div>



					</div>
				</div>
			</div>
			<br><br> <br><br>

			<span class="label label-success" style="margin-left: 300px;font-size: 15px;">Nombre de candidats par section</span>
			<div id="container" style="width: 75%;">
				<br><br>
				<canvas id="canvas"></canvas>
			</div>


			<script>
                var MONTHS = ['Technologie', 'Sciences exactes', 'Sciences de la nature et de vie', 'Sciences économiques et commerciales', 'Sciences sociales et humaines ', 'Littérature et langues', 'Droits et administrations'];
                var color = Chart.helpers.color;
                var horizontalBarChartData = {
                    labels: ['Technologie', 'Sciences exactes', 'Sciences de la nature et de vie', 'Sciences économiques et commerciales', 'Sciences sociales et humaines ', 'Littérature et langues', 'Droits et administrations'],
                    datasets: [{
                        label: 'Nombre de postulants',
                        backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.blue,
                        borderWidth: 1,
                        data: [${liste[0]},${liste[1]},${liste[2]},${liste[3]},${liste[4]},${liste[5]},${liste[6]}]

                    }]
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
                                position: 'center',
                            },


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





		</div>
		<!-- end container -->





		<div class="footer" style="position: absolute; top: 970px;">
			<div class="pull-right hidden-xs">
				<strong>GCode</strong> - Copyright &copy; 2018
			</div>
		</div>

	</div>
	<!-- End #page-right-content -->

</div>
<!-- end .page-contentbar -->
</div>
<!-- End #page-wrapper -->
<!-- js placed at the end of the document so the pages load faster -->
<script src="<c:url value="/resources/CUN/js/jquery-2.1.4.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/jquery.slimscroll.min.js"/>"></script>

<!--Morris Chart-->
<script src="<c:url value="/resources/CUN/plugins/morris/morris.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/raphael/raphael-min.js"/>"></script>

<!-- Dashboard init -->
<script src="<c:url value="/resources/CUN/pages/jquery.dashboard.js"/>"></script>

<!-- App Js -->
<script src="<c:url value="/resources/CUN/js/jquery.app.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/bootbox.min.js"/>"></script>

<script type="text/javascript"> </script>

</body>
</html>