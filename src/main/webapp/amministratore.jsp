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
  <h2>Visualizza Utenti</h2>
  <input class="cta" type="button" onclick="utenti('registrati')" value="Utenti Registrati" >
  <input class="cta" type="button" onclick="reset('registrati')" value="Reset" >
  <br>
  <div id="registrati"></div>

  <br>

  <input class="cta" type="button" onclick="simp()" ondblclick="reset(simp)" value="Utenti Simp" >
  <br>
  <div id="simp"></div>

  <br>

  <input class="cta" type="button" onclick="aderenti()" ondblclick="reset(aderenti)" value="Utenti Aderenti">
  <br>
  <div id="aderenti"></div>


  <br>
  <form method="POST" name="deleteUser" action="deleteUser" class="form">
    <button action="deleteUser" name="submit" class="submit delete" type="submit">CANCELLA ISCRIZIONE</button>
  </form>
</div>


</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>
<script type="text/javascript">
  function reset(id){
    document.getElementById(id).style.display="none";
  }
  function utenti(id){
    document.getElementById(id).style.display="block";
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById("registrati").innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo=utente");
    xhttp.send();
  }

  function simp(){
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById("simp").innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo=simp");
    xhttp.send();
  }

  function aderenti(){
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById("aderenti").innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo=aderenti");
    xhttp.send();
  }
</script>
