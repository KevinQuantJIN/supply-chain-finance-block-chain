<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once "config.php";

$data = json_decode(file_get_contents("php://input"));



if (
    !empty($data->user_type) &&
    !empty($data->user_name) &&
    !empty($data->pswd) &&
    !empty($data->email) &&
    !empty($data->address) &&
    !empty($data->telephone)
) {
    // Fix 1: Store the hashed password in a variable
    $hashed_password = password_hash($data->pswd, PASSWORD_DEFAULT);

    $query = "INSERT INTO user_info (user_type, user_name, pswd, email, address, telephone) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($query);
    // Pass the hashed password variable to bind_param()
    $stmt->bind_param("ssssss", $data->user_type, $data->user_name, $hashed_password, $data->email, $data->address, $data->telephone);

    if ($stmt->execute()) {
        http_response_code(201);
        echo json_encode(["message" => "User was created."]);
    } else {
        http_response_code(503);
        echo json_encode(["message" => "Unable to create user."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["message" => "Unable to create user. Data is incomplete."]);
}
