<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/03/2018
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css">
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="../public/css/table.css">
    <!-- Plugins css-->
    <link href="/resources/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
    <link rel="stylesheet" href="../public/plugins/switchery/switchery.min.css">
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
    <div class="page-contentbar" style="height: 600px;">

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


        <div id="page-right-content" style="height: 600px">

            <div class="container" style="height:600px;position:absolute;top:100px;">
                <div class="row">
                    <div class="col-sm-12" style="width:80%;margin-left:100px;">
                        <h3 class="m-b-20 header-title" style="color: #26C4EC">Demande</h3>
                        <div class="form-group">
                            <label class="col-md-6 control-label">Rédigez votre demande</label>
                            <div class="col-md-10">
                                <s:form id="demForm" modelAttribute="infoDem" action="${pageContext.request.contextPath}/Enseignant/Demande" method="post">

                                    <s:textarea value="entrez votre demande" path="contenu" style="width:100%;height:200px;"></s:textarea>

                                    <p style="text-align:right;">Nombre de caractères : 0 / <span style="color:red;">2000</span></p>
                                    <span class="input-group-btn" style="position:absolute; bottom:-100px;left:450px;">
                                <i class="fa fa-save"></i><input type="submit" value=" Enregistrer" class="btn btn-info btn-md"/>
                                </span>
                                    <span class="input-group-btn" style="position:absolute; bottom:-100px;left:200px;">
                                <a class="btn btn-default btn-md" href="#"><i class="fa fa-undo"> &nbsp; Annuler &nbsp;&nbsp;</i></a>
                                </span>
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- end row -->
    </div>
    <!-- end container -->



    <!-- end container -->

    <div class="footer" style="position:absolute;bottom:-5px;left:14px;height:50px;width:98%; ">
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
<script src="/resources/js/jquery.app.js"></script>
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

