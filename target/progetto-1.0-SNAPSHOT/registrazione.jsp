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
    <link rel="icon" href="logo/Logo.ico"/>
    <script src="script/script.js"></script>
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
        <h1><%= "Registrazione" %></h1>
        <form name="singUpForm" action="#" >
            Nome <input name="nome" type="text" placeholder="nome" value="nome">
            Cognome <input name="cognome" type="text" placeholder="cognome">
            <br>
            Data di Nascita <input name="dataNascita" type="date">
            Email <input name="email" type="text" placeholder="indirizzo email">
            <br>
            Telefono <input type="text" placeholder="num telefono">
            <br>
            Simpatizzante <input type="checkbox">
            <br>
            Username <input name="username" type="text" placeholder="username">
            Password <input name="password" type="text" placeholder="password">
            <br>
            <button name="submit" type="submit" onclick="ValidateEmail(document.singUpForm.email)">Iscriviti</button>
            <button type="reset">Reset</button>
        </form>
    </body>

    <footer>
        <jsp:include page="sezioni/footer.jsp"/>
    </footer>
</html>
