<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NJVFT</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

 <!-- Title of website as header -->
    <header>
        <img src="/NjvftApp/images/NJVFT_logo.png" alt="NJVFT_Logo">
        <div class="header-text">
            <h1>NJVFT</h1>
			<h3 id="changing-h3" class="fade-text">New Jersey Virtual Field Trip</h3>
        </div>
        
		<!-- About Button in header -->
        <nav class="header-nav">            
 			<button onclick="openAboutModal()">About</button> 

			<!-- Dropdown Menu in header -->	
			<div class="header-dropdown-menu">
				<label for="location-select">NJ Landmark Options</label>
				<select id="location-select">
					<option value="all">All Landmarks</option>
					<option value="beaches">Beaches</option>
					<option value="museums">Museums</option>
					<option value="historic-villages">Historic Villages</option>
				</select>
			</div>
        </nav>
    </header>

<script>
	// Define an array of h3 text phrases
    const phrases = [
        "New Jersey Virtual Field Trip",
        "Explore the landmarks of liberty and prosperity!",
        "There is lots to discover in this little state!"
    ];
    let currentIndex = 0;
    const h3Element = document.getElementById("changing-h3");

    window.addEventListener('DOMContentLoaded', () => {
        h3Element.classList.add("visible");
    });

    setTimeout(rotateText, 10000);

    // Function rotateText() fades and swaps between an array of h3 text
    function rotateText() {
        // Fade out h3 text
        h3Element.classList.remove("visible");

        // Wait for h3 text to fully disappear
        setTimeout(() => {
            currentIndex = (currentIndex + 1) % phrases.length;
            h3Element.textContent = phrases[currentIndex];
            
        	// Fade in new h3 text
            h3Element.classList.add("visible");
        }, 800);
    }

    // Current h3 text is visible for 10 seconds before swapping with new h3 text
    setTimeout(() => {
        setInterval(rotateText, 11500);
    }, 10000);
</script>

</body>
</html>
