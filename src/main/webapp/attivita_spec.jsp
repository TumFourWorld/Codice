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
</head>
<header>
    <jsp:include page="sezioni/header.jsp"/>
</header>
<body>
<%
    String selectedImage = request.getParameter("option");
    out.println(selectedImage);;
    String text = "";
    if ("img1".equals(selectedImage)) {
        out.println("<p>text1</p>");
        text = "testo1";
        selectedImage = "att1-img1.png";
    } else if ("image2.jpg".equals(selectedImage)) {
        text = "testo2";
    } else if ("image3.jpg".equals(selectedImage)) {
        text = "Testo3";
    }
%>

<h2>Selected Image:</h2>
<img src="img/<%= selectedImage %>">

<h2>Corresponding Text:</h2>
<p><%= text %></p>

<button onclick="window.location.href='attivita.jsp'">Back</button>

</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>
