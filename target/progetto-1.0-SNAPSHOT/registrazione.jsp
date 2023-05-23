<%--
  Created by IntelliJ IDEA.
  User: catto
  Date: 11/05/2023
  Time: 02:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="logo/Logo.ico"/>
    <link href="css/info.css" rel="stylesheet" type="text/css">
    <script src="script/script.js"></script>

</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
        <form id="formRegistrazione" name="singUpForm" method="post" class="form" action="singInServlet"> <!-- action="singInServlet" -->
            <p class="title">Registrati </p>
            <div class="flex">
                <input name="nome" type="text" placeholder="nome" class="input" id="nome" required>

                <input name="cognome" type="text" placeholder="cognome" class="input" id="cognome" required>
            </div>

            <input name="dataNascita" type="date" class="input" id="dataNascita" id="datanascita" required>
            <input name="email" type="text" placeholder="indirizzo email" class="input" id="email" required>

            <input type="text" placeholder="num-tel" class="input" name="num-tel" id="numtel" required>
            <div class="flex">
                <a>Simpatizzante</a> <input name="scelta" type="radio" class="input" value="simp" required>
                <a>Aderente</a> <input name="scelta" type="radio" class="input" value="aderente" required>
            </div>
            <input name="username" type="text" placeholder="username" class="input" id="uname" required>

            <input name="password" type="password" placeholder="password" class="input" id="psw" required>
            <input name="password" type="password" placeholder="ripeti password" class="input" id="pswcheck" required>
            <div class="flex">
                <button name="submit" class="submit iscriviti" type="submit" >Iscriviti</button>  <!-- onclick="ValidateData(document.getElementById('dataNascita').value)" -->
                <button type="reset" class="submit reset">Reset</button>
            </div>
        </form>
    </div>
<jsp:include page="sezioni/footer.jsp"/>


<script>
    document.getElementById("formRegistrazione").addEventListener("submit", function(event) {
         // Prevent the default form submission
        /*
        let nome = document.getElementById("nome");
        let cognome = document.getElementById("cognome");
        let datanascita = document.getElementById("datanascita");
        let email = document.getElementById("email");
        let numtel = document.getElementById("numtel");
        let uname = document.getElementById("uname");
        */

        let email = document.getElementById("email");
        if(!ValidateEmail(email)){
            event.preventDefault(); //in questo modo non fa submit dopo aver dato errore. deve cliccare bottono di nuovo lmao
        }
        let psw = document.getElementById("psw");
        let pswcheck = document.getElementById("pswcheck");


        if(psw.value.length <8) {
            alert("Password troppo corta")
            event.preventDefault();
        } else if(!((psw.value.includes("d") || psw.value.includes("D")) && (psw.value.includes("A") || psw.value.includes("a")) && (psw.value.includes("M") || psw.value.includes("m")))) {
            alert("La password deve contenere almeno uno dei seguenti caratteri: D-A-M maiuscola o minuscola");
            event.preventDefault();
        } else if(!(psw.value.includes("!") || psw.value.includes("$") || psw.value.includes("?"))) {
            alert("La pasword deve contenere almeno uno dei seguenti caratteri: ? - ! - $");
            event.preventDefault();
        } else if(!containsUppercase(psw.value)) {
            alert("La password deve contenere almeno una lettera maiuscola!");
            event.preventDefault();
        } else if(!containsNumbers(psw.value)) {
            alert("La password deve contenere almeno un numero!");
            event.preventDefault();
        } else if(!(pswcheck.value == psw.value)) {
            //console.log(pswcheck.value);
            //console.log(psw.value);
            alert("Le due password non coincidono!")
            event.preventDefault();
        }







        //alert("Registrazione effettuata con sucecsso!");
        //document.getElementById("formRegistrazione").reset(); //cleara form x essere fico

    });



</script>
</body>
</html>
