
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Page d'accueil, ${username}
</h1>

<table>
    <tr><td><a href="${pageContext.request.contextPath}/CUN">Espace CUN</a></td></tr>


</table>
</body>
</html>