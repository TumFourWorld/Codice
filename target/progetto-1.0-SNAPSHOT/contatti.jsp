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
    <link rel="icon" href="img/Logo.ico"/>
    <script src="script/script.js"></script>
    <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script type="text/javascript">
        incrementa("contatti");
        function sendMail(nome,cognome,email,motivo,text) {
            Email.send({
                SecureToken : "90f62c4e-3fd6-46c7-9d46-31a32fd61556",
                To : 'tum4world@nessunonoluogonoesiste.com',
                From : ''+email+'',
                Subject : "Motivo : "+motivo+"",
                Body : "Nome : "+nome+" -- Cognome : "+cognome+" -- Messaggio : "+text+""
            }).then(
                window.location.href = 'mailInviata.jsp'
            );
        }
    </script>
    <link href="css/info.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
    <form name="contactForm" class="form" >
        <p class="title">Contattaci </p>
        <div class="flex">
            <input id="nome" name="nome" type="text" placeholder="nome" class="input">

            <input id="cognome" name="cognome" type="text" placeholder="cognome" class="input">
        </div>

        <input id="email" name="email" type="text" placeholder="indirizzo email" class="input">

        <a>Motivo: </a>
        <select name="motiviContatto" id="motCont" class="select">
            <option value="lamentela">Lamentela</option>
            <option value="rimborso">Rimborso</option>
            <option value="informazioni">Informazioni</option>
            <option value="altro">Altro...</option>
        </select>

        <label for="textarea">Dettagli della tua richiesta :</label>
        <textarea id="textarea" maxlength="" class="textarea"></textarea>

        <div class="flex">
            <input name="submit" class="submit iscriviti" type="button" onclick="validateContact()" value="Contattaci">
            <input type="reset" class="submit reset" value="Reset">
        </div>
    </form>
</div>
<div>
    <jsp:include page="sezioni/frase.jsp"/>
</div>
<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>
