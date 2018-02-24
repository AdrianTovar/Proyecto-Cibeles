<?php
    require_once 'cfg.php';
    require_once 'libs/ErrorHandler.php';
    require_once 'libs/DB.php';
    require_once 'libs/jwt_helper.php';

    $conn = DB::getDbConn();

    try {
      $method = $_SERVER['REQUEST_METHOD'];

      switch($method){
        case 'POST':

//Verificamos token
        $cfg = Config::getInstance();
        $key = $cfg->get(ConfigKeys::JSON_TOKEN_KEY);

        $token = $_POST['token'];
        $datosToken = JWT::decode($token, $key);
        if($datosToken->user_id>0){

  //Realizamos consulta
          $stmt = $conn->prepare("SELECT * FROM shoppingcarts where user_id = :user_id");
          $stmt->execute(array(':user_id' => $datosToken->user_id));
          $stmt->setFetchMode(PDO::FETCH_OBJ);
          $products = $stmt->fetchAll();

          $ok = array('estatus'=>true, 'shoppingcarts'=>$products);
          header('Content-type: application/json');
          echo json_encode($ok);
        }else{
          $error = array('estatus'=>0, 'msg'=>'Error en token');
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
