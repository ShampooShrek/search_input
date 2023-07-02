<?php
define("host", "localhost");
define("username", "root");
define("password", "");
define("database", "search_database");

$connect = new mysqli(host, username, password, database);

if($connect->connect_error) {
  die("Erro na conexão:" . $connect->connect_error);
}

?>