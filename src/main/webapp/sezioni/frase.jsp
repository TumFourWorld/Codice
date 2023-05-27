<%--
  Created by IntelliJ IDEA.
  User: catto
  Date: 22/05/2023
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                    let randomIndex = Math.floor(Math.random() * (my_JSON_array.length + 1)); //da 0 a array length
                    //let current_JSON_object = JSON.parse(my_JSON_array[randomIndex]);


                    let current_JSON_object = JSON.parse(my_JSON_array[randomIndex]);
                    for(let key in current_JSON_object) {
                        document.getElementById("quotes-container").innerHTML = current_JSON_object[key];
                    }
                }
            } else {
                document.getElementById("quotes-container").innerHTML = "Connection error";
            }

        }

        xhttp.send();
    }
    window.onload = function() {
        quotes();
        setInterval(quotes, 20000);
    }

</script>

<style>
#quotes-container {
   font-family: Lato;
    font-weight: 200;
    margin: 20px auto 20px auto;
    color:whitesmoke;
    display: flex;
    /* justify-content: space-between; */
    text-align: center;
    background-color: #24252a;
    padding: 30px;
    width: 50%;
    border-radius: 40px;

    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}




</style>
<div id="quotes-container"></div>

