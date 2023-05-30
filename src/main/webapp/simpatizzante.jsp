<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 20/05/2023
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="img/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script-private.js"></script>
  <%
    String ses = (String) session.getAttribute("username");
    Boolean simp = (Boolean) session.getAttribute("simp");
    if(ses == null) {
      out.println("<script>wrongPage()</script>");
    } else if(!simp) {
      out.println("<script>wrongPage()</script>");
    }
  %>

</head>
<jsp:include page="sezioni/header.jsp"/>
<body>

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


    <input type="button" class="submit delete" onclick="deleteUser()"value="CANCELLA ISCRIZIONE" >
</div>


</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>


