<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 21/03/2018
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>Inscription</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="<c:url value="/resources/images/icons/favicon.ico" />"/>
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
    <!--===============================================================================================-->

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/fonts/iconic/css/material-design-iconic-font.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/animate/animate.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/css-hamburgers/hamburgers.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/animsition/css/animsition.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/select2/select2.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/daterangepicker/daterangepicker.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/util.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
    <!--===============================================================================================-->
</head>
<body style="background-color: #999999;">

<div class="limiter">
    <div class="container-login100">
        <div class="login100-more" style="background-image: url('resources/images/Doctorants.png');"></div>

        <div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
            <s:form id="regForm" modelAttribute="enssData" action="${pageContext.request.contextPath}/register" method="post" class="login100-form validate-form">

					<span class="login100-form-title p-b-59">
						Inscription
					</span>

                <div class="wrap-input100 validate-input" data-validate="Nom est obligatoire">
                    <span class="label-input100">Nom</span>
                    <s:input class="input100"  type="text" name="nom" id="name" placeholder="Nom..." path="nom"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Le prenom est obligatoire">
                    <span class="label-input100">Prenom</span>
                    <s:input class="input100" type="text" name="prenom" placeholder="Prenom..." path="prenom"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Ce champs est obligatoire">
                    <span class="label-input100">Numero de telephone</span>
                    <s:input class="input100" type="text" name="num_tel" placeholder="Numero de tel..." path="num_tel"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Ce champs est obligatoire">
                    <span class="label-input100">Date d'obtention du doctorat</span>
                    <s:input class="input100" type="date" name="date_doctorat"  path="date_doctorat"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Ce champs est obligatoire">
                    <span class="label-input100">Date d'installation dans le grade</span>
                    <s:input class="input100" type="date" name="date_doctorat"  path="date_installation_grade"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="La section est obligatoire">
                    <span class="label-input100">Section</span>
                    <s:select name="sections"  path="id_section"  class="input100">
                        <c:forEach items="${sections}" var="sec">
                            <form:option  value="${sec.id_section}" label="${sec.code_section}"  />
                        </c:forEach>

                    </s:select>
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="La section est obligatoire">
                    <span class="label-input100">Etablissement</span>
                    <s:select name="etablissement"  path="id_etablissement"  class="input100">
                        <form:option value = "NONE" label = "Select"/>
                        <form:options items = "${etablissements}" />
                    </s:select>
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Email est obligatoiredata-validate: ex@abc.xyz">
                    <span class="label-input100">Email</span>
                    <s:input class="input100" type="text" name="email" placeholder="Email..." path="email"/>
                    <span class="focus-input100"></span>
                </div>



                <div class="wrap-input100 validate-input" data-validate="Password est obligatoire">
                    <span class="label-input100">Mot de passe</span>
                    <s:input class="input100" type="password" name="password" placeholder="***************" path="password"/>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
                    <span class="label-input100">Repeter mote de passe</span>
                    <input class="input100" type="password" name="repeat-pass" placeholder="***************">
                    <span class="focus-input100"></span>
                </div>
                <form:errors path="*" />



                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            <input type="submit" value="Register" class="login100-form-btn"/>
                        </button>
                    </div>

                    <a href="#" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
                        Se connecter
                        <i class="fa fa-long-arrow-right m-l-5"></i>
                    </a>
                </div>
            </s:form>
        </div>
    </div>
</div>

<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/resources/js/main.js"/>"></script>

</body>
</html>
