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
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<div class="content">
    <!--<h1><%= "ATTIVITÀ" %></h1>-->
    <div class="row">
        <form id="imageForm" style="margin: 0px" action="attivita_spec.jsp" method="post">
            <input type="hidden" name="option" id="selectedOption">
            <div class="column">
                <img src="https://images.unsplash.com/photo-1572279696557-51fb559f67dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80" alt="ATTIVITÀ 1" class="image-button">
                <a href="#" onclick="selectImage('img1')"><div class="centered">SENSIBILIZZAZIONE COMUNITà</div></a>
            </div>
            <div class="column">
                <img src="https://images.unsplash.com/photo-1618477461853-cf6ed80faba5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"  alt="ATTIVITÀ 2" class="image-button">
                <a href="#" onclick="selectImage('img2')"><div class="centered">PULIZIA AMBIENTI MARINI</div></a>
            </div>
            <div class="column">
                <img src="https://images.unsplash.com/photo-1657563495714-348f7d3d400c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"  alt="ATTIVITÀ 3" class="image-button">
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
