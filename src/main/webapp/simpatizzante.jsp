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
  <input class="cta" type="button" onclick="getUserData()" value="Dati Personali">
  <input class="cta" type="button" onclick="reset()" value="Reset">
  <div id="display-user">
    <p id="nome"></p>
    <p id="cognome"></p>
    <p id="data_nascita"></p>
    <p id="email"></p>
    <p id="num_tel"></p>
    <p id="username"></p>
    <p id="att1"></p>
    <p id="att2"></p>
    <p id="att3"></p>
  </div>
  <%
    /*
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
     */
  %>
  <br><br><hr><br><br>


  <form method="POST" name="deleteUser" action="deleteUser" class="form">
    <button action="deleteUser" name="submit" class="submit delete" type="submit">CANCELLA ISCRIZIONE</button>
  </form>
</div>


</div>
<jsp:include page="sezioni/footer.jsp"/>
</body>
</html>

<script>
  function getUserData() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "retrieveUserData", true);
    xhttp.responseType = "json";

    xhttp.onload = function () {
      //se ok prendo risposta
      if (this.status = 200) {
        let my_JSON_array = this.response;
        if (my_JSON_array === null) {
          document.getElementById("display-user").innerHTML = "No data avaiable - No USER 404";
        } else if (my_JSON_array.length > 0) {

          let current_JSON_object = JSON.parse(my_JSON_array[0]);
          document.getElementById("display-user").style.display="block";
          for (let key in current_JSON_object) {
            document.getElementById(key).innerHTML = key.toLocaleUpperCase()+":"+current_JSON_object[key];

          }
        }
      } else {
        document.getElementById("display-user").innerHTML = "Connection error";
      }

    }

    xhttp.send();
  }

  function reset(){
    document.getElementById("display-user").style.display="none";
  }
</script>
