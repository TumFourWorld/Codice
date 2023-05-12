function ValidateEmail(inputText)
{
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!inputText.value.match(mailformat)) {
        alert("Email non valida , riprova!");
        document.contactForm.email.focus();
        return false;
    }
}
