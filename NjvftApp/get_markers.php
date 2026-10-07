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
             
             img.image_url,
             img.image_id,

             COALESCE(rate.avg_rating, 0.0) AS avg_rating,
             COALESCE(rate.total_ratings, 0) AS total_ratings

        FROM landmarks l

        LEFT JOIN (
            SELECT landmark_id, MIN(image_id) AS image_id, MIN(image_url) AS image_url
            FROM landmark_images
            GROUP BY landmark_id
        ) img ON l.landmark_id = img.landmark_id

        LEFT JOIN (
            SELECT landmark_id, ROUND(AVG(rating_val), 1) AS avg_rating, COUNT(rating_id) AS total_ratings
            FROM ratings
            GROUP BY landmark_id
        ) rate ON l.landmark_id = rate.landmark_id";

$result = $conn->query($sql);
$locations = array();

if ($result && $result->num_rows > 0) {
    // Loop through database rows and push into an array
    while($row = $result->fetch_assoc()) {
        $locations[] = array(
            'landmark'      => $row['landmark_id'],
            'category'      => (string)$row['category_id'],
            'name'          => $row['name'],
            'description'   => $row['description'],
            'fact'          => $row['fact'],
            'lat'           => (float)$row['latitude'],
            'lng'           => (float)$row['longitude'],
            'web_url'       => $row['official_url'],
            'image'         => $row['image_id'],
            'img_url'       => $row['image_url'],
            'avg_rating'    => (float)$row['avg_rating'],
            'total_ratings' => (int)$row['total_ratings']
        );
    }
}

// Output the data
echo json_encode($locations);

// Close the connection
$conn->close();
?>
