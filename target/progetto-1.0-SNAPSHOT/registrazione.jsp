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
        <form name="singUpForm" method="post"  class="form" onsubmit="return validate()" > <!-- action="singInServlet" -->
            <p class="title">Registrati </p>
            <div class="flex">
                <input name="nome" type="text" placeholder="nome" class="input" id="nome" >

                <input name="cognome" type="text" placeholder="cognome" class="input" id="cognome" >
            </div>

            <input name="dataNascita" type="date" class="input" id="dataNascita" id="datanascita" >
            <input name="email" type="text" placeholder="indirizzo email" class="input" id="email" >

            <input type="text" placeholder="num-tel" class="input" name="num-tel" id="numtel" >
            <div class="flex">
                <a>Simpatizzante</a> <input name="scelta" type="radio" class="input" value="simp">
                <a>Aderente</a> <input name="scelta" type="radio" class="input" value="aderente">
            </div>
            <input name="username" type="text" placeholder="username" class="input" id="uname">

            <input name="password" type="password" placeholder="password" class="input" id="psw" >
            <input name="password" type="password" placeholder="ripeti password" class="input" id="pswcheck" >
            <div class="flex">
                <button name="submit" class="submit" style="width: 50%;" type="submit" >Iscriviti</button>  <!-- onclick="ValidateData(document.getElementById('dataNascita').value)" -->
                <button type="reset" class="submit" style="width: 50%; background-color: red">Reset</button>
            </div>
        </form>
    </div>
<jsp:include page="sezioni/footer.jsp"/>
</body>

<script>
    function containsUppercase(str) { /* controlla se contiene almeno una lettera maiuscola. se si ritrona true*/
        return /[A-Z]/.test(str);
    }

    function containsNumbers(str) { /* controlla se stringa contiene un numero. se si ritorna true else false*/
        return /\d/.test(str);
    }


    function validate() {
        /*
        let nome = document.getElementById("nome");
        let cognome = document.getElementById("cognome");
        let datanascita = document.getElementById("datanascita");
        let email = document.getElementById("email");
        let numtel = document.getElementById("numtel");
        let uname = document.getElementById("uname");
        */

        let psw = document.getElementById("psw");
        let pswcheck = document.getElementById("pswcheck");
        Boolean passwordComplete = false;

        if(psw.value.length <= 8) {
            alert("Password troppo corta")
            return false;
        } else if(!((psw.value.includes("d") || psw.value.includes("D")) && (psw.value.includes("A") || psw.value.includes("a")) && (psw.value.includes("M") || psw.value.includes("m")))) {
            alert("La password deve contenere almeno uno dei seguenti caratteri: D-A-M maiuscola o minuscola");
        } else if(!(psw.value.includes("!") || psw.value.includes("$") || psw.value.includes("?"))) {
            alert("La pasword deve contenere almeno uno dei seguenti caratteri: ? - ! - $");
        } else if(!containsUppercase(psw.value)) {
            alert("La password deve contenere almeno una lettera maiuscola!");
        } else if(!containsNumbers(psw.value)) {
            alert("La password deve contenere almeno un numero!");
        } else if(!(pswcheck == psw)) {
            alert("Le due password non coincidono!")
        } else {
            passwordComplete = true;
        }

        if(passwordComplete) {
            alert("Registrazione eseguita correttamente???");
            return true;
        }

    }

</script>

</html>
