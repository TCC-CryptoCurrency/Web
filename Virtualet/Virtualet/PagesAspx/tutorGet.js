function getIndexTutor() {
    document.getElementById('loadingscreen').style = "display:none;";
    var chave = window.localStorage.getItem('tutorial');

    if (chave == 1) {
        document.getElementById('testechave').innerHTML = "Tutorial Básico";
        document.getElementById('tutorialiframe').src = "tutorbasic.aspx";
        document.getElementById('btnVolta').style = "display: none;";
    }
    if (chave == 2) {
        document.getElementById('testechave').innerHTML = "Tutorial Intermediário";
        document.getElementById('tutorialiframe').src = "tutorinter.aspx";
    }
    if (chave == 3) {
        document.getElementById('testechave').innerHTML = "Tutorial Avançado";
        document.getElementById('tutorialiframe').src = "tutoradv.aspx";
    }
    if (chave == 4) {
        document.getElementById('testechave').innerHTML = "Glossário";
        document.getElementById('tutorialiframe').src = "gloss.aspx";
        document.getElementById('btnProx').style = "display: none;";
    }
}

function ProxTutor() {
    var X = window.localStorage.getItem('tutorial');
    if (X < 4){
        X++;
        window.localStorage.setItem('tutorial', X);
        Location.reload();
    }
}

function VoltaTutor() {
    var Y = window.localStorage.getItem('tutorial');
        Y = Y - 1;
        window.localStorage.setItem('tutorial', 2);
    Location.reload();
    
}

function GlossTutor() {
}