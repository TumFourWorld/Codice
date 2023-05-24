<%--
  Created by IntelliJ IDEA.
  User: catto
  Date: 22/05/2023
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../css/header.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
  function quotes(){
    const xhttp= new XMLHttpRequest();
    xhttp.open("GET","getQuote", true);
    xhttp.responseType="json";

      xhttp.onreadystatechange = function() {
          let done = 4, ok=200;

          //se ok prendo risposta
          if(xhttp.readyState === done && xhttp.status === ok) {
            let my_JSON_array = this.response;
            let my_JSON_array_length = my_JSON_array.length
            if (my_JSON_array === null) {
                document.getElementById("quotes-container").innerHTML = "No data avaiable - No quotes 404";
            } else if (my_JSON_array_length > 0) {
                console.log("qui");
                let randomIndex = Math.floor(Math.random() * (my_JSON_array_length + 1)); //da 0 a array length
                let current_JSON_object = JSON.parse(my_JSON_array[randomIndex]);
                document.getElementById("quotes-container").innerHTML = current_JSON_object;
            }
        } else {
            document.getElementById("quotes-container").innerHTML = "Connection error";
        }

    }

    xhttp.send();
  }

  quotes();
  setInterval(quotes, 5000);



</script>

<div id="quotes-container" onload="quotes()"></div>

