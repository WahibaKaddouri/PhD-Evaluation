<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <link rel="icon" type="image/png" href="<c:url value="/resources/images/icons/favicon.ico" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">




    <link rel="stylesheet" type="text/css" href=/resources/CUN/css/main.css"/>

</head>
<body style="background-color: #999999;">

<div class="limiter">
    <div class="container-login100">
        <div class="login100-more" style="background-image: url('/resources/images/Doctorants.png');"></div>


        <form id="regForm" action="j_spring_security_check" method="post" class="login100-form validate-form" style="margin-top: 200px">




            <div class="wrap-input100 validate-input" data-validate="Email est obligatoiredata-validate: ex@abc.xyz" style="margin-left:300px;margin-right: 300px;>
                <span class="label-input100" style="text-align: center;">Email</span>
                <input class="input100" type="text" name="j_username" placeholder="Email..." style="margin-left:300px;margin-right: 300px;"/>
                <span class="focus-input100"></span>
            </div>



            <div class="wrap-input100 validate-input" data-validate="Password est obligatoire" style="margin-left:300px;margin-right: 300px;>
                <span class="label-input100" style="text-align: center;">Mot de passe</span>
                <input class="input100" type="password" name="j_password" placeholder="***************" style="margin-left:300px;margin-right: 300px;" />
                <span class="focus-input100"></span>
            </div>


            <div class="container-login100-form-btn" style="margin-left:500px;">
                <div class="wrap-login100-form-btn">
                    <div class="login100-form-bgbtn"></div>
                    <button class="login100-form-btn">
                        <input type="submit" value="Login" class="login100-form-btn" style="color:black;"/>
                    </button>
                </div>

            </div>
        </form>

    </div>
</div>
</div>

<!--===============================================================================================-->
<script src="/resources/js_ens/jquery-2.1.4.min.js"></script>
<script src="/resources/js_ens/bootstrap.min.js"></script>

</body>
</html>
