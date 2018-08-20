
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!--<a href="/AdminSite/CUN"> Espace CUN </a>
<a href="/AdminSite/Administration"> Espace Administrator </a>-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Ora</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="shortcut icon" href="<c:url value="/resources/CUN/images/favicon.ico"/>">

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


</head>


<body>

<div id="page-wrapper">

    <!-- Top Bar Start -->
    <div class="topbar">

        <!-- LOGO -->
        <div class="topbar-left">
            <div class="">
                <li class="dropdown top-menu-item-xs">
                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true">Compte </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)"><i class="ti-user m-r-10"></i> Profil</a></li>

                        <li class="divider"></li>
                        <li> <a href="/logout"><i class="ti-power-off m-r-14"></i> Deconnexion</a>
                        </li>
                    </ul>
                </li>
            </div>
        </div>

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

            </div> <!-- end container -->
        </div> <!-- end navbar -->
    </div>
    <!-- Top Bar End -->


    <!-- Page content start -->
    <div class="page-contentbar">

        <!--left navigation start-->
        <aside class="sidebar-navigation">
            <div class="scrollbar-wrapper">
                <div>
                    <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                        <i class="mdi mdi-close"></i>
                    </button>
                    <!-- User Detail box -->
                    <div class="user-details">
                        <div class="pull-left">
                            <img src="<c:url value="/resources/CUN/images/users/avatar-1.jpg"/>"  alt="" class="thumb-md img-circle">
                        </div>
                        <div class="user-info">
                            <a href="#">Administrateur</a>
                            <p class="text-muted m-0">Administrateur</p>
                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href="/AdminSite"><i class="ti-home"></i> Accueil </a></li>
                        <li><a href="/AdminSite/CUN"><i class="fa fa-group"></i> Comission universitaire nationale </a></li>
                        <li><a href="/AdminSite/Administration"><i class="fa fa-group"></i> Administration des établissements </a></li>






                        </li>
                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->
        <div id="page-right-content">

            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box widget-inline">
                            <div class="row">




                                <div class="col-lg-3 col-sm-6">
                                    <div class="widget-inline-box text-center">
                                        <h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">${nb_users}</b></h3>
                                        <p class="text-muted"> Tous les utilisitaurs </p>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-sm-6">
                                    <div class="widget-inline-box text-center b-0">
                                        <h3 class="m-t-10"><i class="text-danger mdi mdi-cellphone-link"></i> <b data-plugin="counterup">${nb_CUN}</b></h3>
                                        <p class="text-muted">Membres de la CUN</p>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="widget-inline-box text-center">
                                        <h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">${nb_Admin}</b></h3>
                                        <p class="text-muted"> Administrateurs  </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!--end row -->



                <div class="row">
                    <div class="col-sm-6">
                        <div class="white-box">
                            <h3 class="box-title m-b-0">liste des utilisateurs </h3>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Role </th>
                                        <th>Etablissement</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${ !empty users}">
                                    <c:forEach var="l" items="${users}">

                                    <tr>
                                    <td><c:out value="${l.username}"></c:out></td>
                                    <td><c:out value="${l.roles}"></c:out></td>
                                    <td><c:out value="${l.etablissement}"></c:out></td>
                                    <td><a href="/AdminSite/Delete/${l.getId()}"> supprimer </a></td>
                                        </tr>
                                    </c:forEach>
                                    </c:if>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>




            </div>
            <!-- end container -->




        </div>
        <!-- End #page-right-content -->

    </div>
    <!-- end .page-contentbar -->
</div>
<!-- End #page-wrapper -->



<!-- js placed at the end of the document so the pages load faster -->
<script src="<c:url value="/resources/CUN/js/jquery-2.1.4.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/js/bootstrap.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/js/metisMenu.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/js/jquery.slimscroll.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/js/main.js"/>" ></script>

<script src="<c:url value="/resources/CUN/plugins/raphael/raphael-min.js"/>" ></script>

<script src="<c:url value="/resources/CUN/plugins/morris/morris.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/plugins/raphael/raphael-min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/pages/jquery.morris.init.js"/>" ></script>



<!-- Flot chart -->
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.min.js"/>" ></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.time.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.tooltip.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.resize.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.pie.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.selection.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.stack.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.orderBars.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/plugins/flot-chart/jquery.flot.crosshair.js"/>"></script>
<script src="<c:url value="/resources/CUN/pages/jquery.flot.init.js"/>"></script>

<!-- KNOB JS -->
<!--[if IE]>
<script type="text/javascript" src="<c:url value="/resources/CUN/plugins/jquery-knob/excanvas.js"/>"></script>
<![endif]-->
<script src="<c:url value="/resources/CUN/plugins/jquery-knob/jquery.knob.js"/>"></script>

<!-- App Js -->
<script src="<c:url value="/resources/CUN/js/jquery.app.js"/>"></script>

<script type="text/javascript">
    $('[data-plugin="knob"]').each(function(idx, obj) {
        $(this).knob();
    });
</script>

<script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="bootstrap/dist/js/tether.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!--Morris JavaScript -->
<script src="../plugins/bower_components/raphael/raphael-min.js"></script>
<script src="../plugins/bower_components/morrisjs/morris.js"></script>
<!-- Sparkline chart JavaScript -->
<script src="../plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<!-- jQuery peity -->
<script src="../plugins/bower_components/peity/jquery.peity.min.js"></script>
<script src="../plugins/bower_components/peity/jquery.peity.init.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/custom.min.js"></script>
<script src="js/dashboard1.js"></script>
<!--Style Switcher -->
<script src="../plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>

<!-- Dashboard init -->


<script src="<c:url value="/resources/CUN/pages/jquery.dashboard.js"/>"></script>
<!--[if IE]>
<script type="text/javascript" src="<c:url value="/resources/CUN/plugins/jquery-knob/excanvas.js"/>"></script>
<![endif]-->
<script src="../public/plugins/jquef,orry-knob/jquery.knob.js"></script>


<!-- App Js -->
<script src="<c:url value="/resources/CUN/js/jquery.app.js"/>" ></script>

</body>
</html>

