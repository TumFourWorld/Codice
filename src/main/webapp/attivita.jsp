<%--
  Created by IntelliJ IDEA.
  User: catto
  Date: 11/05/2023
  Time: 02:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="logo/Logo.ico"/>
</head>
<header>
    <jsp:include page="sezioni/header.jsp"/>
</header>
<body>
    <h1><%= "ATTIVITÀ" %></h1>
    <a href="pag-attivita/att1.jsp"><img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="img-att1" style="float: left"></a> <%--togliere style e modificare class css --%>
    <p>ATTIVITA 1 DESCRIZIONE</p>
    <form>

    </form>

</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>
