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

if (!empty($data->user_name) && !empty($data->pswd)) {
    $query = "SELECT * FROM user_info WHERE user_name = ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $data->user_name);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($data->pswd, $row["pswd"])) {
            http_response_code(200);
            echo json_encode(["message" => "Login successful.", "user" => $row]);
        } else {
            http_response_code(401);
            echo json_encode(["message" => "Invalid password."]);
        }
    } else {
        http_response_code(404);
        echo json_encode(["message" => "User not found."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["message" => "Unable to log in. Data is incomplete."]);
}
