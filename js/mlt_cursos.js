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

$.getJSON('./Servidor/cursos.php', function(response){
  var jsonCursos = response;

  $.each(response.cursos, function(i, campo){
    $("<div>").attr("class", "curso col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12").appendTo("#lista_cursos");
    $("<img>").attr("src", campo.img).appendTo(".curso:last");
    $("<span>").text(campo.name).appendTo(".curso:last");
    $("<br>").appendTo(".curso:last");
    $("<span>").text(campo.description).appendTo(".curso:last");
    $("<br>").appendTo(".curso:last");
    $("<span>").text(campo.price + " €").attr("id", "precio").appendTo(".curso:last");
    $("<button>").attr("class", "boton_contratar").attr("id", i).attr("value", "Contratar").text("Contratar").appendTo(".curso:last");
  });

  $("button").click(function(){
    var clase = $(this).attr("class");
    console.log(clase);
    if(clase == "boton_contratar"){
      var curso_elegido = $(this).attr("id");
      /* Control de los articulos */
      var articulos = localStorage.getItem("num_art");
      articulos ++;
      localStorage.setItem("num_art", articulos);
      /* Control de los articulos */
      /* Control del precio */
      var precio = parseFloat(jsonCursos.cursos[curso_elegido].price) + parseFloat(localStorage.getItem("pre_art"));
      localStorage.setItem("pre_art", precio.toFixed(2));
      /* Control del precio */
      $("#pre_art").text(localStorage.getItem("pre_art"));
      $("#num_art").text(localStorage.getItem("num_art"));
    }
  });

});
