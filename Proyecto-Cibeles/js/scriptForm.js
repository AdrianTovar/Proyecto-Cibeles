onload=function(){

var formulario = document.forms[0];

function ponFoco(e){
  e.target.style.outline = "purple solid 1px";
}

function quitaFoco(e){
  e.target.style.outline = "none";
}

var inputs = document.querySelectorAll("input");
for(var i = 0; i<inputs.lenght-1; i++){
  inputs[i].addEventListener('focus',ponFoco);
  inputs[i].addEventListener('blur'quitaFoco);
}

formulario.onsubmit = function(e){
var miss = document.getElementsByClassName('errores')[0];
var missList ="";
var ret = true;
e.preventDefault();

 var nom = document.getElementById('nombre').value;
 if (nom==null||nom.length==0 || !(/^\S+[\s?\S+]*$/.test(nom))) {
   missList += "El nombre introducido es erroneo, introduzca un valor valido <br>";
   ret = false;
 }
 var lastName = document.getElementById('apellidos').value;
 if (lastName==null||lastName==0||!(/^\S+[\s?\S+]*$/.test(lastName))) {
    missList += "Los apellidos introducidos son erroneos";
    ret = false;
 }

 var email = document.getElementById('email').value;
 if (!/^\w+@\w+\.\w+$/.test(email)) {
   missList +="Email erróneo";
   ret=false;
 }

 var compEmail = document.getElementById('emailRepe').value;
 if (compEmail != email) {
   missList += "Los emails no coinciden";
   ret= false;
 }


    var fecha = (document.getElementById("fecha").value).split("-");
    var year = fecha[0];
    var month = fecha[1];
    var day = fecha[2];
    var fechaCreada = new Date(year,(month - 1),day);
    var hoy = new Date();
    var age = hoy.getFullYear() - year - 1;
    if (hoy.getMonth()+1-month>0) {
      age++;
    }
    if (hoy.getUTCDate()-year>=0) {
      age++;
    }
    if( isNaN(fechaCreada) || day > 31 ||day < 1 || month < 1 || month >12 || year < 0 || year >= hoy.getFullYear()){
      missList += "La fecha introducida es errónea";
      ret = false;
    }else if (age < 18) {
      missList += "Debe ser mayor de edad para inscribirse </br>"
      ret = false;
    }

    var fav = document.getElementById('selector').value;
    if (fav==0 || fav == null) {
      missList += "Escoja un favorito";
      ret = false;
    }

    if (!document.getElementById("efectivo").checked && !document.getElementById("tarjeta").checked) {
      ret = false;
      missList += "No ha seleccionado un método de pago <br>";
    }
    if (!document.getElementById("cond").checked) {
      ret = false;
      missList += "No se ha aprobado las condiciones de alta <br>";
    }

 if (ret){

      formulario.action = fav+".html"
      formulario.submit();
      document.getElementById("enviar").value = "Enviando...";
      document.getElementById("enviar").disabled = true;
    }else{
      miss.style.color= "red";

    }
    miss.innerHTML = missList;

}
}
