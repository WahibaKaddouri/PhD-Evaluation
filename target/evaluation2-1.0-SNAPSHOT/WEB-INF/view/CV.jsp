
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page session="true" %>

<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>MESRS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Bootstrap core CSS -->
    <link href="/resources/css_ens/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.css">
    <link href="/resources/css_ens/table.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css_ens/metisMenu.min.css" rel="stylesheet">
    <!-- Icons CSS -->

    <link href="/resources/css_ens/icons.css" rel="stylesheet">
    <!-- Custom styles for editibale table template -->
    <link href="/resources/css_ens/style.css" rel="stylesheet">
    <!-- Custom styles for editibale table template -->

    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css">
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="../public/css/table.css">
    <!-- Plugins css-->
    <link href="/resources/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
    <link href="/resources/plugins/switchery/switchery.min.css" rel="stylesheet">
    <link href="/resources/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="/resources/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
    <style>
        /*CSS modals*/
        .modal-header,.modal-header h3, .close {
            background-color:#2f2f2f;
            color:white !important;
            text-align: center;
            font-size: 24px;
        }
        .modal-footer {
            background-color: #f9f9f9;
        }
        .modal-dialog{
            top:100px;
        }
    </style>

    <script src="/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
</head>


<body>

<div id="page-wrapper" style="overflow-y: auto;height: 1200px;">

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
                    <div class="user-details" >
                        <div class="pull-left" style="margin-left:20px;">
                            <i class="fa fa-user" style="font-size: 25px;text-align:center;"><p style="font-size:17px;text-align: center">Prénom</p><br><p style="font-size:17px;">Nom candidat</p></i>
                        </div>
                        <div class="user-info">

                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="nav">
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
                    <div class="col-sm-12" style="height:1200px">
                        <h3 class="m-b-20 header-title" style="color: #26C4EC;margin-top: 100px;">Curriculum Vitae</h3>

                        <!---------Activités pédagogiques ------------------>
                        <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="position:absolute;top:150px;width:67.5%;border-radius:50px;">
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
                                <td style="text-align: center" ><a href=""><span>(0)</span>activités</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="apg" href="#" data-toggle="modal" data-target="#modal1"><i class="fa fa-plus"></i></a></div></td>
                            </tr>
                            <tr style="width:100%;background-color:#eeeeee">
                                <th style="border-right:none;"></th>
                                <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Documents édités</th>
                                <th style="border-left:none;"></th>
                            </tr>
                            <tr>

                                <td style="text-align: center">Ajoutez vos ducuments édités : ouvrages, manuels, polycopiés</td>
                                <td style="text-align: center" ><a href=""><span>(0)</span>Documents</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="op" href="#" data-toggle="modal" data-target="#modal2"><i class="fa fa-plus"></i></a></div></td>
                            </tr>

                            <tr style="width:100%;background-color:#eeeeee">
                                <th style="border-right:none;"></th>
                                <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Encadrement</th>
                                <th style="border-left:none;"></th>
                            </tr>
                            <tr>

                                <td style="text-align: center">Ajoutez vos encadrement de master, magister ou doctorat. Ne seront pris en compte que les mémoires et thèses encadrés et soutenus</td>
                                <td style="text-align: center" ><a href=""><span>(0)</span>Encadrement</a></td>

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
                                <td style="text-align: center" ><a href=""><span>(0)</span>publications</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="asp" href="#" data-toggle="modal" data-target="#modal4"><i class="fa fa-plus"></i></a></div></td>
                            </tr>
                            <tr style="width:100%;background-color:#eeeeee">
                                <th style="border-right:none;"></th>
                                <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Communications</th>
                                <th style="border-left:none;"></th>
                            </tr>
                            <tr>

                                <td style="text-align: center">Ajoutez des communications internationales ou nationales</td>
                                    <td style="text-align: center" ><a href=""><span>(0)</span>Communications</a></td>

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
                                <td style="text-align: center" ><a href=""><span>(0)</span>projets</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="pr" href="#" data-toggle="modal" data-target="#modal6"><i class="fa fa-plus"></i></a></div></td>
                            </tr>
                            <tr style="width:100%;background-color:#eeeeee">
                                <th style="border-right:none;"></th>
                                <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;">Animations scientifiques</th>
                                <th style="border-left:none;"></th>
                            </tr>
                            <tr>

                                <td style="text-align: center">Ajoutez des animations scientifiques auxquelles vous avez participé</td>
                                <td style="text-align: center" ><a href=""><span>(0)</span>animations</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="as" href="#" data-toggle="modal" data-target="#modal7"><i class="fa fa-plus"></i></a></div></td>
                            </tr>

                            <tr style="width:100%;background-color:#eeeeee">
                                <th style="border-right:none;"></th>
                                <th style="border-left:none;border-right:none;text-align:center;font-size: 18px;"></th>
                                <th style="border-left:none;"></th>
                            </tr>

                            <tr>

                                <td style="text-align: center">Ajoutez une expertise</td>
                                <td style="text-align: center" ><a href=""><span>(0)</span>Expertise</a></td>

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
                                <td style="text-align: center" ><a href=""><span>(0)</span>responsabilités</a></td>

                                <td style="text-align: center" ><div> <a class="btn btn-custom btn-rounded" class="res" href="#" data-toggle="modal" data-target="#modal9"><i class="fa fa-plus"></i></a></div></td>
                            </tr>



                            </tbody>
                        </table>

                    </div>


        </div>
        <!-- end container -->
                <!-- Modals -->

                <!--Modal activités pédagogique en graduation -->

                <div class="modal fade" id="modal1" z-index="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>Enseignement</h3>
                            </div>


                            <div class="modal-body" style="padding: 10px;">
                                <s:form id="APGForm" modelAttribute="infoAP" action="${pageContext.request.contextPath}/Enseignant/CV/AP" method="post" >
                                        <br/>
                                        <s:label path="type_grad" >Type de graduation</s:label>
                                        <s:select name="type_grad" path="type_grad" class="form-control">
                                        <option value="Selectionnez" selected="selected"></option>
                                        <option value="Graduation">Graduation</option>
                                        <option value="Post-graduation">Post-graduation</option>
                                        </s:select>
                                        <br/>
                                        <s:label path="module">Module enseigné</s:label>
                                        <s:input path="module" id="modapg" type="text" class="form-control" value=""  data-placement="top" data-trigger="manual"/>

                                        <br/>
                                        <s:label path="annee">Année d'enseignement</s:label>
                                        <s:input id="anapg" type="number" path="annee" class="form-control" data-placement="top" data-trigger="manual"/>
                                        <br/>
                                            <s:label path="cycle" >Cycle d'enseignement</s:label>
                                            <s:select name="cycle" path="cycle" class="form-control">
                                    <option value="Selectionnez" selected="selected"></option>
                                    <option value="Système classique">Système classique</option>
                                    <option value="LMD Licence">LMD Licence</option>
                                    <option value="LMD Master">LMD Master</option>
                                    <option value="Doctorat">Doctorat</option>
                                    <option value="Magister">Magister</option>
                                </s:select>
                                        <br/>
                                        </div>

                                        <div class="modal-footer" style="padding: 10px;">
                                        <input type="submit" id="okAPG" class="btn btn-info btn-md" aria-hidden="true" value="Enregistrer"/>
                                        <input id="annulAPG" type="button" class="btn btn-default btn-md" data-dismiss="modal" aria-hidden="true" value="Annuler"/>
                                        </div>
                            </s:form>
                      </div>
                </div>
            </div>

            <!---------------------------------------------------------------------->
                <!--Modal ouvrages pédagogiques -->
                <div class="modal fade" id="modal2" tabindex="-1" role="dialog" data-backdrop="false" contentType="text/html;charset=UTF-8">
                    <div class="modal-dialog modal-sm">
                        <!-- Modal content-->
                        <div class="modal-content" style="padding:0px;">
                            <div class="modal-header">
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
                                <div class="modal-header">
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
                            <div class="modal-header">
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
                            <div class="modal-header">
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
                            <div class="modal-header">
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
                            <div class="modal-header">
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
                            <div class="modal-header">
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
                            <div class="modal-header">
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

                <!-- end container -->

        <div class="footer" style="position:absolute;bottom:-600px;height:50px;width:98%;margin-left:14px;">
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

