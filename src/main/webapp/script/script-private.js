function registraAttivita(value) {
    const xhttp = new XMLHttpRequest();

    let att1 = document.getElementById("att1").checked ? true : false;
    let att2 = document.getElementById("att2").checked ? true : false;
    let att3 = document.getElementById("att3").checked ? true : false;

    let url = "processoAttivita?att1="+att1+"&att2="+att2+"&att3="+att3;
    xhttp.open("POST", url, true);

    xhttp.onload = function () {
        if (this.status = 200) {
            let new_risposta = this.responseText;
            if (new_risposta === 'success') {
                alert("Registrazione ad attivita effettuata con successo");
            } else if(new_risposta === 'failure'){
                alert("Errore in registrazione, per favore ritenta");
            }
        }
    }
    xhttp.send();
}


function getAttivita() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "processoAttivita", true);
    xhttp.responseType = "json";

    xhttp.onload = function () {
        if (this.status === 200) {
            let my_JSON_array = this.response;
            document.getElementById("formAttivita").style.display="block";

            if(my_JSON_array.length > 0) {
                let current_JSON_object = JSON.parse(my_JSON_array[0]);
                for(let key in current_JSON_object) {
                    if(key === 'att1') {
                        if(current_JSON_object[key]===true) {
                            let checkbox = document.getElementById("att1");
                            checkbox.checked = true;
                        }
                    }
                    if(key === 'att2') {
                        if(current_JSON_object[key]===true) {
                            let checkbox = document.getElementById("att2");
                            checkbox.checked = true;
                        }
                    }
                    if(key === 'att3') {
                        if(current_JSON_object[key]===true) {
                            let checkbox = document.getElementById("att3");
                            checkbox.checked = true;
                        }
                    }
                }
            }
        }
    }

    xhttp.send();
}

function getUserData() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "retrieveUserData", true);
    xhttp.responseType = "json";

    xhttp.onload = function () {
        //se ok prendo risposta
        if (this.status = 200) {
            let my_JSON_array = this.response;
            document.getElementById("display-user").style.display="block";
            let table = document.getElementById("table-output")
            while(table.childNodes.length) {
                table.removeChild(table);
            }

            //style

            if(my_JSON_array===null) {
                document.getElementById("display-user").innerText = "No data avaiable";
            }

            if(my_JSON_array.length > 0) {
                //style

                let thead = table.createTHead();
                let row = thead.insertRow();

                let header = ["Nome", "Cognome", "Data di Nascita", "Email", "Telefono", "Username"];

                for(let key of header) {
                    let th = document.createElement("th");
                    //style

                    let text = document.createTextNode(key);
                    th.appendChild(text);
                    row.appendChild(th);
                }

                //creating table rows
                for(let i=0; i<my_JSON_array.length; i++) {
                    row = table.insertRow();
                    let current_JSON_object = JSON.parse(my_JSON_array[i]);

                    for(let key in current_JSON_object) {
                        let cell = row.insertCell();
                        //cell style
                        let text = document.createTextNode(current_JSON_object[key]);
                        cell.appendChild(text);
                    }

                }
            } else {
                document.getElementById("display-user").innerHTML = "No data avaiable";
            }

        }
    }

    xhttp.send();
}

function deleteUser() {
    const xhttp = new XMLHttpRequest();
    let url = "deleteUser";
    xhttp.open("POST", url, true);

    xhttp.onload = function () {
        if (this.status = 200) {
            let new_risposta = this.responseText;
            if (new_risposta === 'success') {
                alert("Cancellazione utente effettuata con successo");

                window.location.href="index.jsp";
            } else if(new_risposta === 'failure'){
                alert("Errore in cancellazione, per favore ritenta");
            }
        }
    }
    xhttp.send();
}


function reset(){
    document.getElementById("display-user").style.display="none";
}