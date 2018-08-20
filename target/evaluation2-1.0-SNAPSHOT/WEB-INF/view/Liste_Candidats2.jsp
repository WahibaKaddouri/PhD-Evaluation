<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!--End of Zendesk Chat Script-->
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
                            <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-user"></i> </a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:void(0)"><i class="ti-user m-r-10"></i> Profil</a></li>

                                <li class="divider"></li>
                                <li> <a href="/logout"><i class="ti-power-off m-r-10"></i> Deconnexion</a>
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
                    <!-- User Detail box -->

                    <!--- End User Detail box -->
                    <br>  <br>  <br>  <br>  <br>  <br>
                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href="/Administration"><i class="ti-home"></i> Accueil </a></li>

                        <li><a href="/Administration/TableauBord"><i class="fa fa-dashboard"></i> Tableau de bord</a></li>



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
                        <h4 class="header-title m-t-0" style="text-align: center;"> Liste des enseignants </h4>
                    </div>
                </div> <!-- end row -->
                </br>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="table-responsive">
                                <table class="table table-hover mails m-0 table table-actions-bar">
                                    <thead style="text-align: center;">
                                    <tr>
                                        <th>Nom </th>
                                        <th>Prenom</th>
                                        <th>Dossier</th>
                                        <th>Profil </th>
                                    </tr>
                                    </thead>

                                    <tbody id="idTabele">
                                    <c:if test="${ !empty liste}">
                                        <c:forEach var="l" items="${liste}">

                                            <tr>
                                                <td><c:out value="${l.nom}"></c:out></td>
                                                <td><c:out value="${l.prenom}"></c:out></td>
                                                <td>
                                                    <a href="/Administration/DossierEns/${l.id}" class="btn btn-default btn-sm btn-icon icon-left" >
                                                        <i class="fa fa-file" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </td>

                                                <td style="color: #067790;">
                                                    <a href="/Administration/Profile/${l.id}" class="btn btn-default btn-sm btn-icon icon-left" >
                                                        <i class="fa fa-user" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </td>

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