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

</head>
<jsp:include page="sezioni/header.jsp"/>
<body>

<div class="content">
  <h2>Visualizza Utenti</h2>
  <input class="cta" type="button" onclick="stampa('registrati')" value="Utenti Registrati" >
  <input class="cta" type="button" onclick="reset('registrati')" value="Reset" >
  <br>
  <div id="registrati"></div>

  <br>

  <input class="cta" type="button" onclick="stampa('simp')" value="Utenti Simp" >
  <input class="cta" type="button" onclick="reset('simp')" value="Reset" >
  <br>
  <div id="simp"></div>

  <br>

  <input class="cta" type="button" onclick="stampa('aderenti')" value="Utenti Aderenti">
  <input class="cta" type="button" onclick="reset('aderenti')" value="Reset" >
  <br>
  <div id="aderenti"></div>


  <br><br><hr><br><br>

  <input class="cta" type="button" onclick="grafo()" value="Grafo">
  <div id="container" style="width:100%; height:400px;"></div>

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
    const xhttp= new XMLHttpRequest();
    xhttp.onload=function (){
      document.getElementById(id).style.display="block";
      document.getElementById(id).innerHTML=this.responseText;
    }
    xhttp.open("GET","utentiServlet?ruolo="+id);
    xhttp.send();
  }


  function grafo(){
    const xhttp= new XMLHttpRequest();

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
            type: 'column'
          },
          title: {
            text: 'Donazioni Tum4World'
          },
          subtitle: {
            text: 'Le donazioni degli aderenti nel corso dei mesi dell anno scorso'
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
