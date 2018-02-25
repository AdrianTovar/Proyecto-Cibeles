  if(window.XMLHttpRequest){
    var xhr = new XMLHttpRequest();
  }else if(ActiveXObject("Microsoft.XMLHTTP")){
    var xhr = new ActiveXObject("Microsoft.XMLHTTP");
  }

  $("#desconectar").hide();

  conectar.onclick = function(e){
    e.preventDefault();
    var usuario = encodeURIComponent(user.value);
    var passw = encodeURIComponent(pass.value);

    xhr.onreadystatechange = function(){
      if(xhr.readyState == 4 && xhr.status == 200){
        var response = JSON.parse(xhr.responseText);

        if(response.estatus == true){
          localStorage.setItem("token", response.token);
          $("#formLogin").hide();
          $("#desconectar").show();
          $("#bt_identificate").text("Hola, " + response.usuario);
        }else if(response.estatus == 0){
          msgLogin.innerHTML = response.msg;
        }
      }
    }

    xhr.open("POST", "./Servidor/login.php", true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("usr="+usuario+"&pass="+passw);
  }
