<!-- CS10430 Project -->

<!-- Star rating font from fontawesome.com -->
<script src="https://use.fontawesome.com/aa97a80a47.js"></script>

<!-- Header -->
<?php require 'includes/header.php';?>

    <!-- Main Layout Wrapper -->
    <div class="content-layout">  
        
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
