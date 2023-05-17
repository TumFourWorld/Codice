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
    <link href="css/attivita-spec.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="sezioni/header.jsp"/>

<body>

<%
    /*
    String selectedImage = request.getParameter("option");
    out.println(selectedImage);
    String text = "";
    out.println(selectedImage);
    if ("img1".equals(selectedImage)) {
        out.println("<p>text1</p>");
        text = "testo1";
        selectedImage = "img/att1-img1.png";
    } else if ("image2.jpg".equals(selectedImage)) {
        text = "testo2";
    } else if ("image3.jpg".equals(selectedImage)) {
        text = "Testo3";
    }
    */

%>

<div class="wrapper">
    <img src="img/att1-img1.png">
    <div class="text-box">
        <h2>Sensibilizzazione della comunità riguardo l'importanza della salvaguardia dell'ambiente marino</h2>
        <p>L'associazione si impegna a sensibilizzare la comunità locale e nazionale sull'importanza di preservare l'ambiente marino. Ciò viene fatto attraverso la creazione di campagne di comunicazione, la partecipazione a eventi pubblici e la collaborazione con le istituzioni e le organizzazioni locali. L'obiettivo principale di questa attività è quello di educare la popolazione sulla necessità di agire con responsabilità nei confronti dell'ambiente marino, sottolineando l'importanza del mare come risorsa fondamentale per l'umanità.</p>
    </div>
</div>



<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>
