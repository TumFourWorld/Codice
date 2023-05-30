<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="img/Logo.ico"/>
    <script src="script/script.js"></script>

    <style>
        .cookie-consent {
            position: fixed;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            width: 250px;
            background-color: #f8f8f8;
            padding: 10px;
            text-align: center;
            z-index: 9999;
        }

        .cookie-consent-content {
            margin-bottom: 10px;
        }

        .cookie-consent-content span {
            display: inline-block;
            margin-bottom: 5px;
        }

        .cookie-consent-content button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 5px;
        }
    </style>
</head>
<jsp:include page="sezioni/header.jsp"/>
<body>
<script>
    incrementa("home");
</script>
<img class="background">
    <div class="sectionhome">
        <div class="text">
            <h1>DI COSA CI OCCUPIAMO?</h1>
            <p>L'Associazione Tum 4 World è un'organizzazione acclamata da tutti gli appassionati del mare e tutte le persone che desiderano proteggerlo. <br>Le attività principali dell'associazione si concentrano sulla sensibilizzazione della comunità sull'importanza della salvaguardia dell'ambiente marino, sulla lotta contro l'inquinamento marino attraverso la pulizia delle spiagge e dei fondali e sulla promozione di pratiche sostenibili per la gestione e la tutela delle risorse marine.
            <br><br><br><br><button><a href="file/volantinotum4world.pdf" download>Scarica il nostro Volantino</a></button>
        </div>
        <img src="https://i.imgur.com/PeHQeTp.png">
        </p> <!-- GIUSTO QUA GIU LE ZAMPE -->
    </div>
        <jsp:include page="sezioni/frase.jsp"/>


    <div id="cookieConsent" class="cookie-consent">
        <div id="cookieConsentContent" class="cookie-consent-content">
            <span>This website uses cookies to ensure you get the best experience.</span>
            <button id="acceptCookies" onclick="acceptCookies('true')">Accept</button>
            <button id="declineCookies" onclick="acceptCookies('false')">Decline</button>
        </div>
    </div>

</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        if (!localStorage.getItem("cookie")) {
            showCookiePopup();
        } else {
            document.getElementById("cookieConsent").style.display = "none";
        }


    });

    function showCookiePopup() {
        document.getElementById("cookieConsent").style.display = "block";

    }

    function acceptCookies(risposta) {
        document.getElementById("cookieConsent").style.display = "none";
        localStorage.setItem("cookie", risposta);
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let risposta = this.responseText;
        }
        let url = "cookie?param="+risposta;
        xhttp.open("GET",url , true);
        xhttp.send();
    }
</script>

