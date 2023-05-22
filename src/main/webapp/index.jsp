<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<script type="text/javascript">
  function quotes(){
        const xhttp= new XMLHttpRequest();
        xhttp.onload=function (){
            document.getElementById("quotes-container").innerHTML=this.responseText;
        }
        xhttp.open("GET","getQuote");
        xhttp.send();
    }

  quotes();
  setInterval(quotes, 20000);

</script>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="logo/Logo.ico"/>
</head>
<jsp:include page="sezioni/header.jsp"/>
<body>
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
        <div id="quotes-container"></div>
    </div>
</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>

