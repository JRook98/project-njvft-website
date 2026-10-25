<!-- Scrolling images below header -->
<div class="scroll-container">
  <div class="scroll-track" id="scrollingBar">
    <?php 
    include 'get_images.php'; 
    
    // Variable to define placeholder logo
    $defaultPlaceholder = '/NjvftApp/images/NJVFT_logo.png';

    if (!empty($images) && is_array($images)): 
        foreach ($images as $img): 
            $imagePath = !empty($img['img_url']) ? htmlspecialchars($img['img_url'], ENT_QUOTES, 'UTF-8') : $defaultPlaceholder;
            $altText = "Landmark Image ID " . htmlspecialchars($img['image_id'], ENT_QUOTES, 'UTF-8');
            ?>
            
            <!-- If the image URL breaks, swap it with placeholder image -->
            <img src="<?php echo $imagePath; ?>" 
                 alt="<?php echo $altText; ?>" 
                 onerror="this.onerror=null; this.src='<?php echo $defaultPlaceholder; ?>';" >
        <?php 
        endforeach; 
    else: 
    ?>
        <p style="color: #5e5e5e; padding: 15px; width: 100%; text-align: center; font-family: Arial, sans-serif;">No images loaded.</p>
    <?php endif; ?>
  </div>
</div>

<script>

// Dynamically duplicates database images in scrolling loop
document.addEventListener("DOMContentLoaded", function() {
    const track = document.getElementById('scrollingBar');
    if (track && track.children.length > 0) {
        const originalImages = Array.from(track.children);
        
        const singleSetWidth = originalImages.length * 125; 
        const viewportWidth = window.innerWidth;
        
        const targetWidth = Math.max(viewportWidth * 2, singleSetWidth * 2);
        let currentWidth = singleSetWidth;
        
        while (currentWidth < targetWidth) {
            originalImages.forEach(img => {
                const clone = img.cloneNode(true);
                track.appendChild(clone);
            });
            currentWidth += singleSetWidth;

        const speedPixelsPerSecond = 15; /* Note: to increase or decrease the speed, adjust the number in '50s' */
        
        const optimalDuration = (currentWidth / 2) / speedPixelsPerSecond;
        
        track.style.animationDuration = optimalDuration + 's';
        }
    }
});
</script>

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
