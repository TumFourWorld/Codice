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
    <h1><%= "contatti" %></h1>
    <form action="#" >
        Nome <input type="text" placeholder="nome" value="nome">
        Cognome <input type="text" placeholder="cognome">
        <br>
        <label for="textarea">Dettagli della tua richiesta :</label>
        <textarea id="textarea" maxlength=""></textarea>
        <br>
        <br>
        <button type="submit">Invio Dati</button>
        <button type="reset">Reset</button>
    </form>
</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>
