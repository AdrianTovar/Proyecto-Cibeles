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
  inputs[i].addEventListener('blur',quitaFoco);
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
