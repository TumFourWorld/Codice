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
    <script src="functions/script.js"></script>

</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<div class="container">
    <h1><%= "Login" %></h1>
    <%-- FORM DA ELIMINARE E SOLO PER TESTARE LMAO (vai a ultima riga) --%>
    <button onclick="showConfirmation()">Conferma</button>
    <div id="confirmationBox" class="confirmation-box">
        <div class="confirmation-content">
            <h2>Sei sicuro?</h2>
            <p>Questa azione non puó essere cancellata.</p>
            <button onclick="confirmAction()">Conferma</button>
            <button onclick="cancelAction()">Annulla</button>
        </div>
    </div>
</div>
</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>
<%-- haha coglione --%>
