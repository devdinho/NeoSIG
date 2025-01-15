<?php

use Dotenv\Dotenv;

require_once __DIR__ . '/../vendor/autoload.php';

$dontenv = Dotenv::createImmutable(__DIR__ . '/../');
$dontenv->load();

$dbuser = $_ENV['DB_USUARIO'];
$dbpassword = $_ENV['DB_SENHA'];
$dbname = $_ENV['DB_NOME'];
$host = $_ENV['DB_HOST'];
$dbport = $_ENV['DB_PORTA'];

try {
    $pdo = new PDO("mysql:host=$host;port=$dbport;dbname=$dbname", $dbuser, $dbpassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Erro ao conectar com o banco de dados: " . $e->getMessage();
    exit();
}
