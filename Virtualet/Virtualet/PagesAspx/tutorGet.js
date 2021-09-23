function getIndexTutor() {
    document.getElementById('loadingscreen').style = "display:none;";
    var chave = window.localStorage.getItem('tutorial');

    if (chave == 1) {
        document.getElementById('testechave').innerHTML = "Introdução a Criptomoedas";
        document.getElementById('tutorialiframe').src = "tutorbasic.aspx";
        document.getElementById('ante').style = "opacity:0; cursor:auto;";
        document.getElementById('sl1').className = "sel";
    }
    else if (chave == 2) {
        document.getElementById('testechave').innerHTML = "Segurança e Cuidados";
        document.getElementById('tutorialiframe').src = "tutorinter.aspx";
        document.getElementById('sl2').className = "sel";
    }
    else if (chave == 3) {
        document.getElementById('testechave').innerHTML = "Glossário";
        document.getElementById('tutorialiframe').src = "gloss.aspx";
        document.getElementById('sl3').className = "sel";
        document.getElementById('prox').style = "opacity:0; cursor:auto";
    }
    else {
        document.getElementById('testechave').innerHTML = "Introdução a Criptomoedas";
        document.getElementById('tutorialiframe').src = "tutorbasic.aspx";
        document.getElementById('ante').style = "opacity:0; cursor:auto;";
        document.getElementById('sl1').className = "sel";
    }
}

function ProxTutor() {
    var X = window.localStorage.getItem('tutorial');
    if (X < 4){
        X++;
        window.localStorage.setItem('tutorial', X);
        location.reload();
    }
}

function VoltaTutor() {
    var X = window.localStorage.getItem('tutorial');
    if (X > 1) {
        X = X - 1;
        window.localStorage.setItem('tutorial', X);
        location.reload();
    }   
}

function changeTutor(index) {
    window.localStorage.setItem('tutorial', index);
    location.reload();
}