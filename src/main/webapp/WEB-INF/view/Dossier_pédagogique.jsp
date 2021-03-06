<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>MESRS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/table.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css/metisMenu.min.css" rel="stylesheet">
    <!-- Icons CSS -->

    <link href="/resources/css_ens/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.css">
    <link href="/resources/css_ens/table.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css_ens/metisMenu.min.css" rel="stylesheet">
    <!-- Icons CSS -->

    <link href="/resources/css_ens/icons.css" rel="stylesheet">
    <!-- Custom styles for editibale table template -->
    <link href="/resources/css_ens/style.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css">
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="../public/css/table.css">
    <!-- Plugins css-->
    <link href="/resources/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/plugins/switchery/switchery.min.css">
    <link href="/resources/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
    <script src="/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
</head>


<body>

<div id="page-wrapper" >

    <!-- Top Bar Start -->
    <div class="topbar" style="background-color: #534441">

        <div class="topbar-left">
            <div class="">

            </div>
        </div>

        <!-- Top navbar -->
        <div class="navbar navbar-default" role="navigation">

            <!-- Top nav Right menu -->
            <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right" style="position:absolute; top:-110px;right:4px;">
                <li class="hidden-xs" style="padding-top:10px;" >
                    <form role="search" class="navbar-left app-search pull-left">
                        <input type="text" placeholder="Search..." class="form-control">
                        <a href=""><i class="fa fa-search" ></i></a>
                    </form>
                </li>
                <li class="dropdown top-menu-item-xs" style="height:80px;">
                    <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;height:80px;">
                        <i class="fa fa-bell" style="padding-top:15px;"></i> <span class="label label-danger" style="position:absolute;top:30px;"></span>
                    </a>
                    <ul class="dropdown-menu p-0 dropdown-menu-lg">
                        <!--<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>-->
                        <li class="list-group notification-list" style="height:70px;">
                            <div class="slimscroll">
                                <!-- list item-->
                                <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        Vous n'avez aucune nouvelle notification
                                    </div>
                                </a>

                                <!-- list item-->


                                <!-- list item-->

                            </div>
                        </li>

                    </ul>
                </li>

                <li class="dropdown top-menu-item-xs" style="height:80px;padding-top: 14px;">
                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;right:2px;height:60px;"><i class="fa fa-user" style="font-size: 25px;text-align:center;"></i></a>
                    <ul class="dropdown-menu">

                        <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> paramètres</a></li>

                        <li class="divider"></li>
                        <li><a href="javascript:void(0)"><i class="ti-power-off m-r-10"></i> Déconnexion</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
    <!-- Top Bar End -->


    <!-- Page content start -->
    <div class="page-contentbar" style="height: 1200px;">

        <!--left navigation start-->
        <aside class="sidebar-navigation">
            <div class="scrollbar-wrapper">
                <div >
                    <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                        <i class="mdi mdi-close"></i>
                    </button>
                    <!-- User Detail box -->
                    <div class="user-details" style="padding:3px;height:100px;" >

                        <table style="background-color:#0A918F;width: 100%;height:100%;border-radius:5px;padding:10px;">
                            <tr>
                                <td style="text-align:center"><i class="fa fa-user" style="font-size: 25px;color:white;"></i></td>
                            </tr>
                            <tr>
                                <td><p style="font-size:15px;text-align: center;color:white;">${nomEns} ${prenomEns}</p></td>
                            </tr>
                        </table>

                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="nav" style="margin-top:7px;">
                        <li class="nav-item active" style="border-top: solid #F5F5F5 1px";>
                            <a class="nav-link" href="<%=request.getContextPath()+response.encodeURL("/Enseignant/Accueil")%>">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969;">Accueil</p>
                            </a>
                        </li>
                        <li style="border-top: solid #F5F5F5 1px;">
                            <a class="nav-link" href="<%=request.getContextPath()+response.encodeURL("/Enseignant/dossiers")%>">
                                <i class="nc-icon nc-circle-09"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969">Mon dossier</p>
                            </a>
                        </li>
                        <li style="border-top: solid #F5F5F5 1px;border-bottom: solid #F5F5F5 1px;">
                            <a class="nav-link" href="#">
                                <i class="nc-icon nc-notes"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969;">Procédure</p>
                            </a>
                        </li>


                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->


        <div id="page-right-content" style="height: 1200px">

            <div class="container" style="height:1200px;position:absolute;top:100px;">
                <div class="row">
                    <div class="col-sm-12" style="width:80%;margin-left:100px;">
                        <h3 class="m-b-20 header-title" style="color: #26C4EC">Dossier pédagogique</h3>

                        <div class="row" style="padding:10px;">
                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-hover mails m-0 table table-actions-bar">
                                        <thead>
                                        <tr>
                                            <th style="min-width: 95px;">Document
                                            </th>
                                            <th>Créer</th>
                                        </tr>
                                        </thead>

                                        <tbody id="idTabele">
                                        <tr>


                                            <td>
                                                <b><a href="" class="text-dark"><b>Compte rendu des activités pédagogiques et scientifiques depuis la date d’accès au grade de maître de conférences classe A (visé par le chef de département) </b></a> </b>
                                            </td>


                                            <td>
                                                <a href="#" data-toggle="modal" data-target="#myModal1" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal1" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Copies des comptes rendus des activités pédagogiques et scientifiques</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                        </tr>

                                        <tr>


                                            <td>
                                                <b><a href="#" class="text-dark"><b>Copies des pages de garde des mémoires de magister et/ou thèses de doctorats ou doctorats d’Etat dirigés et soutenus  accompagnées de copies des autorisations et des procès-verbaux de soutenance</b></a> </b>
                                            </td>


                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal2" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal2" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Copie des mémoires,magisters ou thèses soutenue</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                        </tr>

                                        <tr>

                                            <td>
                                                <b><a href="" class="text-dark"><b>Copies des pages de garde des mémoires de fin d’études de masters encadrés et soutenus</b></a> </b>
                                            </td>

                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal3" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>


                                            <div id="myModal3" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Copies des pages de garde des mémoires de fin d’études de masters encadrés et soutenus</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                        </tr>

                                        <tr>


                                            <td>
                                                <b><a href="" class="text-dark"><b>Copie de l’attestation d’équivalence (dans le cas d’un diplôme étranger)</b></a> </b>
                                            </td>


                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal4" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal4" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Copie de l’attestation d’équivalence (dans le cas d’un diplôme étranger)</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </tr>

                                        <tr>


                                            <td>
                                                <b><a href="" class="text-dark"><b>Exemplaires des ouvrages pédagogiques édités.</b></a> </b>
                                            </td>

                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal5" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal5" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Exemplaires des ouvrages pedagogiques edites</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Copies des décrets et/ou des arrêtés de nomination à des fonctions ou postes supérieurs (organiques ou fonctionnels)</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal6" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal6" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Copies des décrets et/ou des arrêtés de nomination à des fonctions ou postes supérieurs (organiques ou fonctionnels)</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Exemplaires des manuels pédagogiques édités</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal7" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal7" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Exemplaires des manuels pédagogiques edites</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Exemplaires  des polycopiés édités.</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal8" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>


                                            <div id="myModal8" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Exemplaires des polycopies edites</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Publications internationales (revues, périodiques, ouvrages, actes et proceedings édités) , exemplaires originaux –tiré à part-</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal9" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>


                                            <div id="myModal9" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Publications internationales (revues, périodiques, ouvrages, actes et proceedings édités) , exemplaires originaux –tiré à part-</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Brevet d’invention  éventuellement .</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal10" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal10" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Brevet d’invention  éventuellement </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark" data-toggle="modal" data-target="#myModal11" ><b>Publications nationales (revues, périodiques, ouvrages, actes et proceedings édités), exemplaires originaux –tiré à part-</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal11" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Publications nationales (revues, périodiques, ouvrages, actes et proceedings édités), exemplaires originaux –tiré à part- </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>

                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Communications internationales, exemplaires originaux   –tiré à part-</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal12" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal12" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Communications internationales, exemplaires originaux   –tiré à part- </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Communications nationales, exemplaires originaux  –tiré à part-</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal13" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>

                                            <div id="myModal13" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Communications nationales, exemplaires originaux   –tiré à part- </h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b><a href="" class="text-dark"><b>Activités d’animation scientifique (organisation de colloques, expertise, membre de comité de lecture, chef ou membre d’un projet de recherche)</b></a> </b>
                                            </td>
                                            <td>
                                                <a href="" data-toggle="modal" data-target="#myModal14" class="btn btn-default btn-sm btn-icon icon-left">
                                                    <i class="fa fa-file" aria-hidden="true">
                                                    </i>
                                                </a>
                                            </td>


                                            <div id="myModal14" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Activités d’animation scientifique (organisation de colloques, expertise, membre de comité de lecture, chef ou membre d’un projet de recherche)</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form:form method="POST" modelAttribute="fileBucket" action="${pageContext.request.contextPath}/Enseignant/Dossier_pedegogique/Depot" enctype="multipart/form-data" class="form-horizontal">

                                                                <div class="row">
                                                                    <div class="form-group col-md-12">


                                                                        <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                                                                        <div class="has-error">
                                                                            <form:errors path="file" class="help-inline"/>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-actions floatRight">
                                                                        <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                                                    </div>
                                                                </div>

                                                            </form:form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
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



            <!-- end container -->

            <div class="footer" style="position:absolute;bottom:10px;height:50px;">
                <div class="pull-right hidden-xs">
                    <strong>GCode</strong> - Copyright &copy; 2018
                </div>
            </div>


            <!-- End #page-right-content -->

        </div>
        <!-- end .page-contentbar -->
    </div>
    <!-- End #page-wrapper -->



    <script src="/resources/js_ens/table.js"></script>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/resources/js_ens/jquery-2.1.4.min.js"></script>
    <script src="/resources/js_ens/bootstrap.min.js"></script>
    <script src="/resources/js_ens/metisMenu.min.js"></script>
    <script src="/resources/js_ens/jquery.slimscroll.min.js"></script>
    <!-- App Js -->
    <script src="/resources/js_ens/jquery.app.js"></script>
    <script src="/resources/plugins/moment/moment.js"></script>
    <script src="/resources/plugins/timepicker/bootstrap-timepicker.js"></script>
    <script src="/resources/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <script src="/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="/resources/plugins/clockpicker/js/bootstrap-clockpicker.min.js"></script>
    <script src="/resources/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="/resources/plugins/summernote/summernote.min.js"></script>


    <script type="text/javascript">
        $('.datepicker').datepicker({
            weekStart:1,
            color: 'red'
        });

        $(document).ready(function() {
            $('.form-validation').parsley();
            $('.summernote').summernote({
                height: 350,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: false                 // set focus to editable area after initializing summernote
            });
        });
    </script>
</body>
</html>
