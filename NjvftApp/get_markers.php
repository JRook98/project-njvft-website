<?php
// Initialize a database connection using database_connection.php
require 'includes/database_connection.php';

// Get coordinates and informational data from the database
$sql = "SELECT 
             l.landmark_id,
             l.category_id,
             l.name, 
             l.description,
             l.fact,
             l.latitude, 
             l.longitude,
             l.official_url,

             i.image_id,
             i.landmark_id,
             i.image_url

        FROM landmarks l

        LEFT JOIN landmark_images i ON l.landmark_id = i.landmark_id";


$result = $conn->query($sql);

$locations = array();

if ($result->num_rows > 0) {
    // Loop through database rows and push into an array
    while($row = $result->fetch_assoc()) {
        $locations[] = array(
            'landmark' => $row['landmark_id'],
            'category' => (string)$row['category_id'],
            'name' => $row['name'],
            'description' => $row['description'],
            'fact' => $row['fact'],
            'lat'  => (float)$row['latitude'],
            'lng'  => (float)$row['longitude'],
            'web_url' => $row['official_url'],
            'image' => $row['image_id'],
            'img_url' => $row['image_url']
        );
    }
}

// Output the data
echo json_encode($locations);

// Close the connection
$conn->close();
?>
