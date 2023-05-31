<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="img/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script-private.js"></script>  <%
    String ses = (String) session.getAttribute("username");
    Boolean simp = (Boolean) session.getAttribute("simp");
    if(ses == null) {
      out.println("<script>wrongPage()</script>");
    } else if(simp) {
      out.println("<script>wrongPage()</script>");
    }
  %>

</head>
<jsp:include page="sezioni/header.jsp"/>
<body>
<script>
  incrementa("aderente");
</script>

<div class="content">
  <h1>Dati Personali</h1>
  <input class="cta" type="button" onclick="getUserData()" value="Dati Personali">
  <input class="cta" type="button" onclick="reset()" value="Reset">
  <div id="display-user">
    <table id="table-output"></table>

  </div>

  <br><br><hr><br><br>
  <input class="cta" type="button" onclick="getAttivita()" value="Visualizza Iscrizioni" >
  <form name="attivita" method="post" id="formAttivita" style="display: none;">
    Sensibilizzazione Comunità<input type="checkbox" id="att1" name="att1">
    <br>
    Pulizia Ambienti Marini<input type="checkbox" id="att2" name="att2" >
    <br>
    Pratiche Sostenibili<input type="checkbox" id="att3" name="att3">
    <br><br>
    <input type="button"  class="simpAmm" value="Registrati" onclick="registraAttivita()">
  </form>
  <br><br><hr><br><br>

  <h2>FAI UNA DONAZIONE PER SUPPORTARCI</h2>
  <div id="importoTot"></div>
  Importo della donazione -> <input type="number" step="0.01" name="importo" id="importo">
  <br><br><button type="submit" class="submit att" onclick="dona(document.getElementById('importo').value)" value="Submit">Invia donazione </button>
  <br>
  <label id="msgDonazione" style="color: whitesmoke;padding: 5px;"></label>

  <br><br><hr><br><br>


  <input type="button" class="submit delete" onclick="deleteUser()" value="CANCELLA ISCRIZIONE">

</div>

<script type="text/javascript">
  window.onload = function() {
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById('importoTot').innerHTML=this.responseText;
    }
    xhttp.open("GET","donazione");
    xhttp.send();
  };

  function dona(importo){
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
    document.getElementById('msgDonazione').innerHTML=this.responseText;
    }
    xhttp.open("POST","donazione?importo="+importo);
    xhttp.send();
  }
</script>

</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
