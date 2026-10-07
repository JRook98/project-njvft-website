<?php
// Set headers for JSON delivery
header('Content-Type: application/json');

require 'includes/database_connection.php'; 

// Catch raw incoming JSON data from fetch request
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, true);

// Validate that data is being passed
if (!isset($input['landmark_id']) || !isset($input['rating_val'])) {
    echo json_encode(['success' => false, 'message' => 'Invalid or missing parameters.']);
    exit();
}

// Ensure data is passed as an integer
$landmark_id = (int)$input['landmark_id'];
$rating_val  = (int)$input['rating_val'];

// Ensure rating falls cleanly between 1 and 5
if ($rating_val < 1 || $rating_val > 5) {
    echo json_encode(['success' => false, 'message' => 'Rating must be between 1 and 5.']);
    exit();
}

// Save rating into ratings table

$sql = "INSERT INTO ratings (landmark_id, rating_val) VALUES (?, ?) 
        ON DUPLICATE KEY UPDATE rating_val = ?";

// Countermeasure against SQL Injection
$stmt = $conn->prepare($sql);

if ($stmt) {
    // Bind parameters: 'i' for integer (landmark_id, rating_val, rating_val)
    $stmt->bind_param("iii", $landmark_id, $rating_val, $rating_val);
    
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Rating saved successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Database execution failed: ' . $stmt->error]);
    }
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Statement preparation failed: ' . $conn->error]);
}

$conn->close();
