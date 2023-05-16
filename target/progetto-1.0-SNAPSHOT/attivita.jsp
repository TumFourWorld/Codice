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
    <link href="css/attivita-main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<div class="content">
    <h1><%= "ATTIVITÀ" %></h1>
    <div class="row">
        <form id="imageForm" action="attivita_spec.jsp" method="post">
            <input type="hidden" name="option" id="selectedOption">
            <div class="column">
                <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
            </div>
            <div class="column">
                <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
            </div>
            <div class="column">
                <img src="img/att1-img1.png" alt="ATTIVITÀ 1" class="image-button" style="float: left" onclick="selectImage('img1')">
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
