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
        alert("Minorenne");
        return false;
    }else{
        alert("Maggiorenne");
        return true;
    }

}

function containsUppercase(str) { /* controlla se contiene almeno una lettera maiuscola. se si ritrona true*/
    return /[A-Z]/.test(str);
}

function containsNumbers(str) { /* controlla se stringa contiene un numero. se si ritorna true else false*/
    return /\d/.test(str);
}


function validateRegistration() {
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
        return false;
    }
    let psw = document.getElementById("psw");
    let pswcheck = document.getElementById("pswcheck");

    if(psw.value.length <8) {
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
    } else if(!(pswcheck.value == psw.value)) {
        console.log(pswcheck.value);
        console.log(psw.value);
        alert("Le due password non coincidono!")
    }
}

function confermaAtt() { /* finta conferma di selezione attivita*/
    alert("ti sei iscritto con successo alle attività!");
}
