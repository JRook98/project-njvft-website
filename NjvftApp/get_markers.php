<?php
// Initialize a database connection using database_connection.php
require 'includes/database_connection.php';

// Get the coordinates from the database
$sql = "SELECT 
             name, 
             latitude, 
             longitude 
        FROM landmarks";

$result = $conn->query($sql);

$locations = array();

if ($result->num_rows > 0) {
    // Loop through database rows and push into an array
    while($row = $result->fetch_assoc()) {
        $locations[] = array(
            'name' => $row['name'],
            'lat'  => (float)$row['latitude'],
            'lng'  => (float)$row['longitude']
        );
    }
}

// Output the data
echo json_encode($locations);

// Close the connection
$conn->close();
?>