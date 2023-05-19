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
    <link href="css/info.css" rel="stylesheet" type="text/css">
    <script src="script/script.js"></script>
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
        <form name="singUpForm" method="post" action="singInServlet" class="form" >
            <p class="title">Registrati </p>
            <div class="flex">
                <input name="nome" type="text" placeholder="nome" class="input">

                <input name="cognome" type="text" placeholder="cognome" class="input">
            </div>

            <input name="dataNascita" type="date" class="input" id="dataNascita">
            <input name="email" type="text" placeholder="indirizzo email" class="input">

            <input type="text" placeholder="num-tel" class="input" name="num-tel">
            <div class="flex">
                <a>Simpatizzante</a> <input name="scelta" type="radio" class="input" value="simp">
                <a>Aderente</a> <input name="scelta" type="radio" class="input" value="aderente">
            </div>
            <input name="username" type="text" placeholder="username" class="input">

            <input name="password" type="password" placeholder="password" class="input">
            <div class="flex">
                <button name="submit" class="submit" style="width: 50%;" type="submit" onclick="ValidateData(document.getElementById('dataNascita').value)">Iscriviti</button>
                <button type="reset" class="submit" style="width: 50%; background-color: red">Reset</button>
            </div>
        </form>
    </div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
