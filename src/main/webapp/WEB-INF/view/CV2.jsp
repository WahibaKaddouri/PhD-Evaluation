
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
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

<div id="page-wrapper" style="width: 90%;height:2000px;">

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
                        <li><a  href="<%=request.getContextPath()+response.encodeURL("/Enseignant/Accueil")%>">Accueil</a></li>
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
        <div id="page-right-content" style="border:none; margin-left:0px;height:2000px;">

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
                            <a href="/Enseignant/Profil" data-toggle="" aria-expanded="false" style="height:38px;border-radius: 0px;">
                                Profile
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" style="height:100%">
                        <div class="row" style="margin-left:50px;margin-right:50px;">

                            <div class="col-sm-12" style="height:2000px">
                                <h3 class="m-b-20 header-title" style="color: #26C4EC;margin-top: 20px;">Curriculum Vitae</h3>

                                <!---------Activités pédagogiques ------------------>
                                <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="position:absolute;top:70px;width:67.5%;border-radius:50px;">
                                    <i class="fa fa-li"></i>
                                    Activités pédagogiques après le passage au grade de maître de conférence A</div>
                                <table class="table table-bordered" style="margin-top:70px;">
                                    <thead >
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;width:33%" ></th>
                                        <th style="border-left:none;border-right:none;width:33%;text-align:center;font-size: 18px;">Enseignements</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <td style="text-align: center">Ajoutez des actvités d'enseignement que vous avez effectué en graduation et en post-graduation</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Enseignements/${ensId}"><span></span>activités</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="apg" href="#" data-toggle="modal" data-target="#modal1"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;"></th>
                                        <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Documents édités</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    <tr>

                                        <td style="text-align: center">Ajoutez vos ducuments édités : ouvrages, manuels, polycopiés</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Ouvrage/${ensId}"><span></span>Documents</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="op" href="#" data-toggle="modal" data-target="#modal2"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>

                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;"></th>
                                        <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Encadrement</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    <tr>

                                        <td style="text-align: center">Ajoutez vos encadrement de master, magister ou doctorat. Ne seront pris en compte que les mémoires et thèses encadrés et soutenus</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Encadrements/${ensId}"><span></span>Encadrement</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="ep" href="#" data-toggle="modal" data-target="#modal3"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>

                                    </tbody>
                                </table>


                                <!-----------Activités scientifiques ------------------------------------------------------>

                                <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="width:67.5%;border-radius:50px;">
                                    <i class="fa fa-li"></i>
                                    Activités scientifiques après le passage au grade de maître de conférence A</div>
                                <table class="table table-bordered" style="margin-top:30px;">
                                    <thead >
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;width:33%" ></th>
                                        <th style="border-left:none;border-right:none;width:33%;text-align:center;font-size: 18px;">Publications</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <td style="text-align: center">Ajoutez des publications internationales ou nationales avec acte</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Publication/${ensId}"><span></span> publications</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="asp" href="#" data-toggle="modal" data-target="#modal4"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;"></th>
                                        <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Communications</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    <tr>

                                        <td style="text-align: center">Ajoutez des communications internationales ou nationales</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Communications/${ensId}"><span></span>Communications</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="asc" href="#" data-toggle="modal" data-target="#modal5"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>


                                    </tbody>
                                </table>


                                <!-----------Autres activités ------------------------------------------------------>

                                <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="width:67.5%;border-radius:50px;">
                                    <i class="fa fa-li"></i>
                                    Autres activités de recherche après le passage au grade de maître de conférence "A"</div>
                                <table class="table table-bordered" style="margin-top:30px;">
                                    <thead >
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;width:33%" ></th>
                                        <th style="border-left:none;border-right:none;width:33%;text-align:center;font-size: 18px;">Projets de recherche</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <td style="text-align: center">Ajoutez des projets de recherche auxquels vous avez participén, en tant que membre ou reponsable</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Projet/${ensId}"><span></span>projets</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="pr" href="#" data-toggle="modal" data-target="#modal6"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;"></th>
                                        <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Animations scientifiques</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    <tr>

                                        <td style="text-align: center">Ajoutez des animations scientifiques auxquelles vous avez participé</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Animation/${ensId}"><span></span>animations</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="as" href="#" data-toggle="modal" data-target="#modal7"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>

                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;"></th>
                                        <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;"></th>
                                        <th style="border-left:none;"></th>
                                    </tr>

                                    <tr>

                                        <td style="text-align: center">Ajoutez une expertise</td>
                                        <td style="text-align: center" ><a href="/Enseignant/Expertise/${ensId}"><span></span>Expertise</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="exp" href="#" data-toggle="modal" data-target="#modal8"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>


                                    </tbody>
                                </table>



                                <!-----------Responsabilités------------------------------------------------------>

                                <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="width:67.5%;border-radius:50px;">
                                    <i class="fa fa-li"></i>
                                    Responsabilités administratives et scientifiques après le passage au grade de maître de conférences "A":</div>
                                <table class="table table-bordered" style="margin-top:30px;">
                                    <thead >
                                    <tr style="width:100%;background-color:#eeeeee">
                                        <th style="border-right:none;width:33%" ></th>
                                        <th style="border-left:none;border-right:none;width:33%;text-align:center;font-size: 18px;">Responsabilités occupées</th>
                                        <th style="border-left:none;"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <td style="text-align: center">Citez les postes de responsabilités occupés en précisant le nombre d'année </td>
                                        <td style="text-align: center" ><a href="/Enseignant/Responsabilite/${ensId}"><span></span>responsabilités</a></td>

                                        <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="res" href="#" data-toggle="modal" data-target="#modal9"><i class="fa fa-plus"></i></a></div></td>
                                    </tr>



                                    </tbody>
                                </table>

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

                <!-- Modals -->

                <!--Modal activités pédagogique en graduation -->

                <div class="modal fade" id="modal1" z-index="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align: center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Enseignement</h3>
                            </div>


                            <div class="modal-body" style="padding: 10px;">
                                <form id="APGForm" action="/Enseignant/CV/AP" method="post" >
                                    <br/>
                                    <label  >Type de graduation</label>
                                    <select name="type_grad" type="text" class="form-control">
                                        <option value="Selectionnez" selected="selected"></option>
                                        <option value="Graduation">Graduation</option>
                                        <option value="Post-graduation">Post-graduation</option>
                                    </select>
                                    <br/>
                                    <label >Module enseigné</label>
                                    <input name="module" type="text" class="form-control" value=""  data-placement="top" data-trigger="manual"/>

                                    <br/>
                                    <label >Année d'enseignement</label>
                                    <input  type="text" name="annee" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Cycle d'enseignement</label>
                                    <select name="cycle" type="text" class="form-control">
                                        <option value="Selectionnez" selected="selected"></option>
                                        <option value="Système classique">Système classique</option>
                                        <option value="LMD Licence">LMD Licence</option>
                                        <option value="LMD Master">LMD Master</option>
                                        <option value="Doctorat">Doctorat</option>
                                        <option value="Magister">Magister</option>
                                    </select>
                                    <br/>
                            </div>

                            <div class="modal-footer" style="padding: 10px;">
                                <input type="submit" id="okAPG" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                <input id="annulAPG" type="button" class="btn btn-default btn-md" data-dismiss="modal" aria-hidden="true" value="Annuler"/>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!---------------------------------------------------------------------->
                <!--Modal ouvrages pédagogiques -->
                <div class="modal fade" id="modal2" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Documents édités</h3>
                            </div>


                            <div class="modal-body" style="padding: 10px;">

                                <form id="infoOP" action="/Enseignant/CV/OP" method="post" >

                                    <br/>
                                    <label>Type de Document</label>
                                    <select class="form-control" name="type">
                                        <option value="Ouvrage">Ouvrage</option>
                                        <option value="Manuel">Manuel</option>
                                        <option value="Polycopié">Plycopié</option>
                                    </select>
                                    <br/>
                                    <label>Titre</label>
                                    <input name="titre" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label>Auteurs</label>
                                    <input  name="auteurs" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Année d'édition</label>
                                    <input  name="anneeE" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Nombre de pages</label>
                                    <input  name="nb_pages" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label>Maison d'édition</label>
                                    <input  name="maison" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okOP" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulop" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <!----- Modal Encadrement pédagogiques -------------------------->

                <div class="modal fade" id="modal3" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Encadrement</h3>
                            </div>


                            <div class="modal-body" style="padding: 10px;">

                                <form id="infoEP" action="/Enseignant/CV/EP" method="post" >

                                    <br/>
                                    <label>Type Encadrement</label>
                                    <select class="form-control" name="type">
                                        <option value="Memoire master">Memoire master</option>
                                        <option value="Memoire magister">Memoire magister</option>
                                        <option value="Thèse doctorat">Thèse doctorat</option>
                                    </select>
                                    <br/>
                                    <label>Nom et prénom du candidat</label>
                                    <input name="candidat" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label>Titre du mémoire</label>
                                    <input  name="titre" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Date de soutenance</label>
                                    <input  name="date_soutenance" type="date" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okPS" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulps" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <!----- Modal publication scientifique -------------------------->

                <div class="modal fade" id="modal4" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Publication</h3>
                            </div>

                            <div class="modal-body" style="padding: 10px;">

                                <form id="infoPS" action="/Enseignant/CV/PS" method="post" >

                                    <br/>
                                    <label>Type publication</label>
                                    <select class="form-control" name="type">
                                        <option value="nationale">nationale</option>
                                        <option value="internationale">internationale</option>
                                    </select>
                                    <br/>
                                    <label>Titre de l'article</label>
                                    <input name="titre_article" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label>Position de l'auteur</label>
                                    <input  name="position_auteur" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Titre de la revue/journal</label>
                                    <input  name="titre_revue" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Année</label>
                                    <input  name="annee" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Adresse URL </label>
                                    <input  name="url" type="url" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okEP" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulep" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>


                <!----- Modal communication scientifique -------------------------->

                <div class="modal fade" id="modal5" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Communication</h3>
                            </div>
                            <div class="modal-body" style="padding: 10px;">
                                <form id="infoCS" action="/Enseignant/CV/CS" method="post" >

                                    <br/>
                                    <label>Type communication</label>
                                    <select class="form-control" name="type">
                                        <option value="nationale">nationale</option>
                                        <option value="internationale">internationale</option>
                                    </select>
                                    <br/>
                                    <label>Titre de la communication</label>
                                    <input name="titre_com" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label>Position de l'auteur</label>
                                    <input  name="position_auteur" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Titre de la manifestation</label>
                                    <input  name="titre_manif" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Année</label>
                                    <input  name="annee" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>
                                    <label >Adresse URL </label>
                                    <input  name="url" type="url" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okCS" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulcs" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>


                <!----- Animation scientifique -------------------------->

                <div class="modal fade" id="modal7" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Animation</h3>
                            </div>
                            <div class="modal-body" style="padding: 10px;">
                                <form id="infoAS" action="/Enseignant/CV/AS" method="post" >

                                    <br/>
                                    <label>Type animation</label>
                                    <select class="form-control" name="type">
                                        <option value="colloque">colloque</option>
                                        <option value="séminaire">seminaire</option>
                                        <option value="journée d'étude">journee d'etude</option>
                                    </select>

                                    <br/>
                                    <label>Lieu</label>

                                    <input  name="lieu" type="text" class="form-control" data-placement="top" data-trigger="manual"/>

                                    <br/>
                                    <label>Date</label>
                                    <input  name="date" type="date" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <label >Qualité</label>
                                    <select class="form-control" name="qualite">
                                        <option value="organisateur">organisateur</option>
                                        <option value="comite sceintifique">comite sceintifique</option>
                                        <option value="président">président</option>
                                        <option value="Autre">Autre</option>
                                    </select>                                    <br/>


                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okAS" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulas" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>



                <!----- Modal projet recherche -------------------------->

                <div class="modal fade" id="modal6" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Projet</h3>
                            </div>
                            <div class="modal-body" style="padding: 10px;">
                                <form id="infoPR" action="/Enseignant/CV/PR" method="post" >

                                    <br/>
                                    <label>Type projet</label>
                                    <input name="type" type="text" class="form-control" data-placement="top" data-trigger="manual"/>

                                    <br/>
                                    <label>Qualité</label>
                                    <select class="form-control" name="qualite">
                                        <option value="Membre">membre</option>
                                        <option value="Responsable">reponsable</option>
                                    </select>
                                    <br/>
                                    <label>Titre</label>
                                    <input  name="titre" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <label >Année</label>
                                    <input  name="annee" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>


                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okPR" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulpr" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>



                <!----- Modal Expertise -------------------------->

                <div class="modal fade" id="modal8" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Expertise</h3>
                            </div>
                            <div class="modal-body" style="padding: 10px;">
                                <form id="infoEXP" action="/Enseignant/CV/EXP" method="post" >

                                    <br/>
                                    <label>Contexte de l'expertise</label>
                                    <input name="contexte" type="text" class="form-control" data-placement="top" data-trigger="manual"/>

                                    <br/>

                                    <label>Organisme demandeur</label>
                                    <input  name="organisme" type="text" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <label >Année</label>
                                    <input  name="annee" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>


                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okEXP" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulexp" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>


                <!----- Modal Responsabilité -------------------------->

                <div class="modal fade" id="modal9" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header" style="text-align:center;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Responsabilite</h3>
                            </div>
                            <div class="modal-body" style="padding: 10px;">
                                <form id="infoRAS" action="/Enseignant/CV/RAS" method="post" >

                                    <br/>
                                    <label>Responsabilite</label>
                                    <select class="form-control" name="type">
                                        <option value="Directeur">Directeur</option>
                                        <option value="Chef de departement">Chef de departement</option>
                                        <option value="Doyen">Doyen</option>
                                        <option value="President CSD">President CSD</option>
                                        <option value="President CSF">President CSF</option>
                                        <option value="Membre CSD">Membre CSD</option>
                                        <option value="Membre CSF">Membre CSF</option>
                                        <option value="Membre CSU">Membre CSU</option>
                                        <option value="Responsable Master">Responsable Master</option>
                                        <option value="Responsable doctorat">Responsable doctorat</option>
                                    </select>
                                    <br/>

                                    <label>De</label>
                                    <input  name="annee_deb" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <label >A</label>
                                    <input  name="annee_fin" type="number" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>

                                    <label >Structure(Faculte,Departement)</label>
                                    <input  name="structure" type="texte" class="form-control" data-placement="top" data-trigger="manual"/>
                                    <br/>


                                    <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okRESP" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulresp" type="button" class="btn btn-default btn-md" aria-hidden="true" value="Annuler"/>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>

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
<script src="/resources/js_ens/table.js"></script>

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
