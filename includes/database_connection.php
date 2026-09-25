<?php
// Database configuration
$host = "localhost";
$username = "root";
$password = "root";
$dbname = "njvft_db";

// Connect to MySQL database
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}