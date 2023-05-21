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
    <%
        String ses = (String) session.getAttribute("username");
        String selectedImage = request.getParameter("option");
        String immagine = "";
        String printText = "";
        if("img1".equals(selectedImage)) {
            immagine = "img/att1-img1.png";
            printText = "<h2>Sensibilizzazione della comunità riguardo l'importanza della salvaguardia dell'ambiente marino</h2><p>L'associazione si impegna a sensibilizzare la comunità locale e nazionale sull'importanza di preservare l'ambiente marino. Ciò viene fatto attraverso la creazione di campagne di comunicazione, la partecipazione a eventi pubblici e la collaborazione con le istituzioni e le organizzazioni locali. L'obiettivo principale di questa attività è quello di educare la popolazione sulla necessità di agire con responsabilità nei confronti dell'ambiente marino, sottolineando l'importanza del mare come risorsa fondamentale per l'umanità.</p>";
        } else if("img2".equals(selectedImage)) {
            immagine = "#";
        } else if("img3".equals(selectedImage)) {
            immagine = "#";
        }
    %>
</head>
<jsp:include page="sezioni/header.jsp"/>

<body>
<div class="wrapper">
    <form action="iscrizioneAtt" method="POST" class="form">
    <img src="<%=immagine%>"  id="img-att">
        <div class="text-box">
        <%=printText%>
        <br><br><hr><br><br>
    <%
        if(ses != null) {
            out.print("<button type='submit' class='submit att' value='Submit'>ISCRIVITI</button>");
        }
        //out.print("</form>");
    %>
        </div>
    </form>
</div>



<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>
