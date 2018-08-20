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
                    <br><br> <br><br> <br><br>
                    <!-- User Detail box -->
                    <!--div class="user-details">

                        <div class="user-info">
                            <p style="font-size: 20px; color: #067790; text-align: center;"><b>Ecole superieure <br> d'informatique <br> </b></p>
                        </div>
                    </div-->
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <c:if test="${role=='ADM'}">

                        <li><a href="/Administration"><i class="ti-home"></i> Accueil </a></li>

                        </c:if>

                        <c:if test="${role=='CUN'}">
                        <li><a href="/CUN"><i class="ti-home"></i> Accueil </a></li>
                        </c:if>

                        <c:if test="${role=='CUN'}">

                        <li><a href="/CUN/TableauBord"><i class="fa fa-dashboard"></i> Tableau de bord</a></li>
                        </c:if>

                        <c:if test="${role=='ADM'}">

                            <li><a href="/Administration/TableauBord"><i class="fa fa-dashboard"></i> Tableau de bord</a></li>
                        </c:if>

                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->

        <div id="page-right-content" style="height: 1200px;">

            <div class="container" style="height:700px;position:absolute;top:100px;margin-left: 130px;">
                <div class="row">
                    <div class="col-sm-12" style="width:80%;margin-left:100px;">
                        <h3 class="m-b-20 header-title" style="color: #067790; text-align: center;">Dossier administratif du candidat</h3>
                        <div class="row" style="padding: 10px;">
                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-hover mails m-0 table table-actions-bar">
                                        <thead>

                                        </thead>

                                        <tbody id="idTabele">
                                        <tr>

                                            <h4 style="color: #067790; ">Les documents</h4>

                                        </tr>
                                        <c:if test="${ !empty fichiers}">
                                        <c:forEach var="file" items="${fichiers}">
                                            <tr>
                                                <a href="/resources/files/Administratifs/${idEns}/${file}"><c:out value="${file}"></c:out></a>
                                                <br>


                                            </tr>

                                        </c:forEach>
                                        </c:if>


                                        <tr>

                                            <h4 style="color: #067790; ">Curriculum vitae de l'enseignant</h4>

                                        </tr>

                                        <tr>

                                            <c:if test="${role=='ADM'}">

                                            <a href=" /Administration/AP/${idEns}">1) Les activités pédagogiques </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">
                                            <a href=" /CUN/AP/${idEns}">1) Les activités pédagogiques </a>
                                            </c:if>

                                        </tr>
                                        <br>

                                        <tr>
                                            <c:if test="${role=='ADM'}">

                                            <a href="/Administration/Ouvrages/${idEns}">2) Les ouvrages édités </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">

                                                <a href="/CUN/Ouvrages/${idEns}">2) Les ouvrages édités </a>
                                            </c:if>
                                        </tr>
                                        <br>
                                        <tr>
                                            <c:if test="${role=='ADM'}">

                                            <a href="/Administration/Publications/${idEns}">3) Les publications </a>

                                            </c:if>

                                            <c:if test="${role=='CUN'}">

                                                <a href="/CUN/Publications/${idEns}">3) Les publications </a>

                                            </c:if>

                                        </tr>
                                        <br>

                                        <tr>
                                            <c:if test="${role=='ADM'}">

                                            <a href=" /Administration/Encadrements/${idEns}">4) Les encadrements </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">

                                                <a href=" /CUN/Encadrements/${idEns}">4) Les encadrements </a>
                                            </c:if>

                                        </tr>
                                        <br>

                                        <tr>
                                            <c:if test="${role=='ADM'}">
                                            <a href=" /Administration/Communications/${idEns}">5) Les communications </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">
                                                <a href=" /CUN/Communications/${idEns}">5) Les communications </a>
                                            </c:if>

                                        </tr>

                                        <br>


                                        <tr>
                                            <c:if test="${role=='ADM'}">

                                            <a href="/Administration/Projet/${idEns}">6) Les projets </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">

                                                <a href="/CUN/Projet/${idEns}">6) Les projets </a>
                                            </c:if>

                                        </tr>

                                        <tr>

                                            <br>
                                            <c:if test="${role=='ADM'}">
                                            <a href="/Administration/Animation/${idEns}">7) Les animations scientifiques </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">
                                                <a href="/CUN/Animation/${idEns}">7) Les animations scientifiques </a>
                                            </c:if>

                                        </tr>

                                        <tr>

                                            <br>
                                            <c:if test="${role=='ADM'}">
                                            <a href="/Administration/Expertise/${idEns}">8) Les expertises </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">
                                                <a href="/CUN/Expertise/${idEns}">8) Les expertises </a>
                                            </c:if>

                                        </tr>

                                        <tr>

                                            <br>
                                            <c:if test="${role=='ADM'}">
                                            <a href="/Administration/Responsabilites/${idEns}">9) Les responsabilités </a>
                                            </c:if>

                                            <c:if test="${role=='CUN'}">
                                                <a href="/CUN/Responsabilites/${idEns}">9) Les responsabilités </a>
                                            </c:if>

                                        </tr>

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div> <!-- end row -->

        </div>

        <!-- end container -->

        <div class="footer" style="position: absolute; top: 1150px;">
            <div class="pull-right hidden-xs">
                <strong>GCode</strong> - Copyright &copy; 2018
            </div>
        </div>


        <!-- End #page-right-content -->

    </div>



</div>


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