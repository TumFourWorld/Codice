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
  <link rel="icon" href="logo/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script.js"></script>
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
  <%
    String nome = (String) session.getAttribute("nome");
    String cognome = (String) session.getAttribute("cognome");
    String dob = (String) session.getAttribute("dob");
    String email = (String) session.getAttribute("email");
    String tel = (String) session.getAttribute("tel");
    out.print("<p><span>Nome: </span>" + nome+"</p>");
    out.print("<p><span>Cognome: </span>" + cognome+"</p>");
    out.print("<p><span>Data di nascita: </span>" + dob+"</p>");
    out.print("<p><span>Email: </span>" + email+"</p>");
    out.print("<p><span>Telefono: </span>" + tel+"</p>");
    out.print("<p><span>Username: </span>" + ses+"</p>");
  %>
  <br><br><hr><br><br>
  <form action="" onsubmit="confermaAtt()" method="POST" class="form">
    <input type="checkbox" id="att1" name="att1" value="att1">
    <label for="att1">SENSIBILIZZAZIONE COMUNITÀ</label><br>
    <input type="checkbox" id="att2" name="att2" value="att2">
    <label for="att2">PULIZIA AMBIENTI MARINI</label><br>
    <input type="checkbox" id="att3" name="att3" value="att3" checked>
    <label for="att3">PRATICHE SOSTENIBILI</label><br><br>
    <button type="submit" class="submit att" value="Submit">CONFERMA ATTIVITÀ</button>
  </form>

  <br><br><hr><br><br>


  <form method="POST" name="deleteUser" action="deleteUser" class="form">
    <button action="deleteUser" name="submit" class="submit delete" type="submit">CANCELLA ISCRIZIONE</button>
  </form>
</div>

<%




%>


</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
