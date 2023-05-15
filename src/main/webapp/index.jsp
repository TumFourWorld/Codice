<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="logo/Logo.ico"/>
</head>
    <header>
        <jsp:include page="sezioni/header.jsp"/>
    </header>

    <body>
    <img class="background">

    <div class="container">
        <a href="hello-servlet">Hello Servlet</a>
        <br><br><br>
        <a href="./file/volantinotum4world.pdf" download class="button">Download Volantino</a>
            <div class="card">
                <div class="img"></div>
                <span>Su di noi</span>
                <p class="info">L'associazione Tum 4 World si impegna a sensibilizzare la comunità sulla salvaguardia dell'ambiente marino, combattere l'inquinamento marino attraverso la pulizia dei luoghi interessati e promuovere pratiche sostenibili per la gestione e la tutela delle risorse marine. <br><br> L'obiettivo principale dell'associazione è quello di salvaguardare l'ambiente marino, preservando l'ecosistema marino e promuovendo la sostenibilità ambientale.
                </p>
            <button>Scarica</button>
            </div>
    </div>
    </body>

    <footer>
    <jsp:include page="sezioni/footer.jsp"/>
    </footer>
</html>