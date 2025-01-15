<?php

// phpinfo();
require_once '../config/db.php';
try {
    $stmt = $pdo->query("SELECT 1");
    echo "Conexão com o banco de dados realizada com sucesso!";
} catch (PDOException $e) {
    echo "Erro de conexão com o banco de dados: " . $e->getMessage();
}
