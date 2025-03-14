<?php
$host = $_ENV['MYSQL_HOST'];
$port = $_ENV['MYSQL_TCP_PORT'];
$db = $_ENV['MYSQL_DATABASE'];
$user = $_ENV['MYSQL_USER'];
$pass = $_ENV['MYSQL_PASSWORD'];
$charset = "utf8mb4";

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8";
$options = [];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);

    if (basename(__FILE__) == basename($_SERVER['SCRIPT_FILENAME'])) {
        echo "Connected to the database successfully!";
    }
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>