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
                    <div class="pull-left">
                        <button type="button" class="button-menu-mobile visible-xs visible-sm">
                            <i class="fa fa-bars"></i>
                        </button>
                        <span class="clearfix"></span>
                    </div>



                    <!-- Top nav Right menu -->
                    <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right">



                        <li class="dropdown top-menu-item-xs">
                            <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true"><img src="../public/images/users/doctor.jpg" alt="user-img" class="img-circle"> </a>
                            <ul class="dropdown-menu">


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
                    <!-- User Detail box -->
                    <div class="user-details">
                        <div class="pull-left">
                            <img src="../../../images/no_user.png" alt="" class="thumb-md img-circle">
                        </div>
                        <div class="user-info">
                            <a href="#">${ens.nom}</a>
                            <p class="text-muted m-0">${ens.prenom}</p>
                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href=""><i class="ti-home"></i> ${ens.id_etablissement} </a></li>
                        <li><a href="/CUN/Profile/${ens.id}"><i class="ti-user m-r-10"></i> Profil</a></li>


                    </ul>

                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->

        <!-- START PAGE CONTENT -->
        <div id="page-right-content">
            <div class="row">
                <div class="col-sm-12">
                    <h4 class="header-title m-t-0" style="color: #B76A47;"> Evaluation de l'enseignant  </h4>
                </div>
            </div>
            <div class="row">



                    <div class="fc-toolbar">

                        <div class="fc-center">
                            <div class="fc-button-group">
                                <div class="table-add" style="float: right;"> <a class="btn btn-custom btn-rounded" href="" data-toggle="modal" data-target="#exampleModal">Valider l'évaluation</a></div>
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Evaluation du candidat :  </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <s:form action="${pageContext.request.contextPath}/CUN/Evaluation/${ens.id}" modelAttribute="grille" method="post">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label"> Candidat :</label>
                                                    <input type="text" placeholder="${ens.nom} ${ens.prenom}" class="form-control" id="recipient-name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-note" class="col-form-label"> Total de points obtenus :</label>
                                                    <s:input type="text" placeholder=""  name ="totalPoints" path="noteFinale" class="form-control" id="recipient-note"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="obs-text" class="col-form-label">Observation :</label>
                                                    <s:select path="observation" name ="observation" class="form-control" id="obs-text">
                                                        <form:option value = "Candidature acceptee" label = "Candidature acceptée"/>
                                                        <form:option value = "Candidature rejetee" label = "Candidature rejetée"/>


                                                    </s:select>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                                <input type="submit" class="btn btn-primary">
                                            </div>
                                            </s:form>
                                        </div>
                                    </div>
                                </div>
                                <br><br><br>

                            </div>
                        </div>
                    </div>
                    <div id="table" class="table-editable">
                        <!-- add -->
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Variable</th>
                                <th>Note</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="l" items="${variables}">
                                <tr>
                                    <td contenteditable="false"> <a href="/CUN/Evaluation/${l.nom}/${ens.id}"> ${l.nom} </a>  </td>
                                    <td contenteditable="false">${l.total_point}</td>

                                </tr>
                            </c:forEach>
                            <!-- This is our clonable table line -->
                            <td ></td>
                            <td contenteditable="true"> ${grille.noteFinale}</td>
                            <td contenteditable="true">${l.total_point}</td>
                            </tbody>
                        </table>
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
