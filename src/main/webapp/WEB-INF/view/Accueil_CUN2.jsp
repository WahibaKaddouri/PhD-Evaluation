<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title> GCode </title>
    <link rel="shortcut icon" href="<c:url value="/resources/CUN/images/favicon.ico"/>" />

    <!-- The styles -->
    <link rel="stylesheet" href="<c:url value="/resources/CUN/css/bootstrap.min.css"/>" />
    <link href="<c:url value="/resources/CUN/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" >
    <link href="<c:url value="/resources/CUN/css/icon-styles.css"/>" rel="stylesheet" type="text/css" >
    <link href="<c:url value="/resources/CUN/css/icons.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/CUN/css/animate.css"/>" rel="stylesheet" type="text/css" >
    <link href="<c:url value="/resources/CUN/css/owl.carousel.css"/>" rel="stylesheet" type="text/css" >
    <link href="<c:url value="/resources/CUN/css/venobox.css"/>" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" href="<c:url value="/resources/CUN/css/_styles.css"/>" />
    <style media="screen">
        .floatCenter{
            float: right;
            position: relative;
            left: -50%;
        }
        .clear{
            clear: both;
        }
        .height350{
            height: 350px;
        }
    </style>
</head>

<body>



<!--  HEADER -->
<header class="main-header clearfix">
    <section class="header-wrapper navgiation-wrapper">
        <div class="navbar navbar-default">
            <div class="container clearfix">
                <div class="navbar-collapse collapse pull-left" style="margin-left:.5em;float:left;">
                    <ul class="nav navbar-nav">
                        <li><a  class="link-active" style="margin-left:1.5em">Accueil</a></li>
                        <li><a >À propos</a></li>
                        <li><a >Services</a></li>
                        <li><a >Aide</a></li>
                        <li><a >Contact</a></li>
                    </ul> <!-- end .nav .navbar-nav  -->
                </div>
                <div class="navbar-header pull-right">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
            </div> <!-- end .container  -->
        </div> <!-- end .navbar .navbar-default  -->
    </section>


</header>
<div class="slider-wrap">
    <div id="slider_1" class="owl-carousel owl-theme">
        <div class="item">
            <img src="<c:url value="/resources/CUN/images/sout.jpg"/>" alt="img">
            <div class="slider-content">
                <div class="container">
                    <h3 style="color:;"><c:out value="${etablissement}"></c:out></h3>
                    <p></p>
                    <a  class="btn btn-slider" href="/Administration/Listecandidat/">Consulter la liste des enseignants</a>

                </div><!-- /.slider-content -->
            </div>
        </div>

        <div class="item">
            <img src="<c:url value="/resources/CUN/images/sout2.jpeg"/>" alt="img">
            <div class="slider-content">
                <div class="container">
                    <h3 style="color:;">Commission universitaire nationale</h3>
                    <p></p>
                    <a  class="btn btn-slider" href="/Administration/Listecandidat/">Consulter la liste des enseignants</a>

                </div><!-- /.slider-content -->
            </div>
        </div>


    </div>
</div>





<!--  HOME HIGHLIGHTS SECTION 1 -->
<!--  end our-services -->
<!-- FOOTER  -->
<footer>
    <section class="section-content-block footer-widget-area-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-7">
                    <div class="footer-widget-area">
                        <div class="footer-logo" >
                            <!--<img src="./public/images/logo-footer.png" alt="Logo" width="156">-->
                            GCode
                        </div>
                        <div class="contact-info divider-line">
                            <p>Gcode est une SII.</p>
                        </div>
                        <div class="contact-info">
                            <div class="contact-details">
                                <div class="social-icons">
                                    <a >
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <a >
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                    <a >
                                        <i class="fa fa-pinterest-p"></i>
                                    </a>
                                    <a >
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                    <a >
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end .footer-widget-area  -->
                </div> <!-- end .col-md-4  -->

                <div class="col-md-3 col-sm-5">
                    <div class="footer-widget-area">
                        <h3>Informations</h3>
                        <div class="contact-info divider-line">
                            <div class="contact-heading">Addresse:</div>
                            <div class="contact-details">
                                Oued Smar, Alger
                            </div>
                        </div>
                        <div class="contact-info divider-line">
                            <div class="contact-heading">Telephone:</div>
                            <div class="contact-details">
                                (+213)00-00-00
                            </div>
                            <div class="contact-heading">Email:</div>
                            <div class="contact-details color-primary">
                                <a href="mailto:support@orca.dz">support@gcode.dz</a>
                            </div>
                        </div>
                        <div class="contact-info">
                            <div class="contact-heading">Horraire:</div>
                            <div class="contact-details">
                                Dimanche - Jeudi (9am - 6pm)
                            </div>
                        </div>
                    </div> <!-- end .footer-widget-area  -->
                </div> <!-- end .col-md-3  -->


                <div class="col-md-3 col-sm-6">
                    <div class="footer-widget-area newsletter-footer">
                        <h3>Newsletter</h3>
                        <p>Entrez votre e-mail pour recevoir nos nouveautés</p>
                        <form id="mc-form" class="mc-form fix" action="">
                            <div class="newsletter-form">
                                <input id="mc-email" name="EMAIL" placeholder="Email Address..." type="email">
                                <button id="mc-submit" type="submit">
                                    <i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </form>
                        <div class="mailchimp-alerts text-centre fix">
                            <div class="mailchimp-submitting"></div>
                            <div class="mailchimp-success"></div>
                            <div class="mailchimp-error"></div>
                        </div>

                    </div> <!-- end .footer-widget-area  -->
                </div> <!-- end .col-md-3  -->

            </div> <!-- end .row  -->
        </div> <!-- end .container  -->
    </section> <!--  end .footer-widget-area-bg -->

    <!--FOOTER CONTENT  -->
    <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                             <span>
                            Copyright © 2016. All right reserved by
                            <a class="color-primary" href="emGiin">GCode Inc</a>
                            </span>
                </div> <!-- end .col-md-6  -->
                <div class="col-md-6 col-sm-12">
                    <div class="footer-nav">
                        <nav>
                            <ul>
                                <li>
                                    <a>Accueil</a>
                                </li>
                                <li>
                                    <a>À propos</a>
                                </li>
                                <li>
                                    <a>Services</a>
                                </li>
                                <li>
                                    <a>Aide</a>
                                </li>
                                <li>
                                    <a>Blog</a>
                                </li>
                                <li>
                                    <a>Contact</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div> <!-- end .col-md-6  -->
            </div> <!-- end .row  -->
        </div> <!-- end .container  -->
    </section>  <!--  end .footer-area -->
</footer> <!--  end of footer -->

<!-- Back To Top Button  -->
<a id="backTop" class="fa fa-arrow-circle-up"><i class="fa fa-arrow-circle-up"></i></a>

<script src="<c:url value="/resources/CUN/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/wow.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/jquery.backTop.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/waypoints.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/waypoints-sticky.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/jquery.stellar.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/jquery.counterup.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/venobox.min.js"/>"></script>
<script src="<c:url value="/resources/CUN/js/custom-scripts.js"/>"></script>
</body>
</html>