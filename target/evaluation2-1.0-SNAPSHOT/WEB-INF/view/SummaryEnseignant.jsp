<%--
  Created by IntelliJ IDEA.
  User: Wahiba Kaddouri
  Date: 03/05/2018
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Résulats de l'évaluation</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <link href="<c:url value="/resources/SummaryEnseignants/style.css"/>" rel="stylesheet" type="text/css" >
    <script src="<c:url value="/resources/SummaryEnseignants/style.js"/>"></script>
</head>
<body>

<div class="container">
    <div class="row">

        <section class="content">
            <h1>Table Filter</h1>
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success btn-filter" data-target="pagado">Candidature acceptée</button>
                                <button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
                                <button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Candidature rejetée</button>
                                <button type="button" class="btn btn-default btn-filter" data-target="all">Toutes les candidatures</button>
                            </div>
                        </div>
                        <div class="table-container">
                            <table class="table table-filter">
                                <tbody>
                                <tr data-status="pagado">
                                    <td>
                                        <div class="ckbox">
                                            <input type="checkbox" id="checkbox1">
                                            <label for="checkbox1"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="star">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                            </a>
                                            <div class="media-body">
                                                <span class="media-meta pull-right">Febrero 13, 2016</span>
                                                <h4 class="title">
                                                    Lorem Impsum
                                                    <span class="pull-right pagado">(Pagado)</span>
                                                </h4>
                                                <p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr data-status="pendiente">
                                    <td>
                                        <div class="ckbox">
                                            <input type="checkbox" id="checkbox3">
                                            <label for="checkbox3"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="star">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                            </a>
                                            <div class="media-body">
                                                <span class="media-meta pull-right">Febrero 13, 2016</span>
                                                <h4 class="title">
                                                    Lorem Impsum
                                                    <span class="pull-right pendiente">(Pendiente)</span>
                                                </h4>
                                                <p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr data-status="cancelado">
                                    <td>
                                        <div class="ckbox">
                                            <input type="checkbox" id="checkbox2">
                                            <label for="checkbox2"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="star">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                            </a>
                                            <div class="media-body">
                                                <span class="media-meta pull-right">Febrero 13, 2016</span>
                                                <h4 class="title">
                                                    Lorem Impsum
                                                    <span class="pull-right cancelado">(Cancelado)</span>
                                                </h4>
                                                <p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr data-status="pagado" class="selected">
                                    <td>
                                        <div class="ckbox">
                                            <input type="checkbox" id="checkbox4" checked>
                                            <label for="checkbox4"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="star star-checked">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                            </a>
                                            <div class="media-body">
                                                <span class="media-meta pull-right">Febrero 13, 2016</span>
                                                <h4 class="title">
                                                    Lorem Impsum
                                                    <span class="pull-right pagado">(Pagado)</span>
                                                </h4>
                                                <p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr data-status="pendiente">
                                    <td>
                                        <div class="ckbox">
                                            <input type="checkbox" id="checkbox5">
                                            <label for="checkbox5"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="star">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <div class="media">
                                            <a href="#" class="pull-left">
                                                <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
                                            </a>
                                            <div class="media-body">
                                                <span class="media-meta pull-right">Febrero 13, 2016</span>
                                                <h4 class="title">
                                                    Lorem Impsum
                                                    <span class="pull-right pendiente">(Pendiente)</span>
                                                </h4>
                                                <p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content-footer">
                    <p>
                        Page © - 2016 <br>
                        Powered By <a href="https://www.facebook.com/tavo.qiqe.lucero" target="_blank">TavoQiqe</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
</div>

</body>
</html>
