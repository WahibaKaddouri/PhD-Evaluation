<DOCTYPE html>

    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-15"
             pageEncoding="UTF-8"%>
    <%@ page session="false" %>

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

        <link href="/resources/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
        <script src="/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
                d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
            _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
                $.src="https://v2.zopim.com/?4p3c7OqA0zvVAAMy3Kh6gWn1I6PNXVjw";z.t=+new Date;$.
                    type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
        </script>
        <!--End of Zendesk Chat Script-->
    </head>


    <body  >

    <div id="page-wrapper">

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


        <div class="page-contentbar" style="height: 700px;">


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
            <div id="page-right-content">
                <div>
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="header-title m-t-0" style=" text-align: center;"> Ouvrages </h4>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="header-title m-t-0" style=" text-align: center;">Encadrement</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-hover mails m-0 table table-actions-bar">
                                        <thead style="text-align: center;">
                                        <tr>
                                            <th>Nom & prenom du candidat </th>
                                            <th>Titre du mémoire</th>
                                            <th>Date de soutenance</th>
                                            <th>Type</th>


                                        </tr>
                                        </thead>

                                        <tbody id="idTabele">
                                        <c:forEach var="encadrement" items="${encadrement}">
                                            <tr>
                                                <td> ${encadrement.getCandidat()}   </td>
                                                <td> ${encadrement.getTitre()} </td>
                                                <td> ${encadrement.getDate_soutenance()}  </td>
                                                <td> ${encadrement.getType()}  </td>

                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                    </div>





                </div>
            </div>

            <div class="footer">
                <div class="pull-right hidden-xs">
                    <strong>MESRS</strong> - Copyright &copy; 2018
                </div>
            </div>

        </div>
        <!-- End #page-right-content -->

    </div>
    <!-- end .page-contentbar -->
    <!-- End #page-wrapper -->
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/resources/js_ens/table.js"></script>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/resources/js_ens/jquery-2.1.4.min.js"></script>
    <script src="/resources/js_ens/bootstrap.min.js"></script>
    <script src="/resources/js_ens/metisMenu.min.js"></script>
    <script src="/resources/js_ens/jquery.slimscroll.min.js"></script>
    <!-- App Js -->
    <script src="/resources/js_ens/jquery.app.js"></script>

    <!--Morris Chart-->
    <script src="/resources/plugins/morris/morris.min.js"></script>
    <script src="/resources/plugins/raphael/raphael-min.js"></script>

    <!-- Dashboard init -->
    <script src="/resources/pages/jquery.dashboard.js"></script>

    <!-- App Js -->
    <script src="/resources/js/jquery.app.js"></script>
    <script src="/resources/js/bootbox.min.js"></script>

    <script type="text/javascript"> </script>





    </body>
    </html>

