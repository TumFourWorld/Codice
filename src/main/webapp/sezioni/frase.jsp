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
    xhttp.onload=function (){
      document.getElementById("quotes-container").innerHTML=this.responseText;
    }
    xhttp.open("GET","getQuote");
    xhttp.send();
  }

  quotes();
  setInterval(quotes, 5000);

</script>

<div id="quotes-container"></div>

