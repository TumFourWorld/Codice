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

  <style>
    #table-output {
      margin-top: 30px  ;
      font-family: Lato;
      border-collapse: collapse;
      width: 100%;
    }

    #table-output td, #table-output th {
      border: 1px solid #ddd;
      padding: 8px;
      background-color: #24252a;
      color: whitesmoke;
    }

    #table-output tr:nth-child(even){background-color: #f2f2f2;}

    #table-output tr:hover {background-color: #ddd;}

    #table-output th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #00b1dc;
    }
  </style>

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
        document.getElementById("display-user").style.display="block";
        let table = document.getElementById("table-output")
        while(table.childNodes.length) {
          table.removeChild(table);
        }

        //style

        if(my_JSON_array===null) {
          document.getElementById("display-user").innerText = "No data avaiable";
        }

        if(my_JSON_array.length > 0) {
          //style

          let thead = table.createTHead();
          let row = thead.insertRow();

          let header = ["Nome", "Cognome", "Data di Nascita", "Email", "Telefono", "Username"];

          for(let key of header) {
            let th = document.createElement("th");
            //style

            let text = document.createTextNode(key);
            th.appendChild(text);
            row.appendChild(th);
          }

          //creating table rows
          for(let i=0; i<my_JSON_array.length; i++) {
            row = table.insertRow();
            let current_JSON_object = JSON.parse(my_JSON_array[i]);

            for(let key in current_JSON_object) {
              let cell = row.insertCell();
              //cell style
              let text = document.createTextNode(current_JSON_object[key]);
              cell.appendChild(text);
            }

          }
        } else {
          document.getElementById("display-user").innerHTML = "No data avaiable";
        }

      }
    }

    xhttp.send();
  }

  function reset(){
    document.getElementById("display-user").style.display="none";
  }
</script>
