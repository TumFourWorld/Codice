<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="img/Logo.ico"/>
    <link href="css/info.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
    <form id="formRegistrazione" name="signUpForm" method="post" class="form"> <!-- action="singInServlet" -->
        <p class="title">Registrati </p>
        <div class="flex">
            <input name="nome" type="text" placeholder="nome" class="input" id="nome">

            <input name="cognome" type="text" placeholder="cognome" class="input" id="cognome">
        </div>

        <input name="dataNascita" type="date" class="input" id="datanascita">
        <input name="email" type="text" placeholder="indirizzo email" class="input" id="email">

        <input type="text" placeholder="num-tel" class="input" name="num-tel" id="numtel">
        <div class="flex">
            <a>Simpatizzante</a> <input name="scelta" type="radio" class="input" value="simp">
            <a>Aderente</a> <input name="scelta" type="radio" class="input" value="aderente">
        </div>
        <input name="username" type="text" placeholder="username" class="input" id="uname">

        <input name="password" type="password" placeholder="password" class="input" id="psw">
        <input name="password" type="password" placeholder="ripeti password" class="input" id="pswcheck">
        <div class="flex">
            <input id="make_query" class="submit iscriviti" value="iscriviti" onclick="validate()">
            <input type="reset" class="submit reset" value="Reset">
        </div>
        <div id="output"></div>
    </form>
</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>