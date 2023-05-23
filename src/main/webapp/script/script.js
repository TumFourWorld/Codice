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




function confermaAtt() { /* finta conferma di selezione attivita*/
    alert("ti sei iscritto con successo alle attività!");
}
