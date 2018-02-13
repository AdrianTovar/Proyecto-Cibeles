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
