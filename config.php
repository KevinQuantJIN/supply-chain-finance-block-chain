<?php
// Database configuration
$db_host = "localhost"; // Hostname
$db_name = "supplychainf"; // Database name
$db_user = "root"; // Database username
$db_pass = ""; // Database password

// Create a new MySQLi connection
$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Check if the connection was successful
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
