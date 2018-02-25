if(!localStorage.getItem("num_art")){
  localStorage.setItem("num_art", 0);
}else{
  var num_art = localStorage.getItem("num_art");
  $("#num_art").text(num_art);
}

if(!localStorage.getItem("pre_art")){
  localStorage.setItem("pre_art", 0);
}else{
  var pre_art = localStorage.getItem("pre_art");
  $("#pre_art").text(pre_art);
}
