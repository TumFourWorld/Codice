function ValidateEmail(inputText)
{
    let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!inputText.value.match(mailformat)) {
        alert("Email non valida , riprova!");
        document.contactForm.email.focus();
        return false;
    }
    return true;
}

function wrongPage() {
    alert("Non hai i permessi di accedere a questa pagina");
    window.history.back();
}

function ValidateData(inputText){
    alert(inputText);
    // it will accept two types of format yyyy-mm-dd and yyyy/mm/dd
    let optimizedBirthday = inputText.replace(/-/g, "/");

    //set date based on birthday at 01:00:00 hours GMT+0100 (CET)
    let myBirthday = new Date(optimizedBirthday);

    // set current day on 01:00:00 hours GMT+0100 (CET)
    let currentDate = new Date().toJSON().slice(0,10)+' 01:00:00';

    // calculate age comparing current date and borthday
    let myAge = ~~((Date.now(currentDate) - myBirthday) / (31557600000));

    if(myAge < 18) {
        alert("Sei minorenne");
        return false;
    }else{
        return true;
    }

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


function regVal(){
    //validazione campi vuoti
    let nomeVal = document.forms["formRegistrazione"]["nome"].value;
    let cognomeVal= document.forms["formRegistrazione"]["cognome"].value;
    let dataVal = document.forms["formRegistrazione"]["dataNascita"].value;
    let emailVal = document.forms["formRegistrazione"]["email"].value;
    let numVal = document.forms["formRegistrazione"]["numtel"].value;
    let simpVal = document.forms["formRegistrazione"]["simp"].value;
    let userVal = document.forms["formRegistrazione"]["uname"].value;
    let pswVal = document.forms["formRegistrazione"]["psw"].value;
    let psw2Val = document.forms["formRegistrazione"]["pswcheck"].value;

    if(nomeVal===""){
        alert("Il campo nome è vuoto");
        return;
    } else if(cognomeVal===""){
        alert("Il campo cognome è vuoto");
        return;
    }
    else if(dataVal===""){
        alert("Il campo data è vuoto");
        return;
    }
    else if(emailVal===""){
        alert("Il campo email è vuoto");
        return;
    }
    else if(numVal===""){
        alert("Il campo num-tel è vuoto");
        return;
    }
    else if(simpVal===""){
        alert("Non hai selezionato il campo simpatizzante o aderente");
        return;
    }
    else if(userVal===""){
        alert("Il campo username è vuoto");
        return;
    }
    else if(pswVal===""){
        alert("Il campo password è vuoto");
        return;
    }
    else if(psw2Val===""){
        alert("Il campo password check è vuoto");
        return;
    }



    //validazione anni >18
    let data= document.getElementById("dataNascita");
    if(!ValidateData(data)){
        return;
    }


    //validazione formato email
    let email = document.getElementById("email");
    if(!ValidateEmail(email)){
        return;
    }

    //validazione password e password check
    let psw = document.getElementById("psw");
    let pswcheck = document.getElementById("pswcheck");
    if(psw.value.length <8) {
        alert("Password troppo corta")
        return;
    } else if(!((psw.value.includes("d") || psw.value.includes("D")) && (psw.value.includes("A") || psw.value.includes("a")) && (psw.value.includes("M") || psw.value.includes("m")))) {
        alert("La password deve contenere almeno uno dei seguenti caratteri: D-A-M maiuscola o minuscola");
        return;
    } else if(!(psw.value.includes("!") || psw.value.includes("$") || psw.value.includes("?"))) {
        alert("La pasword deve contenere almeno uno dei seguenti caratteri: ? - ! - $");
        return;
    } else if(!containsUppercase(psw.value)) {
        alert("La password deve contenere almeno una lettera maiuscola!");
        return;
    } else if(!containsNumbers(psw.value)) {
        alert("La password deve contenere almeno un numero!");
        return;
    } else if(!(pswcheck.value == psw.value)) {
        alert("Le due password non coincidono!")
        return;
    }

    makeQuery();
}


function makeQuery(){
    //preparing request

}