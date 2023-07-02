<?php
  require("../server/index.php");
  header("Content-Type: application/json");

  $value = $_POST["value"];

  if($value != "") {
    $paramValue = "%$value%";
  
    $sqlBooks = "SELECT b.title, b.image, a.name FROM books b
    JOIN authors a ON b.author = a.id
    WHERE title like ? or a.name like ?
    limit 4
    ";
    
    $stmtBooks = $connect->prepare($sqlBooks);
    $stmtBooks->bind_param("ss", $paramValue, $paramValue);
    $stmtBooks->execute();
    
    $booksResult = $stmtBooks->get_result()->fetch_all(MYSQLI_ASSOC);
  
    $result = [
      'livros' => $booksResult
  ];
  
    echo json_encode($result);
  }

?>

