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
    <link href="css/info.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
    <form name="loginForm" action="#" class="form" style="width: 350px">
        <p class="title">Login </p>

        <input name="username" type="text" placeholder="username" class="input">

        <input name="password" type="password" placeholder="password" class="input">

        <button action="HelloServlet" name="submit" class="submit" type="submit">Loggati</button>
        <a href="hello-servlet">Hello Servlet</a>

    </form>
</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>

</html>
<%-- haha coglione --%>
