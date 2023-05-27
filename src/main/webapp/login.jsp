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
    <link rel="icon" href="img/Logo.ico"/>
    <script src="script/script.js"></script>
    <link href="css/info.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>

<div style=" justify-content: center;   align-items: center; display: flex;">
    <form name="loginForm" class="form" style="width: 350px">
        <p class="title">Login </p>

        <input name="username" type="text" placeholder="username" class="input" id="username">

        <input name="password" type="password" placeholder="password" class="input" id="password">

        <input name="submit" class="submit login" type="button" onclick="login()" value="Loggati">
    </form>

</div>
<jsp:include page="sezioni/frase.jsp"/>

<jsp:include page="sezioni/footer.jsp"/>
</body>

</html>
<%-- haha coglione --%>
