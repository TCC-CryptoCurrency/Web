function getIndexTutor() {
    document.getElementById('loadingscreen').style = "display:none;";
    var chave = window.localStorage.getItem('tutorial');

    if (chave == 1) {
        document.getElementById('testechave').innerHTML = "Tutorial Básico";
        document.getElementById('tutorialiframe').src = "tutorbasic.aspx";
    }
    if (chave == 2) {
        document.getElementById('testechave').innerHTML = "Tutorial intermediário";
        document.getElementById('tutorialiframe').src = "tutorinter.aspx"
    }
    if (chave == 3) {
        document.getElementById('testechave').innerHTML = "Tutorial Avançado";
        document.getElementById('tutorialiframe').src = "tutoradv.aspx"
    }
    if (chave == 4) {
        document.getElementById('testechave').innerHTML = "Glossário";
        document.getElementById('tutorialiframe').src = "gloss.aspx"
    }
}