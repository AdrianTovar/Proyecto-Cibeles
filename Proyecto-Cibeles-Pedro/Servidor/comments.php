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
        case 'GET':

          $stmt = NULL;
          if(isset($_REQUEST['comment_id'])){
            $stmt = $conn->prepare("SELECT * FROM comments where comment_id = :comment_id");
            $stmt->execute(array(':comment_id' => $_REQUEST['comment_id']));
          }elseif ($_REQUEST['user_id']) {
            $stmt = $conn->prepare("SELECT * FROM comments where user_id = :user_id");
            $stmt->execute(array(':user_id' => $_REQUEST['user_id']));
          }elseif ($_REQUEST['product_id']) {
            $stmt = $conn->prepare("SELECT * FROM comments where product_id = :product_id");
            $stmt->execute(array(':product_id' => $_REQUEST['product_id']));
          }else{
            $stmt = $conn->prepare("SELECT * FROM comments");
            $stmt->execute();
          }

          //Obtenemos datos de la consulta
          $stmt->setFetchMode(PDO::FETCH_OBJ);
          $products = $stmt->fetchAll();

          $ok = array('estatus'=>true, 'comments'=>$products);
          header('Content-type: application/json');
          echo json_encode($ok);

        break;

        default:
          //Método no soportado
          http_response_code(405);
          header('Allow: POST');
          header('Allow: GET');
        break;
      }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
?>
