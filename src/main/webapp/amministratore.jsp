<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="logo/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script.js"></script>

  <%
    String ses = (String) session.getAttribute("username");
    Boolean admin = (Boolean) session.getAttribute("admin");
    if(ses == null) {
      out.println("<script>wrongPage()</script>");
    } else if(!admin) {
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

  <input class="cta" type="button" onclick="simp('simp')" value="Utenti Simp" >
  <input class="cta" type="button" onclick="reset('simp')" value="Reset" >
  <br>
  <div id="simp"></div>

  <br>

  <input class="cta" type="button" onclick="aderenti('aderenti')" value="Utenti Aderenti">
  <input class="cta" type="button" onclick="reset('aderenti')" value="Reset" >
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

  function simp(id){
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById(id).style.display="block";
      document.getElementById("simp").innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo=simp");
    xhttp.send();
  }

  function aderenti(id){
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById(id).style.display="block";
      document.getElementById("aderenti").innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo=aderenti");
    xhttp.send();
  }
</script>
