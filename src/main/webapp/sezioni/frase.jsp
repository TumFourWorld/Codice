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

      xhttp.onload = function() {
          //se ok prendo risposta
          if(this.status=200) {
            let my_JSON_array = this.response;
            if (my_JSON_array === null) {
                document.getElementById("quotes-container").innerHTML = "No data avaiable - No quotes 404";
            } else if (my_JSON_array.length > 0) {
                //let randomIndex = Math.floor(Math.random() * (my_JSON_array.length + 1)); //da 0 a array length
                //let current_JSON_object = JSON.parse(my_JSON_array[randomIndex]);

                for(let i=0; i<my_JSON_array.length; i++) {
                    let current_JSON_object = JSON.parse(my_JSON_array[i]);
                    for(let key in current_JSON_object) {
                        document.getElementById("quotes-container").innerHTML = current_JSON_object[key];
                    }
                }

                document.getElementById("quotes-container").style.color = "white";

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

