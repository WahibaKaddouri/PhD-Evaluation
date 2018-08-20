
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>GCode</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="shortcut icon" href="<c:url value="/resources/CUN/images/favicon.ico"/>">

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


</head>
<style>
    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 90%;
        padding: 12px 20px;
        margin: 8px 26px;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size:16px;
    }

    /* Set a style for all buttons */
    button {
        background-color: #009688;
        color: white;
        padding: 14px 20px;
        margin: 8px 26px;
        border: none;
        cursor: pointer;
        width: 90%;
        font-size:18px;
    }
    button:hover {
        opacity: 0.8;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }
    .avatar {
        width: 200px;
        height:200px;
        border-radius: 50%;
    }

    /* The Modal (background) */
    .modal {
        display:none;
        position: fixed;
        /*z-index: 1;*/
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    /* Modal Content Box */
    .modal-content {
        background-color: #fefefe;
        margin: 4% auto 15% auto;
        border: 1px solid #888;
        width: 40%;
        padding-bottom: 30px;
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }
    .close:hover,.close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        animation: zoom 0.6s
    }
    @keyframes zoom {
        from {transform: scale(0)}
        to {transform: scale(1)}
    }
</style>
<body>
<div id="page-wrapper">
    <!-- Top Bar Start -->
    <div class="topbar">
        <!-- LOGO -->
        <div class="topbar-left">

        </div>
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
                    <!-- User Detail box -->
                    <div class="user-details">
                        <div class="pull-left">
                            <img src="<c:url value="/resources/CUN/images/users/avatar-1.jpg"/>"  alt="" class="thumb-md img-circle">
                        </div>
                        <div class="user-info">
                            <a href="#">Administrateur</a>
                            <p class="text-muted m-0">Administrateur</p>
                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="metisMenu nav" id="side-menu">
                        <li><a href="/AdminSite"><i class="ti-home"></i> Accueil </a></li>
                        <li><a href="/AdminSite/CUN"><i class="fa fa-group"></i> Comission universitaire nationale </a></li>
                        <li><a href="/AdminSite/Administration"><i class="fa fa-group"></i> Administration des établissements </a></li>

                        </li>
                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->
        <div id="page-right-content">

            <div class="container">
                <button onclick="document.getElementById('modal-wrapper').style.display='block' ;" style="width:auto; margin-top:auto; margin-left:800px;">
                    Ajouter administrateur d'un établissement  </button>
            </div>


            <div class="row">
                <div class="col-sm-6">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Liste des administrateurs des établissements </h3>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Etablissement </th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${ !empty usersADM}">
                                    <c:forEach var="l" items="${usersADM}">

                                        <tr>
                                            <td><c:out value="${l.username}"></c:out></td>
                                            <td><c:out value="${l.etablissement}"></c:out></td>
                                            <td><a href="/AdminSite/Delete/${l.getId()}"> supprimer </a></td>
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
        <%--<!-- end container -->--%>



</div>
    </div>
    <!-- End #page-right-content -->

</div>
    <div id="modal-wrapper" class="modal" data-backdrop="true" style="position: absolute">

        <form class="modal-content animate" modelAttribute="userData" method="post" action="${pageContext.request.contextPath}/AdminSite/Administration">
            <div>
                <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
            </div>
            <div class="container">
                <input style="margin-top:30px " class="form-control" type="text" placeholder="Enter Username" name="username">
                <input class="form-control" type="password" placeholder="Enter Password" name="password">
                <select style="width:450px; margin-left:25px; margin-top: 8px; " class="form-control" name="etablissement">
                    <c:forEach var="etablissements" items="${etablissements}">
                        <option value="${etablissements }"><c:out value="${etablissements }"/></option>
                    </c:forEach>
                </select>
                <button type="submit" value="register">Créer Administrateur d'établissement</button>
            </div>

        </form>

    </div>
<!-- end .page-contentbar -->

<script>
    // If user clicks anywhere outside of the modal, Modal will close

    var modal = document.getElementById('modal-wrapper');
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>