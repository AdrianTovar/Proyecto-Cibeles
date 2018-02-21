/* Menu acordeon para Versión Móvil */
var acc = document.getElementsByClassName("acordeon");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var plegar = this.nextElementSibling;
    if (plegar.style.maxHeight){
      plegar.style.maxHeight = null;
    } else {
      plegar.style.maxHeight = plegar.scrollHeight + "px";
    }
  });
}
/* Menu acordeon para Versión Móvil */

/* **************************************************** */

$(document).ready(function(){
  $("#feedimg").css("height", "60").css("float", "left").css("margin", "10px");
  $("#feedtext").css("");
});

  setInterval(function(){
    $("#feedback").fadeToggle("slow");
    setTimeout(function(){
      $.getJSON('./recursos/rrss.json', function(response){
        var longJSON = Object.keys(response.feedbacks).length;
        var random = 0;
        random = Math.floor(Math.random()*longJSON);

        $("#feedtext").text(response.feedbacks[random].feedback);
        $("#feedimg").attr("src", response.feedbacks[random].imagen);
        $("#feeduser").text(response.feedbacks[random].usuario);
        $("#feedback").fadeIn("slow");
      });
    }, 1000);
  }, 5000);
