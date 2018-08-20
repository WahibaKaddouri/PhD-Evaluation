<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
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
                            <ul class="dropdown-menu p-0 dropdown-menu-lg">
                                <!--<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>-->
                                <li class="list-group notification-list" style="height: 267px;">
                                    <div class="slimscroll">
                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="media-left p-r-10">
                                                    <em class="fa fa-calendar  bg-primary"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Une nouvelles candidature</h5>
                                                    <p class="m-0">
                                                        <small>40 minutes passées</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="media-left p-r-10">
                                                    <em class="fa fa-cog bg-warning"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Deux nouvelles candidatures</h5>
                                                    <p class="m-0">
                                                        <small>Hier</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown top-menu-item-xs">
                            <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-user"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:void(0)"><i class="ti-user m-r-10"></i> Profil</a></li>
                                <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> Paramètre</a></li>
                                <li class="divider"></li>
                                <li> <a href="javascript:void(0)"><i class="ti-power-off m-r-10"></i> Deconnexion</a>
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
    <div class="page-contentbar">

        <!--left navigation start-->
        <aside class="sidebar-navigation">
            <div class="scrollbar-wrapper">
                <div>
                    <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                        <i class="mdi mdi-close"></i>
                    </button>

                    <br><br><br><br><br><br>
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href="/Administration"><i class="ti-home"></i> Accueil </a></li>

                        <li><a href="/Administration/TableauBord"><i class="fa fa-dashboard"></i> Tableau de bord</a></li>

                        <li><a href=""><i class="fa fa-users"></i> Liste des enseignants</a></li>

                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->

        <div id="page-right-content">
            <div>
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="header-title m-t-0" style="text-align: center;"> Evaluation de l'administration </h4>
                    </div>
                </div> <!-- end row -->
                <br><br>

                <div class="thumb-xl member-thumb m-b-10 center-block">
                    <img src="/resources/images/userEns.jpg" class="img-circle img-thumbnail" alt="profile-image">
                </div>

                <div class="" style="margin-left: 420px;">
                    <h4 class="m-b-5">${enseign.getNom()} &nbsp; &nbsp; ${enseign.getPrenom()}</h4>
                </div>
                <br><br>

                <div class="col-sm-12" style="margin-left: 250px; width: 510px;">
                    <div class="card-box widget-inline" >
                        <div class="row" >

                            <div class="col-lg-3 col-sm-6" style="width: 250px;">
                                <div class="widget-inline-box text-center">
                                    <span class="label label-warning">Observation du dossier administratif</span>
                                    <h3 class="m-t-10"> <b data-plugin="counterup">${obs.getObs_Dossier_adm()}</b></h3>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6" style="width: 250px;">
                                <div class="widget-inline-box text-center">
                                    <span class="label label-info">Observation du dossier pédagogique</span>
                                    <h3 class="m-t-10"> <b data-plugin="counterup">${obs.getObs_Dossier_ped()}</b></h3>
                                </div>
                            </div>

                        </div>
                    </div>

                <!--div class="container" style="width:200px; margin-left: 200px;">
                    <div class="jumbotron">
                        <h1>Bootstrap Tutorial</h1>
                        <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing
                            responsive, mobile-first projects on the web.</p>
                    </div>

                </div-->


            </div>



    <!-- end container -->

    <div class="footer">
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

