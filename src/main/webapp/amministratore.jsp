<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="img/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script.js"></script>
  <style>
    table {
      margin-top: 15px;
      font-family: Lato;
      font-weight: 200;
    }

    table th {
      font-weight: bold;
      text-transform: uppercase;
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }

    table td{
      border: 1px solid #ddd;
      padding: 8px;
      color: white;
    }


    table th:nth-child(even){
      background-color: #f2f2f2;
    }




  </style>

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
  <input class="cta" type="button" onclick="stampa('registrati')" value="Utenti Registrati" >
  <input class="cta" type="button" onclick="reset('registrati')" value="Reset" >
  <br>
  <div id="registrati"></div>
  <table id="registrati-output"></table>

  <br>

  <input class="cta" type="button" onclick="stampa('simp')" value="Utenti Simp" >
  <input class="cta" type="button" onclick="reset('simp')" value="Reset" >
  <br>
  <div id="simp"></div>
  <table id="simp-output"></table>

  <br>

  <input class="cta" type="button" onclick="stampa('aderenti')" value="Utenti Aderenti">
  <input class="cta" type="button" onclick="reset('aderenti')" value="Reset" >
  <br>
  <div id="aderenti"></div>
  <table id="aderenti-output"></table>


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
  function stampa(id){
    document.getElementById(id).style.display="block";
    //document.getElementById(id).innerHTML=this.responseText;

    //preparing request
    let ruolo = id;
    let url = "utentiServlet?ruolo="+ruolo;

    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType="json";

    //callback
    xhttp.onreadystatechange = function() {
      let done = 4, ok=200;

      //se ok prendo risposta
      if(xhttp.readyState === done && xhttp.status === ok) {
        let my_JSON_array = this.response;

        //roba brutte
        let tablename = id+"-output";
        let table = document.getElementById(tablename);

        while(table.childNodes.length) {
          table.removeChild(table.childNodes[0]);
        }

        table.style.border="1px solid whitesmoke;"

        //display error if not existing
        if(my_JSON_array === null) {
          document.getElementById(tablename).innerHTML = "No data avaiable";
        }

        //if data preset
        if(my_JSON_array.length > 0) {

          table.style.border = "1px solid red";

          //create header of table
          let thead = table.createTHead() ;
          let row = thead.insertRow();

          let header = ["Username"];
          for(let key of header) {
            let th = document.createElement("th");
            th.style.border = "1px solid green";

            let text = document.createTextNode(key);
            th.appendChild(text);
            row.appendChild(th);
          }

          //CREATING TABLE ROWS
          for(let i=0; i<my_JSON_array.length; i++) {
            row= table.insertRow();
            let current_JSON_object = JSON.parse(my_JSON_array[i]);

            for(let key in current_JSON_object) {
              let cell = row.insertCell();
              cell.style.border = "1px solid pink";
              let text = document.createTextNode((current_JSON_object[key]));
              cell.appendChild(text);
            }
          }
        } else {
            document.getElementById(tablename).innerHTML = "no data avaiable 2 lmao";
        }


      }



    }

    //sending request
    xhttp.send();
  }
</script>
