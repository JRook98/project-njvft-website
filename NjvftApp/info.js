// Loading database information when clicking a google maps marker functionality
function attachModalToMarker(markerObject, mapObject, place) {

    const infoModal = document.getElementById("info-modal");
    const infoModalContainer = document.getElementById("info-modal-container");

    if (!infoModal || !infoModalContainer) return;

    // When a map pin marker object is clicked
    markerObject.addListener("click", function () {
        
        // Zoom in on the map to the marker's location
        mapObject.setZoom(15);
        mapObject.setCenter(markerObject.getPosition());

        // Load LandmarkInfo.html
        fetch("LandmarkInfo.html")

            .then(response => {

                if (!response.ok) {
                    throw new Error("Unable to load LandmarkInfo.html");
                }

                return response.text();
            })

            .then(html => {

                // Push database values inside the LandmarkInfo.html template
                let renderedHtml = html

                    .replace("{{NAME}}", place.name || "NJ Landmark")
                    .replace("{{DESCRIPTION}}", place.description || "No description provided.")
                    .replace("{{FUN_FACT}}", place.fact || "No fun facts provided.")
                    .replace("{{IMAGE}}", place.img_url || "/NjvftApp/images/NJVFT_logo.png")
                    .replace("{{URL}}", place.web_url || "https://rowan.edu");

                // Put LandmarkInfo.html inside the modal
                infoModalContainer.innerHTML = renderedHtml;

                // Display Average Star Rating
                setupStarRatingSystem(place);

                // Show the modal
                infoModal.style.display = "flex";

                // Grab the close button from LandmarkInfo.html
                const closeButton = document.getElementById("close-info-btn");

                // Close modal when X is clicked
                closeButton.addEventListener("click", function () {

                    infoModal.style.display = "none";

                });
            })

            .catch(error => {

                console.error("Error setting up Info Modal data workflows:", error);

            });

    });

    // Close modal when clicking outside of the modal box
    infoModal.addEventListener("click", function (event) {

        if (event.target === infoModal) {

            infoModal.style.display = "none";

        }
    });
}



/* Function setupStarRatingSystem generates, renders, and validates processing for star elements */
function setupStarRatingSystem(place) {

    // Layout for the 5 stars and submit button 
    var myRating = `
        <div id="stars-row">
            <span id="star1" class="fa fa-star" style="color:blue; margin-right: 5px;"></span>
            <span id="star2" class="fa fa-star" style="color:blue; margin-right: 5px;"></span>
            <span id="star3" class="fa fa-star" style="color:blue; margin-right: 5px;"></span>
            <span id="star4" class="fa fa-star" style="color:blue; margin-right: 5px;"></span>
            <span id="star5" class="fa fa-star" style="color:blue; margin-right: 5px;"></span>
        </div>
        <div class="submit-container" style="margin-top: 15px;">
            <button id="submitBtn" style="padding: 12px 24px; font-size: 16px; font-weight: bold; background-color: green; color: white; border: none; border-radius: 4px; cursor: pointer;">Submit</button>
        </div>
    `;

    // Insert elements into the DOM
    const ratingRoot = document.getElementById("star-rating-root");
    if (!ratingRoot) return;
    ratingRoot.innerHTML = myRating;

    // State variable tracking the active selection
    let selectedRating = 0;

    // Updates star UI colors
    function updateStarsUI(ratingValue) {
        for (let i = 1; i <= 5; i++) {
            const starNode = document.getElementById("star" + i);
            if (starNode) {
                starNode.style.color = i <= ratingValue ? "gold" : "blue";
            }
        }
    }

    // Dynamically add event listeners to each star
    for (let i = 1; i <= 5; i++) {
        const starNode = document.getElementById("star" + i);
        if (starNode) {
            starNode.addEventListener("click", function() {
                selectedRating = i; // Save the selected star count
                updateStarsUI(selectedRating);
            });
        }
    }

    const submitBtn = document.getElementById("submitBtn");
    const messageNode = document.getElementById("star-rating-message");

    // When user clicks submit button
    if (submitBtn) {
        submitBtn.addEventListener("click", function() {

            // If user hasn't selected a valid star rating
            if (selectedRating === 0) {

                // Unsuccessful message
                if (messageNode) {
                    messageNode.style.color = "red";
                    messageNode.innerText = "Please select a star rating before submitting!";
                }
                return;
            }

            // Successful message
            if (messageNode) {
                messageNode.style.color = "green";
                messageNode.innerText = `Thank you! You rated ${place.name || 'this landmark'} ${selectedRating} out of 5 stars.`;
            }
        });
    }
}
