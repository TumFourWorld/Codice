function ValidateEmail(inputText)
{
    let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!inputText.match(mailformat)) {
        return false;
    }
    return true;
}

function wrongPage() {
    alert("Non hai i permessi di accedere a questa pagina");
    window.history.back();
}

function containsUppercase(str) { /* controlla se contiene almeno una lettera maiuscola. se si ritrona true*/
    return /[A-Z]/.test(str);
}

function containsNumbers(str) { /* controlla se stringa contiene un numero. se si ritorna true else false*/
    return /\d/.test(str);
}




function confermaAtt() { /* finta conferma di selezione attivita*/
    alert("ti sei iscritto con successo alle attività!");
}

function checkNome(nome){
    if(nome===""){
        alert("Il campo nome è vuoto");
        return false
    }
    else
    {
        return true;
    }
}
function checkCognome(cognome){
    if(cognome===""){
        alert("Il campo cognome è vuoto");
        return false
    }
    else
    {
        return true;
    }
}

function check18(data){
    var currentDate = new Date();
    var inputDate = new Date(data);
    var age = currentDate.getFullYear() - inputDate.getFullYear();
    var monthDiff = currentDate.getMonth() - inputDate.getMonth();
    var dayDiff = currentDate.getDate() - inputDate.getDate();

    if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
        age--;
    }

    return age >= 18;
}
function checkData(data){
    if(data===""){
        alert("Il campo data è vuoto");
        return false
    }
    if(!check18(data)){
        alert("Sei minorenne , non puoi iscriverti al sito");
        return false;
    }
    return true;

}
function checkEmail(email){
    if(email===""){
        alert("Il campo mail è vuoto");
        return false
    }
    if(!ValidateEmail(email)){
        alert("La mail non è corretta");
        return false;
    }

    return true;
}

function checkNum(num){
    if(num===""){
        alert("Il campo num_tel è vuoto");
        return false
    }

    return true;
}
function checkSimp(simp){
    if(simp===""){
        alert("Il campo simp è vuoto");
        return false
    }

    return true;
}
function checkUser(user){
    if(user===""){
        alert("Il campo user è vuoto");
        return false
    }

    return true;
}

function checkPass(pass,psw){
    if(pass===""){
        alert("Il campo password è vuoto");
        return false
    }
    if(psw===""){
        alert("Il campo checkpassword è vuoto");
        return false;
    }

    if(pass.length <8) {
        alert("Password troppo corta");
        return false;
    }
    if(!((pass.includes("d") || pass.includes("D")) && (pass.includes("A") || pass.includes("a")) && (pass.includes("M") || pass.includes("m")))) {
        alert("La password deve contenere almeno uno dei seguenti caratteri: D-A-M maiuscola o minuscola");
        return false;
    }
    if(!(pass.includes("!") || pass.includes("$") || pass.includes("?"))) {
        alert("La pasword deve contenere almeno uno dei seguenti caratteri: ? - ! - $");
        return false;
    }
    if(!containsUppercase(pass)) {
        alert("La password deve contenere almeno una lettera maiuscola!");
        return false;
    }
    if(!containsNumbers(pass)) {
        alert("La password deve contenere almeno un numero!");
        return false;
    }
    if(!(pass === psw)) {
        alert("Le due password non coincidono!")
        return false;
    }

    return true;
}

function checkPass2(pass) {
    if (pass === "") {
        alert("Il campo password è vuoto");
        return false
    }
    return true;
}

function validate() {
    let nome = document.getElementById("nome").value;
    let cognome = document.getElementById("cognome").value;
    let data_nascita = document.getElementById("datanascita").value;
    let email = document.getElementById("email").value;
    let num_tel = document.getElementById("numtel").value;
    let simp = document.forms["signUpForm"]["scelta"].value;
    let username = document.getElementById("uname").value;
    let psw = document.getElementById("psw").value;
    let pswcheck = document.getElementById("pswcheck").value;

    if(checkNome(nome) && checkCognome(cognome) && checkData(data_nascita) && checkEmail(email) && checkNum(num_tel) && checkSimp(simp) && checkUser(username) && checkPass(psw,pswcheck)){
        makeRegistration(nome,cognome,data_nascita,email,num_tel,simp,username,psw);
    }
}

function makeRegistration(nome,cognome,data_nascita,email,num_tel,simp,username,password) {

    let url = "registrazioneServlet?nome="+nome+"&cognome="+cognome+"&data_nascita="+data_nascita+"&email="+email+"&num_tel="+num_tel+"&scelta="+simp+"&uname="+username+"&psw="+password;

    //make request
    const xhttp = new XMLHttpRequest();


    xhttp.onload=function() {
        if (this.status === 200 && this.readyState === 4) {
            let new_risposta = this.responseText;
            if (new_risposta === "success") {
                window.location.href = 'regConfermata.jsp';
            } else if (new_risposta === "user_existing") {
                alert("28:Utente già registrato")
                window.location.href = 'registrazione.jsp';
            }
        }
    }

    xhttp.open("POST", url,false);
    xhttp.send();

}

function makeLogin(username,password){
    let url = "loginServlet?username="+username+"&password="+password;

    //make request
    const xhttp = new XMLHttpRequest();


    xhttp.onload=function() {
        if (this.status === 200 && this.readyState === 4) {
            let risposta = this.responseText;
            if (risposta === "successSimp") {
                window.location.href = 'simpatizzante.jsp';
            } else if(risposta==="successAderente"){
                window.location.href = 'aderente.jsp';
            } else if(risposta==="successAdmin"){
                window.location.href = 'amministratore.jsp';
            }else if (risposta === "psw_err") {
                alert("28:Hai sbagliato la password");
                window.location.href = 'login.jsp';
            } else if(risposta === "user_not_existing"){
                alert("28:Non esiste l'utente con questo username");
                window.location.href = 'login.jsp';
            }
        }
    }

    xhttp.open("GET", url,false);
    xhttp.send();
}

function login(){
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    if(checkUser(username) && checkPass2(password)){
        makeLogin(username,password);
    }
}

function gobackAtt() {
    window.location.href = 'attivita.jsp'
}

function incrementa(pagina){
    let url = "visualServlet?pagina="+pagina;

    //make request
    const xhttp = new XMLHttpRequest();

    xhttp.open("POST", url,false);
    xhttp.send();
}

function checkMotivo(motivo){
    if(motivo===""){
        alert("Il campo motivo è vuoto");
        return false;
    }
    return true;
}

function checkText(testo){
    if(testo===""){
        alert("La text area è vuota");
        return false;
    }
    return true;
}

function validateContact(){
    let nome = document.getElementById("nome").value;
    let cognome = document.getElementById("cognome").value;
    let email = document.getElementById("email").value;
    let motivo = document.getElementById("motCont").value;
    let testo = document.getElementById("textarea").value;

    if(checkNome(nome) && checkCognome(cognome) && checkEmail(email) && checkMotivo(motivo) && checkText(testo)){
        sendMail(nome,cognome,email,motivo,testo);
    }

}

function getCookie(nome){
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        const [cookieName, cookieValue] = cookie.split('=');

        if (cookieName === nome) {
            return decodeURIComponent(cookieValue);
        }
    }

    // Cookie not found
    return null;
}

