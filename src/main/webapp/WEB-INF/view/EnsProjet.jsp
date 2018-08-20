<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>MESRS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="shortcut icon" href="">
    <!-- ION Slider -->
    <link href="/resources/plugins/ion-rangeslider/ion.rangeSlider.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/plugins/ion-rangeslider/ion.rangeSlider.skinModern.css" rel="stylesheet" type="text/css"/>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css_ens/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css_ens/metisMenu.min.css" rel="stylesheet">
    <!-- Icons CSS -->
    <link href="/resources/css_ens/icons.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css_ens/style.css" rel="stylesheet">

</head>


<body>

<div id="page-wrapper" style="width: 90%;height:1000px;">

    <!-- Top Bar Start -->
    <div class="topbar">

        <!-- LOGO -->
        <div class="topbar-left">

        </div>

        <!-- Top navbar -->
        <div class="navbar navbar-default" role="navigation" style="background-color: #067790">
            <div class="container">
                <div class="">

                    <!-- Mobile menu button -->
                    <div class="pull-left">
                        <button type="button" class="button-menu-mobile visible-xs visible-sm">
                            <i class="fa fa-bars"></i>
                        </button>
                        <span class="clearfix"></span>
                    </div>

                    <!-- Top nav left menu -->
                    <ul class="nav navbar-nav hidden-sm hidden-xs top-navbar-items" style="margin-top:-20px;">
                        <li><a href="<%=request.getContextPath()+response.encodeURL("/Enseignant/Accueil")%>">Accueil</a></li>
                        <li><a href="#">Session</a></li>
                        <li><a href="#">Procédure</a></li>
                    </ul>

                    <!-- Top nav Right menu -->
                    <ul class="nav navbar-nav navbar-right top-navbar-items-right">

                        <li class="dropdown top-menu-item-xs">
                            <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true">

                            </a>
                            <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right" style="position:absolute; top:-150px;right:-90px;margin-top:0px;">
                                <li class="dropdown top-menu-item-xs" style="height:80px;">
                                    <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;height:80px;position:absolute;top:50px;right:150px;">
                                        <i class="fa fa-bell" style="padding-top:15px;"></i> <span class="label label-danger" style=""></span>
                                    </a>
                                    <ul class="dropdown-menu p-0 dropdown-menu-lg" style="position:absolute;top: 130px;right: 85px;">
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

                                <li class="dropdown top-menu-item-xs" style="height:80px;padding-top: 14px;position:absolute;top: 50px;right: 85px;">
                                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;right:10px;height:60px;"><i class="fa fa-user" style="font-size: 25px;text-align:center;"></i></a>
                                    <ul class="dropdown-menu">

                                        <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> paramètres</a></li>

                                        <li class="divider"></li>
                                        <li><a href="javascript:void(0)"><i class="ti-power-off m-r-10"></i> Déconnexion</a></li>
                                    </ul>
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


        <!-- START PAGE CONTENT -->
        <div id="page-right-content" style="border:none; margin-left:0px;height:1000px;">

            <div class="container">
                <div class="row" style="">
                    <div class="col-md-12" style="position:absolute;top:95px;">
                        <div class="p-0 text-center">
                            <div class="member-card">
                                <div class="thumb-xl member-thumb m-b-10 center-block">
                                    <img src="/resources/images/userEns.jpg" class="img-circle img-thumbnail" alt="profile-image">
                                    <i class="mdi mdi-star-circle member-star text-success" title="verified user"></i>
                                </div>

                                <div class="">
                                    <h4 class="m-b-5">${nomEns} ${prenomEns}</h4>
                                </div>




                            </div>

                        </div> <!-- end card-box -->

                    </div> <!-- end col -->
                </div> <!-- end row -->

                <div class="m-t-30">
                    <ul class="nav nav-tabs tabs-bordered" style="margin-top:200px;height: 30px;padding-bottom:38px;">
                        <li class="active">
                            <a href="/Enseignant/dossiers2" data-toggle="" aria-expanded="true" style="height:38px;border-radius: 0px;">
                                Constituer mon dossier
                            </a>
                        </li>
                        <li class="" style="height:40px;">
                            <a href="/Enseignant/SoumettreDossier" data-toggle="" aria-expanded="false" style="height:38px;border-radius: 0px;">
                                Soumettre mon dossier
                            </a>
                        </li>
                        <li class="">
                            <a href="/Enseignant/EtatDossier" data-toggle="" aria-expanded="false" style="height:38px;border-radius: 0px;">
                                Etat de mon dossier
                            </a>
                        </li>
                        <li class="">
                            <a href="/Enseignant/Profil/${ensId}" data-toggle="" aria-expanded="false" style="height:38px;border-radius: 0px;">
                                Profile
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" style="height:100%">
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="header-title m-t-0" style=" text-align: center;">Les projets</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <div class="table-responsive">
                                        <table class="table table-hover mails m-0 table table-actions-bar">
                                            <thead style="text-align: center;">
                                            <tr>
                                                <th>Type de projet </th>
                                                <th>Qualité</th>
                                                <th>Titre du projet</th>
                                                <th>Année</th>


                                            </tr>
                                            </thead>

                                            <tbody id="idTabele">
                                            <c:forEach var="projet" items="${projet}">
                                                <tr>
                                                    <td> ${projet.getType()}   </td>
                                                    <td> ${projet.getQualité()} </td>
                                                    <td> ${projet.getTitre()}  </td>
                                                    <td> ${projet.getAnnee()}  </td>

                                                    <td><a onclick="alert('activité supprimée !')" href="/Enseignant/Projet/Supp/${ensId}/${projet.getId_pro()}" style="color:red;"><u>              Supprimer</u></a></td>
                                                    <td><a  class="apg" href="/Enseignant/Projet/Update/${ensId}/${projet.getId_pro()}" data-toggle="modal" data-target="#modal6" style="color:blue;"><u>             Modifier</u></a></td>
                                                    <td>
                                                        <div class="modal fade" id="modal6" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                                                            <div class="modal-dialog modal-sm">
                                                                <!-- Modal content-->
                                                                <div class="modal-content" style="padding:0px;">
                                                                    <div class="modal-header" style="text-align:center;">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h3>Projet</h3>
                                                                    </div>
                                                                    <div class="modal-body" style="padding: 10px;">
                                                                        <form id="infoPR" action="/Enseignant/Projet/Update/${ensId}/${projet.getId_pro()}" method="post" >

                                                                            <br/>
                                                                            <label>Type projet</label>
                                                                            <input value="${projet.type}" name="type" type="text" class="form-control" data-placement="top" data-trigger="manual"/>

                                                                            <br/>
                                                                            <label>Qualité</label>
                                                                            <select value="${projet.qualité}" class="form-control" name="qualite">
                                                                                <option value="Membre">membre</option>
                                                                                <option value="Responsable">reponsable</option>
                                                                            </select>
                                                                            <br/>
                                                                            <label>Titre</label>
                                                                            <input value="${projet.titre}" name="titre" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                                                            <br/>

                                                                            <label >Année</label>
                                                                            <input value="${projet.annee}" name="annee" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                                                            <br/>


                                                                            <div class="modal-footer" style="padding: 10px;">
                                                                                <input onclick="alert('activité modifiée !')" type="submit" id="okPR" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                                                                <input id="annulpr" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                                                            </div>

                                                                        </form>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>


                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="profile-b1">
                            <!-- Personal-Information -->
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="m-b-20">



                                    </div>
                                </div>
                            </div><!-- Row -->

                            <!-- Personal-Information -->
                        </div>
                    </div>
                </div>
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


<script src="/resources/js_ens/bootbox.min.js"></script>
<script src="/resources/js_ens/script.js"></script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js_ens/jquery-2.1.4.min.js"></script>
<script src="/resources/js_ens/bootstrap.min.js"></script>
<script src="/resources/js_ens/metisMenu.min.js"></script>
<script src="/resources/js_ens/jquery.slimscroll.min.js"></script>
<!-- Ion Range slider js -->
<script src="/resources/plugins/ion-rangeslider/ion.rangeSlider.min.js"></script>
<script src="/resources/pages/jquery.range-sliders.js"></script>
<!-- App Js -->
<script src="/resources/js_ens/jquery.app.js"></script>

<!--Morris Chart-->
<script src="/resources/plugins/morris.min.js"></script>
<script src="/resources/plugins/raphael-min.js"></script>
<script src="/resources/pages/jquery.morris.init.js"></script>

</body>
</html>
