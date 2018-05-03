
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>Ora</title>
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

    <!-- The styles -->

    <link rel="stylesheet" href="./public/css/_styles.css" />
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

<body>



<!--  HOME SLIDER BLOCK  -->
<div class="slider-wrap">
    <div id="slider_1" class="owl-carousel owl-theme">
        <div class="item">
            <img src="./public/images/sout.jpg" alt="img">
            <div class="slider-content">
                <div class="container">
                    <h3 style="text-align: center; font-family: 'Baskerville Old Face'; color:;"><b> REPUBLIQUE ALGERIENNE DEMOCRATIQUE ET POPULAIRE <br>
                        Ministere de l enseignement superieur et de la recherche scientifique</b> </h3>

                </div><!-- /.slider-content -->
            </div>
        </div>


        <div class="item">
            <img src="./public/images/sout2.jpeg" alt="img">
            <div class="slider-content">
                <div class="container">
                    <h3 style="text-align: center; font-family: 'Baskerville Old Face'; color:;"><b> REPUBLIQUE ALGERIENNE DEMOCRATIQUE ET POPULAIRE <br>
                        Ministere de l enseignement superieur et de la recherche scientifique </b></h3>

                </div><!-- /.slider-content -->
            </div>
        </div>


    </div>
</div>

<!--  HOME HIGHLIGHTS SECTION 1 -->
<section class="section-content-block section-home-highlights">
    <div class="container wow fadeInUp" style="margin-left: 200px;">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="highlight-block xs-margin margin-bottom-20">
                    <div class="highlight-block-inner height350">
                        <i class="fa fa-user" aria-hidden="true" style="margin-left: 70px;"></i>
                        <h5 class="clear" style="text-align: center; color: #067790;">Espace enseignant</h5>
                        <p style="text-align: center;">Inscription de l'enseignants & depot du dossier(administratif & pédagogique)</p><br>
                        <a class="bg_1" href="<%=request.getContextPath()+response.encodeURL("/Enseignant/dossiers")%>"> </a>
                    </div> <!--  end .main_highlights  -->
                </div> <!--  end .main_highlights  -->
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="highlight-block xs-margin margin-bottom-20">
                        <div class="highlight-block-inner height350">
                            <i class="fa fa-user" aria-hidden="true" style="margin-left: 70px;"></i>
                            <h5 class="clear" style="text-align: center; color: #067790;">Espace CUN</h5>
                            <p style="text-align: center;">Evaluation du dossier de l'enseignant</p><br>
                            <a class="bg_1" href="<%=request.getContextPath()+response.encodeURL("/CUN")%>"> </a>
                        </div> <!--  end .main_highlights  -->
                    </div> <!--  end .main_highlights  -->
                </div> <!--  end .col-md-3  -->

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="highlight-block xs-margin margin-bottom-20">
                        <div class="highlight-block-inner height350">
                            <i class="fa fa-user" aria-hidden="true" style="margin-left: 70px;"></i>
                            <h5 class="clear" style="text-align: center; color: #067790;">Espace Administration</h5>
                            <p style="text-align: center;">Vérification de l'authenticité du dossier de l'enseignant</p>
                            <a class="bg_1" href="<%=request.getContextPath()+response.encodeURL("/Administration")%>"> </a>
                        </div> <!--  end .main_highlights  -->
                    </div> <!--  end .main_highlights  -->
                </div> <!--  end .col-md-3  -->




            </div> <!--  end .row  -->


        </div> <!--  end .container  -->

</section> <!--  end our-services -->
<footer>
    <section class="section-content-block footer-widget-area-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-7">
                    <div class="footer-widget-area">
                        <div class="contact-info">
                            <div class="contact-details">

                                <div class="social-icons" style="margin-top: 160px;">
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
                        <h3>Contactez-nous</h3>
                        <div class="contact-info divider-line">
                            <div class="contact-heading">Addresse:</div>
                            <div class="contact-details">
                                11 chemin Doudou Mokhtar Ben Aknoun Alger - Algerie
                            </div>
                        </div>
                        <div class="contact-info divider-line">
                            <div class="contact-heading">Telephone:</div>
                            <div class="contact-details">
                                +213 (0) 23-23-80-66
                            </div>
                            <div class="contact-heading">FAX:</div>
                            <div class="contact-details">
                                +213 (0) 23-23-80-14
                            </div>
                            <div class="contact-heading">Email:</div>
                            <div class="contact-details color-primary">
                                <a href="mailto:support@orca.dz">webmaster@mesrs.dz</a>
                            </div>
                        </div>
                        <div class="contact-info">
                            <div class="contact-heading" style="text-align: center;">Journées de réception</div> <br>
                            <div class="contact-details">

                                Lundi de 09H00 à 15H30
                            </div>
                            <div class="contact-details">

                                Jeudi de 09H00 à 12H00
                            </div>
                        </div>

                        <div class="col-md-2 col-sm-6">

                        </div> <!-- end .col-md-2  -->
                    </div> <!-- end .footer-widget-area  -->
                </div> <!-- end .col-md-3  -->



                <div class="col-md-2 col-sm-6">
                    <div class="footer-widget-area">


                    </div> <!-- end .footer-widget-area  -->
                </div> <!-- end .col-md-2  -->

                <div class="col-md-3 col-sm-6">
                    <div class="footer-widget-area newsletter-footer">
                        <h3>Réseau universitaire</h3>
                        <ul class="footer-useful-links">
                            <li>
                                <a >
                                    <i class="fa fa fa-long-arrow-right fa-footer"></i>
                                    Universités
                                </a>
                            </li>
                            <li>
                                <a >
                                    <i class="fa fa fa-long-arrow-right fa-footer"></i>
                                    Centres universitaires
                                </a>
                            </li>
                            <li>
                                <a >
                                    <i class="fa fa fa-long-arrow-right fa-footer"></i>
                                    Annexes universitaires
                                </a>
                            </li>
                            <li>
                                <a >
                                    <i class="fa fa-long-arrow-right fa-footer"></i>
                                    Ecoles nationales supérieures
                                </a>
                            </li>
                            <li>
                                <a >
                                    <i class="fa fa-long-arrow-right fa-footer"></i>
                                    Ecoles normale supérieures
                                </a>
                            </li>

                            <li>
                                <a >
                                    <i class="fa fa-long-arrow-right fa-footer"></i>
                                    Ecoles préparatoires
                                </a>
                            </li>
                            <li>
                                <a >
                                    <i class="fa fa-long-arrow-right fa-footer"></i>
                                    Ecoles préparatoires intégrées
                                </a>
                            </li>
                        </ul>


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
                            Copyright © 2018. All right reserved by
                            <a class="color-primary" href="emGiin">MESRS</a>
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
                                    <a>Le ministère</a>
                                </li>
                                <li>
                                    <a>Les services</a>
                                </li>
                                <li>
                                    <a>Stratégie de développement</a>
                                </li>
                                <li>
                                    <a>Les réformes</a>
                                </li>
                                <li>
                                    <a>Texte juridique</a>
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
