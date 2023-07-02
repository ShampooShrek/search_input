<?php
  require("../server/index.php");
  header("Content-Type: application/json");

  $value = $_POST["value"];

  if($value != "") {
    $paramValue = "%$value%";
  
    $sqlBooks = "SELECT b.title, b.image, a.name as author FROM books b
    JOIN authors a ON b.author = a.id
    WHERE title like ? or a.name like ?
    limit 4";
    
    $stmtBooks = mysqli_prepare($connect, $sqlBooks);
    mysqli_stmt_bind_param($stmtBooks, "ss", $paramValue, $paramValue);
    mysqli_stmt_execute($stmtBooks);
    mysqli_stmt_bind_result($stmtBooks, $title, $image, $author);

    $booksResult = array();
    while (mysqli_stmt_fetch($stmtBooks)) {
      $book = array(
        'title' => $title,
        'image' => $image,
        'author' => $author
      );
      $booksResult[] = $book;
    }

    $result = [
      'livros' => $booksResult
    ];
  
    echo json_encode($result);
  }
?>
