<?php
require 'db_connect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To Do App</title>
</head>

<body>
    <h1>To Do List Items</h1>
    <p>These are loaded on the server from MySQL</p>
    <ul>
        <?php
        $sql = "SELECT * FROM todos";
        $stmt = $pdo->query($sql);
        while ($row = $stmt->fetch()) {
            echo "<li>" . $row['text'] . "</li>";
        }
        ?>
    </ul>
</body>

</html>