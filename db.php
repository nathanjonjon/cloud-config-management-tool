<?php

$connection = new PDO('mysql:host=localhost;dbname=Pass', 'Nextlink', '1234');
$statement  = $connection->query('SELECT message FROM Pass');

echo $statement->fetchColumn(); 