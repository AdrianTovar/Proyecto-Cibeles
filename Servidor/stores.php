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
          if(isset($_REQUEST['store_id'])){
            $stmt = $conn->prepare("SELECT * FROM stores where store_id = :store_id");
            $stmt->execute(array(':store_id' => $_REQUEST['store_id']));
          }else{
            $stmt = $conn->prepare("SELECT * FROM stores");
            $stmt->execute();
          }

          //Obtenemos datos de la consulta
          $stmt->setFetchMode(PDO::FETCH_OBJ);
          $stores = $stmt->fetchAll();

          $ok = array('estatus'=>true, 'stores'=>$stores);
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
