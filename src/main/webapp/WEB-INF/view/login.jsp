<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>Connexion</title>
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
        <div class="login100-more" style="background-image: url('/resources/images/Doctorants.png');"></div>


            <form id="regForm" action="j_spring_security_check" method="post" class="login100-form validate-form">

					<span class="login100-form-title p-b-59">
						login
					</span>


                <div class="wrap-input100 validate-input" data-validate="Email est obligatoiredata-validate: ex@abc.xyz">
                    <span class="label-input100">Email</span>
                    <input class="input100" type="text" name="j_username" placeholder="Email..."/>
                    <span class="focus-input100"></span>
                </div>



                <div class="wrap-input100 validate-input" data-validate="Password est obligatoire">
                    <span class="label-input100">Mot de passe</span>
                    <input class="input100" type="password" name="j_password" placeholder="***************" />
                    <span class="focus-input100"></span>
                </div>


                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            <input type="submit" value="Login" class="login100-form-btn"/>
                        </button>
                    </div>

                </div>
            </form>

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
