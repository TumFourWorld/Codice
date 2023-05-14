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
    <script src="script/script.js"></script>
</head>
<header>
    <jsp:include page="sezioni/header.jsp"/>
</header>
<body>
    <h1><%= "contatti" %></h1>
    <form name="contactForm" action="#" >
        Nome <input name="nome" type="text" placeholder="nome">
        Cognome <input name="cognome" type="text" placeholder="cognome">
        <br>
        <br>
        Email <input name="email" type="text" placeholder="email" >
        <br>
        <br>
        Motivo : <select name="motiviContatto" id="motCont" >
            <option value="lamentela">Lamentela</option>
            <option value="rimborso">Rimborso</option>
            <option value="informazioni">Informazioni</option>
            <option value="altro">Altro...</option>
        </select>
        <label for="textarea">Dettagli della tua richiesta :</label>
        <textarea id="textarea" maxlength=""></textarea>
        <br>
        <br>
        <button type="submit" name="submit" onclick="ValidateEmail(document.contactForm.email)">Invio Dati</button>
        <button type="reset">Reset</button>
    </form>
</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>
