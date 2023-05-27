<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>TUM4WORLD</title>
  <link rel="icon" href="img/Logo.ico"/>
  <link rel="stylesheet" href="css/private.css">
  <script src="script/script.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>



  <%
    String ses = (String) session.getAttribute("username");
    Boolean admin = (Boolean) session.getAttribute("admin");
    if(ses == null) {
      out.println("<script>wrongPage()</script>");
    } else if(!admin) {
      out.println("<script>wrongPage()</script>");
    }
  %>

  <style>
    table{
      margin-top: 30px  ;
      font-family: Lato;
      border-collapse: collapse;
      width: 100%;
    }

    td,th {
      border: 1px solid #ddd;
      padding: 8px;
      background-color: #24252a;
      color: whitesmoke;
    }

    tr:nth-child(even){background-color: #f2f2f2;}

    tr:hover {background-color: #ddd;}

    th {
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
  <h2>Visualizza Utenti</h2>
  <input class="cta" type="button" onclick="stampa('registrati')" value="Utenti Registrati" >
  <input class="cta" type="button" onclick="reset('registrati')" value="Reset" >
  <br>
  <div id="registrati">
    <table id="registrati-output"></table>
  </div>

  <br>

  <input class="cta" type="button" onclick="stampa('simp')" value="Utenti Simpatizzanti" >
  <input class="cta" type="button" onclick="reset('simp')" value="Reset" >
  <br>
  <div id="simp">
    <table id="simp-output"></table>
  </div>

  <br>

  <input class="cta" type="button" onclick="stampa('aderenti')" value="Utenti Aderenti">
  <input class="cta" type="button" onclick="reset('aderenti')" value="Reset" >
  <br>
  <div id="aderenti" style="width: 30%">
    <table id="aderenti-output"></table>
  </div>


  <br>
  <form method="POST" name="deleteUser" action="deleteUser" class="form">
    <button action="deleteUser" name="submit" class="submit delete" type="submit">CANCELLA ISCRIZIONE</button>
  </form>


  <br><br><hr><br><br>

  <input class="cta" type="button" onclick="grafo()" value="Grafo">
  <br><br>
  <div id="container" style="width:100%; height:600px;"></div>

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


        //display error if not existing
        if(my_JSON_array === null) {
          document.getElementById(tablename).innerHTML = "No data avaiable";
        }

        //if data preset
        if(my_JSON_array.length > 0) {

          //create header of table
          let thead = table.createTHead() ;
          let row = thead.insertRow();

          let header = ["Username"];
          for(let key of header) {
            let th = document.createElement("th");

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


  function grafo(){
    const xhttp= new XMLHttpRequest();
    let anno = new Date().getFullYear();

    xhttp.open("GET","grafo");
    xhttp.send();
    xhttp.responseType="json";

    xhttp.onload=function (){
      if(xhttp.readyState=== 4 && xhttp.status===200){
        var data = this.response;
        var arrayMesi=[];
        var arrayDonazioni=[];
        console.log(data);
        for(let i=0;i<data.length;i++){
          var data2=JSON.parse(data[i]);
          arrayMesi.push(data2.mese);
          arrayDonazioni.push(data2.importo);
        }

        Highcharts.chart('container', {
          chart: {
            type: 'column',
            backgroundColor: "whitesmoke",
            borderColor: "black",
            borderWidth: 3
          },
          title: {
            text: 'Donazioni Tum4World'
          },
          subtitle: {
            text: 'Le donazioni degli aderenti nel corso dei mesi del '+anno,
          },
          xAxis: {
            categories: arrayMesi,
            crosshair: true
          },
          yAxis: {
            min: 0,
            title: {
              text: 'Importo(in €)'
            }
          },

          tooltip: {
            headerFormat: '<span style="font-size:15px;padding: 50px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} €</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
          },
          plotOptions: {
            column: {
              pointPadding: 0.3,
              borderWidth: 0
            }
          },
          series: [{
            name : 'Donazioni',
            data: arrayDonazioni
          }]
        });
      }
    }
  }




</script>
