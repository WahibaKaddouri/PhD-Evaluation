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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="<c:url value="/resources/CUN/css/icons.css"/>" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/CUN/css/style.css"/>" rel="stylesheet">

    <link href="<c:url value="/resources/SummaryEnseignants/style.css"/>" rel="stylesheet" type="text/css" >
    <script src="<c:url value="/resources/SummaryEnseignants/style.js"/>"></script>
    <script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
            d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
            $.src="https://v2.zopim.com/?4p3c7OqA0zvVAAMy3Kh6gWn1I6PNXVjw";z.t=+new Date;$.
                type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
    </script>
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




                    <!-- Top nav Right menu -->

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
                    <div class="user-details">

                        <div class="user-info">
                            <p style="font-size: 20px; color: #067790; "><b>Comission Universitaire</br> Nationale </br> </b></p>
                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href="/CUN"><i class="ti-home"></i> Accueil </a></li>

                        <li><a href="/CUN/TableauBord"><i class="fa fa-dashboard"></i> Tableau de bord</a></li>



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
                        <h4 class="header-title m-t-0" style="color: #B76A47;"> Liste des enseignants </h4>
                    </div>
                </div> <!-- end row -->
                </br>


                <div class="container">
                    <div class="row">

                        <section class="content">

                            <div class="col-md-12 col-md-offset-0">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="pull-right">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-success btn-filter" data-target="pagado">Candidatures acceptées</button>
                                                <button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Candidatures non évaluées</button>
                                                <button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Candidatures rejetées</button>
                                                <button type="button" class="btn btn-default btn-filter" data-target="all">Toutes les candidatures</button>
                                            </div>
                                        </div>
                                        <div class="table-container">
                                            <table class="table table-filter">
                                                <tbody>

                                                <c:if test="${ !empty liste2}">
                                                    <c:forEach var="l" items="${liste2}">
                                                        <tr data-status="cancelado">

                                                            <td>
                                                                <div class="media">
                                                                    <a href="#" class="pull-left">
                                                                        <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                                                    </a>
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Evalué</span>
                                                                        <h4 class="title">
                                                                            <a href="/CUN/Evaluation/${l.id}"> <c:out value="${l.prenom}"></c:out>  <c:out value="${l.nom}"></c:out></a>
                                                                            <span class="pull-right cancelado">(Candidature Rejetee)</span>
                                                                        </h4>
                                                                        <p class="summary">${l.id_etablissement}</p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${ !empty liste1}">
                                                    <c:forEach var="l" items="${liste1}">
                                                        <tr data-status="pagado" class="selected">

                                                            <td>
                                                                <div class="media">
                                                                    <a href="#" class="pull-left">
                                                                        <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                                                    </a>
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Evalué</span>
                                                                        <h4 class="title">
                                                                            <a href="/CUN/Evaluation/${l.id}"> <c:out value="${l.prenom}"></c:out>  <c:out value="${l.nom}"></c:out></a>
                                                                            <span class="pull-right pagado">(Candidature Acceptee)</span>
                                                                        </h4>
                                                                        <p class="summary">${l.id_etablissement}</p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${ !empty liste3}">
                                                    <c:forEach var="l" items="${liste3}">
                                                        <tr data-status="pendiente">

                                                            <td>
                                                                <div class="media">
                                                                    <a href="#" class="pull-left">
                                                                        <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                                                    </a>
                                                                    <div class="media-body">
                                                                        <span class="media-meta pull-right">Non Evalué</span>
                                                                        <h4 class="title"><a href="/CUN/Evaluation/${l.id}"> <c:out value="${l.prenom}"></c:out>  <c:out value="${l.nom}"></c:out></a>

                                                                            <span class="pull-right pendiente">(Candidature Non Evaluée)</span>
                                                                        </h4>
                                                                        <p class="summary">${l.id_etablissement}</p>
                                                                    </div>
                                                                </div>
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
                        </section>

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