<!-- CS10430 Project -->

<!-- Star rating font from fontawesome.com -->
<script src="https://use.fontawesome.com/aa97a80a47.js"></script>

<!-- Header -->
<?php require 'includes/header.php';?>

<!-- Body -->
<?php require 'includes/body.php';?>

<!-- Footer -->
<?php require 'includes/footer.php';?>

<!-- Loads javascript file for the About modal -->
<script src="about.js"></script>

<!-- Loads javascript file for the Info modal -->
<script src="info.js"></script>

<!-- Loads javascript file for the routing functionality -->
<script src="route.js"></script>

<!-- Loads javascript file that initializes the google map, sets the bounds of the google map, and places landmark markers from the database-->
<script src="init_map.js"></script>

<!-- Fetches Google Maps API Key securely from config.php -->
<?php include 'includes/config.php'; ?>

<!-- Loads Google Maps API and calls the initMap() function in the "init_map.js" file -->
<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo htmlspecialchars(GOOGLE_MAPS_API_KEY, ENT_QUOTES, 'UTF-8'); ?>&callback=initMap" async defer></script>

</body>
</html>
