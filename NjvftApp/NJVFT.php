<!-- CS10430 Project -->

<!-- Header -->
<?php require 'includes/header.php';?>

    <!-- Main Layout Wrapper -->
    <div class="content-layout">
        <!-- Left Column with Dropdown Menu -->
        <div class="left-column">
            <label for="location-select" style="display: block; margin-bottom: 8px; font-weight: bold; text-align: center">NJ Landmark Options</label>
            <select id="location-select">
                <option value="">Select a Landmark</option>
                <option value="beaches">Beaches</option>
                <option value="museums">Museums</option>
                <option value="historic-villages">Historic Villages</option>
            </select>
            
            <!-- Route button Label -->
            <label for="route-btn" style="display: block; margin-top: 125px; margin-bottom: 8px; font-weight: bold; text-align: center">Click the Button Below for Driving Directions</label>
            <button id="route-btn">Get Route</button>
            
            <!-- Star Rating Label -->
            <label for="rating-system" style="display: block; margin-top: 40px; margin-bottom: 8px; font-weight: bold; text-align: center">Star Rating</label>
        </div>

        <!-- Map rendering container -->
        <div id="map-container">
            <div id="map"></div>
        </div>
    </div>

<!-- Footer -->
<?php require 'includes/footer.php';?>

<!-- Loads javascript file that initializes the google map, sets the bounds of the google map, and places landmark markers from the database-->
<script src="init_map.js"></script>

<!-- Loads Google Maps API and calls the initMap() function in the "init_map.js" file -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-Ep4rBtq2tecPJgVqHYS9vt6vKwFLFuE&callback=initMap" async defer> </script>

</body>
</html>