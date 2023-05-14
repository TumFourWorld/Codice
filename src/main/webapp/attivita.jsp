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
    <style>
        .image-button {
            border: none;
            background: none;
            cursor: pointer;
        }
    </style>
</head>
<header>
    <jsp:include page="sezioni/header.jsp"/>
</header>
<body>
    <div class="container">
        <h1><%= "ATTIVITÀ" %></h1>
        <h3>L'associazione Tum 4 World si impegna a sensibilizzare la comunità sulla salvaguardia dell'ambiente marino, combattere l'inquinamento marino attraverso la pulizia dei luoghi interessati e promuovere pratiche sostenibili per la gestione e la tutela delle risorse marine. L'obiettivo principale dell'associazione è quello di salvaguardare l'ambiente marino, preservando l'ecosistema marino e promuovendo la sostenibilità ambientale. Per fare ciò, l'associazione si impegna nella realizzazione di campagne di comunicazione, nell'organizzazione di eventi pubblici, nella partecipazione a iniziative locali e internazionali, nella collaborazione con enti pubblici e organizzazioni locali e nella promozione di buone pratiche. Inoltre, l'associazione si avvale del supporto dei suoi volontari, che partecipano attivamente alle attività dell'associazione, contribuendo così alla salvaguardia dell'ambiente marino.</h3>
        <%--<img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="img-att1" style="float: left"></a><br>--%> <%--togliere style e modificare class css --%>
        <div class="row">
            <form id="imageForm" action="attivita_spec.jsp" method="post">
                <input type="hidden" name="option" id="selectedOption">
                <div class="column">
                    <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
                    <label>Sensibilizzazione della comunità riguardo l'importanza della salvaguardia dell'ambiente marino</label>
                </div>

                <div class="column">
                    <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
                    <label>La pulizia degli ambienti marini lottando contro l'inquinamento marino</label>
                </div>

                <div class="column">
                    <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
                    <label>Promozione di pratiche sostenibili per la gestione e la tutela delle risorse marine</label>
                </div>
            </form>
        </div>





    </div>
</body>
<footer>
    <jsp:include page="sezioni/footer.jsp"/>
</footer>
</html>


<%-- funzione che prende id immagine quando selezionata e fa submit del form in post --%>
<script>
    function selectImage(option) {
        document.getElementById('selectedOption').value = option;
        document.getElementById('imageForm').submit();


    }
</script>
