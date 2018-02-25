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
          if(isset($_REQUEST['curso_id'])){
            $stmt = $conn->prepare("SELECT * FROM cursos where product_id = :product_id");
            $stmt->execute(array(':product_id' => $_REQUEST['product_id']));
          // }elseif ($_REQUEST['brand_id']) {
          //   $stmt = $conn->prepare("SELECT * FROM products where brand_id = :brand_id");
          //   $stmt->execute(array(':brand_id' => $_REQUEST['brand_id']));
          }elseif ($_REQUEST['category_id']) {
            $stmt = $conn->prepare("SELECT * FROM products where category_id = :category_id");
            $stmt->execute(array(':category_id' => $_REQUEST['category_id']));
          }else{
            $stmt = $conn->prepare("SELECT * FROM cursos");
            $stmt->execute();
          }

          //Obtenemos datos de la consulta
          $stmt->setFetchMode(PDO::FETCH_OBJ);
          $products = $stmt->fetchAll();

          $ok = array('estatus'=>true, 'cursos'=>$products);
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
