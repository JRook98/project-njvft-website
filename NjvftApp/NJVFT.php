<!-- CS10430 Project -->

<!-- Star rating font from fontawesome.com -->
<script src="https://use.fontawesome.com/aa97a80a47.js"></script>

<!-- Header -->
<?php require 'includes/header.php';?>

    <!-- Main Layout Wrapper -->
    <div class="content-layout">
        <!-- Left Column with Dropdown Menu -->
        <div class="left-column">
            <label for="location-select" style="display: block; margin-bottom: 8px; font-weight: bold; text-align: center">NJ Landmark Options</label>
            <select id="location-select">
                <option value="all">All Landmarks</option>
                <option value="beaches">Beaches</option>
                <option value="museums">Museums</option>
                <option value="historic-villages">Historic Villages</option>
            </select>
            
            <!-- Route button Label -->
            <label for="route-btn" style="display: block; margin-top: 125px; margin-bottom: 8px; font-weight: bold; text-align: center">Click the Button Below for Driving Directions</label>
            <button id="route-btn">Get Route</button>            
        </div>

        <!-- Map rendering container -->
        <div id="map-container">
            <div id="map"></div>
        </div>
    </div>

 <!-- About Modal -->
    <div id="about-modal" class="modal">
        <div class="about-modal-container">
            <div class="about-modal-content">
                <span class="close-about-btn" onclick="closeAboutModal()">&times;</span>
                <div id="aboutModalContent"></div>
                <button class="modal-footer-btn" onclick="closeAboutModal()">Close</button>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>

<!-- Route Modal -->
<div id="route-modal" class="route-modal">

    <div id="route-modal-container">
        <!-- RouteInfo.html will be loaded here -->
    </div>
</div>

<!-- Info Modal -->
<div id="info-modal" class="info-modal">

    <div id="info-modal-container">
        <!-- LandmarkInfo.html will be loaded here -->
    </div>

</div>

<!-- Footer -->
<?php require 'includes/footer.php';?>

<!-- Loads javascript file for the About modal -->
<script src="about.js"></script>

<!-- Loads javascript file for the Info modal -->
<script src="info.js"></script>

<!-- Loads javascript file for the Route modal -->
<script src="route.js"></script>

<!-- Loads javascript file that initializes the google map, sets the bounds of the google map, and places landmark markers from the database-->
<script src="init_map.js"></script>

<!-- Loads Google Maps API and calls the initMap() function in the "init_map.js" file -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-Ep4rBtq2tecPJgVqHYS9vt6vKwFLFuE&callback=initMap" async defer> </script>

</body>
</html>
