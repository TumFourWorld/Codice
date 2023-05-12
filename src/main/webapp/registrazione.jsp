<%--
  Created by IntelliJ IDEA.
  User: catto
  Date: 11/05/2023
  Time: 02:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TUM4WORLD</title>
</head>

    <header>
        <jsp:include page="sezioni/header.jsp"/>
    </header>

    <body>
        <h1><%= "Registrazione" %></h1>
        <form action="#" >
            Nome <input type="text" placeholder="nome" value="nome">
            Cognome <input type="text" placeholder="cognome">
            <br>
            Data di Nascita <input type="date">
            Email <input type="text" placeholder="indirizzo email">
            <br>
            Telefono <input type="text" placeholder="num telefono">
            <br>
            Simpatizzante <input type="checkbox">
            <br>
            Username <input type="text" placeholder="username">
            Password <input type="text" placeholder="password">
            <br>
            <button type="submit">Iscriviti</button>
            <button type="reset">Reset</button>
        </form>
    </body>

    <footer>
        <jsp:include page="sezioni/footer.jsp"/>
    </footer>
</html>
