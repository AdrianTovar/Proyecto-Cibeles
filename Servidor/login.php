<?php
try{
  require_once 'cfg.php';
  require_once 'libs/ErrorHandler.php';
  require_once 'libs/DB.php';
  require_once 'libs/jwt_helper.php';

  $method = $_SERVER['REQUEST_METHOD'];

  switch($method){
    case 'POST':

    $conn = DB::getDbConn();

    $user=$_POST['usr'];
    $pass=$_POST['pass'];

    $param=(array(':user' => $user, ':pass'=>md5($pass)));
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = :user AND password = :pass ");
    $stmt -> execute($param);
    $stmt->setFetchMode(PDO::FETCH_OBJ);

    if($stmt->rowcount()==1){
      $usuario = $stmt->fetch();

      $cfg = Config::getInstance();
      $key = $cfg->get(ConfigKeys::JSON_TOKEN_KEY);

      $datosToken = $usuario;
      $token = JWT::encode($datosToken, $key);

      $ok = array('estatus'=>true, 'token'=>$token);
      header('Content-type: application/json');
      echo json_encode($ok);
    }else{
      $error = array('estatus'=>0, 'msg'=>'Error en login');
      header('Content-type: application/json');
      echo json_encode($error);
    }
    break;

    default:
      //Método no soportado
      http_response_code(405);
      header('Allow: POST');
    break;
  }

} catch (PDOException $e) {
  echo "Error: " . $e->getMessage();
}

?>
