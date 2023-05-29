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
    <link href="css/attivita-main.css" rel="stylesheet" type="text/css">
    <script src="script/script.js"></script>
</head>
<body>
<script>
    incrementa("attivita");
</script>
<jsp:include page="sezioni/header.jsp"/>
<div class="content">
    <!--<h1><%= "ATTIVITÀ" %></h1>-->
    <div class="row">
        <form id="imageForm" style="margin: 0px" action="attivita_spec.jsp" method="post">
            <input type="hidden" name="option" id="selectedOption">
            <div class="column">
                <img src="img/img-att1.png" alt="ATTIVITÀ 1" class="image-button">
                <a href="#" onclick="selectImage('img1')"><div class="centered">SENSIBILIZZAZIONE COMUNITà</div></a>
            </div>
            <div class="column">
                <img src="img/img-att2.png"  alt="ATTIVITÀ 2" class="image-button">
                <a href="#" onclick="selectImage('img2')"><div class="centered">PULIZIA AMBIENTI MARINI</div></a>
            </div>
            <div class="column">
                <img src="img/img-att3.png"  alt="ATTIVITÀ 3" class="image-button">
                <a href="#" onclick="selectImage('img3')"><div class="centered">PRATICHE SOSTENIBILI</div></a>
            </div>
         </form>
    </div>
</div>

<jsp:include page="sezioni/footer.jsp"/>

</body>
</html>


<%-- funzione che prende id immagine quando selezionata e fa submit del form in post --%>
<script>
    function selectImage(option) {
        document.getElementById('selectedOption').value = option;
        document.getElementById('imageForm').submit();


    }
</script>
