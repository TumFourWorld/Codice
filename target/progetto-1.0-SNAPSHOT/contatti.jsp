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
    <link href="css/info.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
    <form name="contactForm" action="#" class="form" >
        <p class="title">Contattaci </p>
        <div class="flex">
            <input name="nome" type="text" placeholder="nome" class="input">

            <input name="cognome" type="text" placeholder="cognome" class="input">
        </div>

        <input name="email" type="text" placeholder="indirizzo email" class="input">

        <a>Motivo: </a> <select name="motiviContatto" id="motCont" class="select">
            <option value="lamentela">Lamentela</option>
            <option value="rimborso">Rimborso</option>
            <option value="informazioni">Informazioni</option>
            <option value="altro">Altro...</option>
        </select>

        <label for="textarea">Dettagli della tua richiesta :</label>
        <textarea id="textarea" maxlength="" class="textarea"></textarea>

        <div class="flex">
            <button name="submit" class="submit iscriviti" type="submit" onclick="ValidateEmail(document.singUpForm.email)">Contattaci</button>
            <button type="reset" class="submit reset">Reset</button>
        </div>
    </form>
</div>
<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>
