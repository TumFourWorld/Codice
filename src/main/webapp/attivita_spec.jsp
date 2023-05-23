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
            immagine = "img/att1-img1.png";
            printText = "<h2>La pulizia degli ambienti marini lottando contro l'inquinamento marino</h2><p>L'associazione organizza regolarmente pulizie delle spiagge, delle coste e dei fondali marini per combattere l'inquinamento marino. Ciò avviene attraverso l'organizzazione di eventi pubblici, in cui i volontari dell'associazione, insieme alla comunità locale, si impegnano nella pulizia dei luoghi interessati. L'obiettivo principale di questa attività è quello di ridurre l'impatto dell'inquinamento marino sulla fauna e sulla flora marina, salvaguardando l'ecosistema marino e promuovendo la sostenibilità ambientale</p>";
        } else if("img3".equals(selectedImage)) {
            immagine = "img/att1-img1.png";
            printText = "<h2>Promozione di pratiche sostenibili per la gestione e la tutela delle risorse marine</h2><p>L'associazione promuove la sostenibilità ambientale attraverso la promozione di pratiche sostenibili per la gestione e la tutela delle risorse marine. Ciò viene fatto attraverso la partecipazione a iniziative locali e internazionali, la promozione di buone pratiche, la collaborazione con enti pubblici e organizzazioni locali e l'organizzazione di campagne di sensibilizzazione. L'obiettivo principale di questa attività è quello di promuovere un uso sostenibile delle risorse marine, prevenendo il loro sfruttamento eccessivo e riducendo l'impatto negativo dell'attività umana sull'ambiente marino.</p>";
        }
    %>
</head>
<jsp:include page="sezioni/header.jsp"/>

<body>
<div class="wrapper">
    <form action="iscrizioneAtt" method="POST" class="form">
        <img src="<%=immagine%>">
        <input type="hidden" name="img-att" value="<%=selectedImage%>">
        <div class="text-box">
        <%=printText%>
        <br><br><hr><br><br>
    <%
        if(ses != null) {
            out.print("<button type='submit' class='submit att' value='Submit'>ISCRIVITI</button>");
        }
    %>
        </div>
    </form>
</div>



<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>
