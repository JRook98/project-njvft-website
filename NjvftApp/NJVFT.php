<!-- CS10430 Project -->

<!-- Star rating font from fontawesome.com -->
<script src="https://use.fontawesome.com/aa97a80a47.js"></script>

<!-- Header -->
<?php require 'includes/header.php';?>

<!-- Scrolling images below header -->
    <div class="scroll-container">
      <div class="scroll-track">
        <!-- Original Set of Images -->
        <img src="Cape_May_Lighthouse_og.jpg" alt="Cape May">
        <img src="Cape_May_Lighthouse2.jpg" alt="Cape May 2">
        <img src="MansqnBeach1.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach2.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach3.jpeg" alt="Manasquan Beach">
        
        <!-- Duplicate Sets to create a seamless loop. -->
        <img src="Cape_May_Lighthouse_og.jpg" alt="Cape May">
        <img src="Cape_May_Lighthouse2.jpg" alt="Cape May 2">
        <img src="MansqnBeach1.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach2.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach3.jpeg" alt="Manasquan Beach">
        
        <img src="Cape_May_Lighthouse_og.jpg" alt="Cape May">
        <img src="Cape_May_Lighthouse2.jpg" alt="Cape May 2">
        <img src="MansqnBeach1.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach2.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach3.jpeg" alt="Manasquan Beach">
        
        <img src="Cape_May_Lighthouse_og.jpg" alt="Cape May">
        <img src="Cape_May_Lighthouse2.jpg" alt="Cape May 2">
        <img src="MansqnBeach1.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach2.jpeg" alt="Manasquan Beach">
        <img src="MansqnBeach3.jpeg" alt="Manasquan Beach">
      </div>
    </div>

    <!-- Main Layout Wrapper -->
    <div class="content-layout">  
        <div class="left-panel">
            <h2>Left panel</h2>
            <p>Insert links or other content here</p>
        </div>

    <!-- Right panel with map -->
    <div class="right-panel"> 
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
