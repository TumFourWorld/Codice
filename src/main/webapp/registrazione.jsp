<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TUM4WORLD</title>
    <link rel="icon" href="img/Logo.ico"/>
    <link href="css/info.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="sezioni/header.jsp"/>
<br>
<div style=" justify-content: center;   align-items: center; display: flex;">
    <form id="formRegistrazione" name="signUpForm" method="post" class="form"> <!-- action="singInServlet" -->
        <p class="title">Registrati </p>
        <div class="flex">
            <input name="nome" type="text" placeholder="nome" class="input" id="nome">

            <input name="cognome" type="text" placeholder="cognome" class="input" id="cognome">
        </div>

        <input name="dataNascita" type="date" class="input" id="datanascita">
        <input name="email" type="text" placeholder="indirizzo email" class="input" id="email">

        <input type="text" placeholder="num-tel" class="input" name="num-tel" id="numtel">
        <div class="flex">
            <a>Simpatizzante</a> <input name="scelta" type="radio" class="input" value="simp">
            <a>Aderente</a> <input name="scelta" type="radio" class="input" value="aderente">
        </div>
        <input name="username" type="text" placeholder="username" class="input" id="uname">

        <input name="password" type="password" placeholder="password" class="input" id="psw">
        <input name="password" type="password" placeholder="ripeti password" class="input" id="pswcheck">
        <div class="flex">
            <button id="make_query" class="submit iscriviti" onclick="validateData()">Iscriviti</button>
            <button type="reset" class="submit reset">Reset</button>
        </div>
        <div id="output"></div>
    </form>
</div>
<jsp:include page="sezioni/footer.jsp"/>


<script>

    function validateData() {
        let nome = document.getElementById("nome").value;
        let cognome = document.getElementById("cognome").value;
        let data_nascita = document.getElementById("datanascita").value;
        let email = document.getElementById("email").value;
        let num_tel = document.getElementById("numtel").value;
        let simp = document.forms["signUpForm"]["scelta"].value;
        let username = document.getElementById("uname").value;
        let psw = document.getElementById("psw").value;
        let pswcheck = document.getElementById("pswcheck").value;

        let email_check = document.getElementById("email"); //x check email @

        if(nome==="") {
            alert("Il nome non può essere vuoto");
            return;
        } else if(cognome==="") {
            alert("Il cognome non può essere vuoto");
            return;
        } else if(data_nascita==="") {
            alert("La data di nascita non può essere vuota");
            return;
        } else if(email==="") {
            alert("L'email non può essere vuota");
            return;
        } else if(num_tel==="") {
            alert("Il numero di telefono non può essere vuoto");
            return;
        } else if(num_tel==="") {
            alert("Il numero di telefono non può essere vuoto");
            return;
        } else if(username==="") {
            alert("Lo username non può essere vuoto");
            return;
        } else if(psw==="") {
            alert("La password non può essere vuota");
            return;
        } else if(!ValidateEmail(email_check)){
            alert("Formato email non valido!");
            return;
        } else if(psw.length <8) {
            alert("Password troppo corta")
            return;
        } else if(!((psw.includes("d") || psw.includes("D")) && (psw.includes("A") || psw.includes("a")) && (psw.includes("M") || psw.includes("m")))) {
            alert("La password deve contenere almeno uno dei seguenti caratteri: D-A-M maiuscola o minuscola");
            return;
        } else if(!(psw.includes("!") || psw.includes("$") || psw.includes("?"))) {
            alert("La pasword deve contenere almeno uno dei seguenti caratteri: ? - ! - $");
            return;
        } else if(!containsUppercase(psw)) {
            alert("La password deve contenere almeno una lettera maiuscola!");
            return;
        } else if(!containsNumbers(psw)) {
            alert("La password deve contenere almeno un numero!");
            return;
        } else if(!(pswcheck == psw)) {
            alert("Le due password non coincidono!")
            return;
        } else {
            makeRegistration();
        }


    }

    function makeRegistration() {
        let nome = document.getElementById("nome").value;
        let cognome = document.getElementById("cognome").value;
        let data_nascita = document.getElementById("datanascita").value;
        let email = document.getElementById("email").value;
        let num_tel = document.getElementById("numtel").value;
        let simp = document.forms["signUpForm"]["scelta"].value;
        let username = document.getElementById("uname").value;
        let password = document.getElementById("psw").value;





        let url = "registrazioneServlet?nome="+nome+"&cognome="+cognome+"&data_nascita="+data_nascita+"&email="+email+"&num_tel="+num_tel+"&scelta="+simp+"&uname="+username+"&psw="+password;

        //make request
        const xhttp = new XMLHttpRequest();


        xhttp.onload=function() {
            if (this.status === 200 && this.readyState === 4) {
                let new_risposta = this.responseText;
                console.log(new_risposta);
                console.log("qui");

                if (new_risposta === "success") {
                    document.getElementById("output").innerHTML ="REGISTRAZIONE EFFETTUATA";
                    document.getElementById("output").style.color="red";

                    alert("registrazione effettuata con successo!")
                    window.location.href = 'index.jsp';
                } else {
                    alert("aiutoo");
                    window.location.href = 'registrazione.jsp';
                }
            } else {
                alert("grave erore servlet");
            }
        }

        xhttp.open("POST", url);
        xhttp.send();

    }






</script>
</body>
</html>