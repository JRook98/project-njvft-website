<?php
// Initialize a database connection using database_connection.php
require 'includes/database_connection.php';

// Get image data from the database
$sql = "SELECT 
                landmark_id, 
                image_id, 
                image_url 
        
        FROM landmark_images";

$result = $conn->query($sql);
$images = array();

if ($result && $result->num_rows > 0) {
    // Loop through database rows and push into an array
    while($row = $result->fetch_assoc()) {
        $images[] = array(
            'landmark_id' => $row['landmark_id'],
            'image_id'    => $row['image_id'],
            'img_url'     => $row['image_url']
        );
    }
}

// Close the connection
$conn->close();
?>
