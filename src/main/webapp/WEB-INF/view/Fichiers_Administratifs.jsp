<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/03/2018
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
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


        </div>
    </div>
    <!-- Top Bar End -->


    <!-- Page content start -->
    <div class="page-contentbar" style="height: 700px;">

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


        <div id="page-right-content" style="height: 700px">

            <div class="container" style="height:700px;position:absolute;top:100px;">
                <div class="row">
                    <div class="col-sm-12" style="width:80%;margin-left:100px;">
                        <h3 class="m-b-20 header-title" style="color: #26C4EC">Dossier candidat</h3>

                        <div class="row" style="padding: 10px;">
                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-hover mails m-0 table table-actions-bar">
                                        <thead>

                                        </thead>

                                        <tbody id="idTabele">

                                            <tr>

                                                <h3>Documents pédagogiques :</h3>

                                            </tr>

                                            <c:forEach var="file" items="${fichiers1}">
                                            <tr>
                                                <a href="/resources/files/Pédagogiques/${idEns}/${file}"><c:out value="${file}"></c:out></a>
                                                <br>


                                            </tr>

                                            </c:forEach>
                                            <tr>

                                                <h3>Documents administratifs :</h3>

                                            </tr>

                                            <c:forEach var="file" items="${fichiers}">
                                                <tr>
                                                    <a href="/resources/files/Administratifs/${idEns}/${file}"><c:out value="${file}"></c:out></a>
                                                    <br>


                                                </tr>

                                            </c:forEach>


                                            <tr>

                                                <h3>Informations sur le candidat :</h3>

                                            </tr>

                                            <tr>

                                                <h4>Ouvrages </h4>
                                                <a href="/Administration/Ouvrages/${idEns}">Ouvrages </a>

                                            </tr>
                                            <tr>

                                                <h4>Publications </h4>
                                                <a href="/Administration/Publications/${idEns}">Publications </a>

                                            </tr>

                                            <tr>

                                                <h4>Encadrement </h4>
                                                <a href=" /Administration/Encadrements/${idEns}">Encadrement </a>

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

            <div class="footer" style="height:50px;">
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
</div>
</body>
</html>
