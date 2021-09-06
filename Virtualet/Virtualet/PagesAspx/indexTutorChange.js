function setTutor(chave) {
    var conteudo = chave;

    window.localStorage.setItem('tutorial', conteudo);
}

function loadingEnd() {
    document.getElementById('loadingscreen').style = "display:none";
}
