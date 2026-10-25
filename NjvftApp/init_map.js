/* Function initMap() initializes the google map, centers the map onto New Jersey with bound restrictions,
	sets a marker at the users current location if applicable, and allows users to place a new marker wherever they click on the map. */
function initMap() {

      // Const variable to set the coordinates for the center of the map
  const MAP_CENTER = { lat: 40.1147, lng: -74.7707 };

      // Const variable to set the bounds for scrolling on the Google map
  const MAP_BOUNDS = {
  		north: 41.46,  // Top edge
  		south: 38.72,  // Bottom edge
  		west: -75.66,  // Left edge
 		east: -73.89,  // Right edge
 	};

      // Fetches document element with id: "map" to create a new google map, "mapObject", with bounds and restrictions
 	const mapObject = new google.maps.Map(document.getElementById("map"), {
 		zoom: 7,
 		maxZoom: 11,
 		center: MAP_CENTER,
 		restriction: {latLngBounds: MAP_BOUNDS, strictBounds: false}
 	});

 	  // Call loadDatabaseMarkers() function to place markers on the google map using landmark data from the MySQL database
 	loadDatabaseMarkers(mapObject);

    // Set variable of currentMarker to null
 	let currentMarker = null;

 	// If user's device location is on...
 	if (navigator.geolocation) {

 	    // Find the latitude/longitude coordinates of the user...
 		navigator.geolocation.getCurrentPosition((position) => {
 			const userPos = {
 				lat: position.coords.latitude,
 				lng: position.coords.longitude
 			};

            // Save user position globally for routing functionality
            window.userPosition = userPos;

            // Delay drop animation for user marker to give database markers time to fall first
            setTimeout(() => {
                
                // Place a marker at the user's device location
                currentMarker = new google.maps.Marker({
                    position: userPos,
                    map: mapObject,
                    title: 'Your Location',
                    animation: google.maps.Animation.DROP,
                    icon: {
                        url: '/NjvftApp/images/NJVFT_marker_user.png',
                        scaledSize: new google.maps.Size(30, 45)
                    }  
            });
            }, 600);
        },
        );
 	} 

 }

 /* Function loadDatabaseMarkers() initializes the database, grabs the category id, name, longitude, and latitude of landmarks, 
 	and displays them on the Google Map */
 function loadDatabaseMarkers(map) {

    // Fetch markers using get_markers.php
   const apiEndpoint = 'get_markers.php'; 

    // Associates category_id with marker image
   const CATEGORY_ICONS = {
    '1': '/NjvftApp/images/NJVFT_marker_museum.png',
    '2': '/NjvftApp/images/NJVFT_marker_beach.png',
    '3': '/NjvftApp/images/NJVFT_marker_village.png'
}

    // If a landmark's category id is not 1, 2, or 3, use a default marker
    const defaultIcon = '/NjvftApp/images/NJVFT_marker_user.png';

    fetch(apiEndpoint)


    // Check if there is a response
    .then(response => {
     if (!response.ok) {
         throw new Error('Network response was not ok');
    }
    return response.json();
    })

    // Loop through data and create markers
    .then(places => {

        // Set a global array databaseMarkers to grab each marker's category id for filtering
        databaseMarkers = [];

        places.forEach((place, i) => {

            const markerIcon = CATEGORY_ICONS[String(place.category)] || defaultIcon; // Grab the correct marker image for the landmark

            // Define your sizing objects
            const normalIcon = {
                url: markerIcon,
                scaledSize: new google.maps.Size(30, 45),
                anchor: new google.maps.Point(15, 45) // Centers horizontally, anchors bottom edge
            };

            const largeIcon = {
                url: markerIcon,
                scaledSize: new google.maps.Size(36, 54), // 1.2x larger size
                anchor: new google.maps.Point(18, 54)    // Adjusted center (36/2) and bottom edge anchor
            };

            const marker = new google.maps.Marker({
                position: { lat: place.lat, lng: place.lng },
                map: map,
                title: place.name, // Shows location name on hover
                gmpClickable: true,
                icon: normalIcon,  
                animation: google.maps.Animation.DROP
            });

            marker.category_id = String(place.category);
            attachModalToMarker(marker, map, place);
            databaseMarkers.push(marker);

            // When user hovers over icon...
            marker.addListener("mouseover", () => {

                // Enlarge the icon
                marker.setIcon(largeIcon);

                // Overlap over other markers if needed
                marker.setZIndex(1000);

                // Play a single bounce animation
                marker.setAnimation(google.maps.Animation.BOUNCE);

                setTimeout(() => {
                    if (marker.getZIndex() === 1000) {
                        marker.setAnimation(null);
                    }
                }, 400);

            });

            // When user is no longer hovering over icon...
            marker.addListener("mouseout", () => {

                // Return icon size back to normal
                marker.setIcon(normalIcon);
                marker.setZIndex(null);
                marker.setAnimation(null);
            });

        });

        // selectMenu variable touches dropdown filter element
        const selectMenu = document.getElementById("location-select");


        const valueMap = {
            "museums": "1",
            "beaches": "2",
            "historic-villages": "3"
        }; 

        // When user selects a different dropdown option...
        selectMenu.addEventListener("change", (e) => {

            // Clear any route lines and infoboxes if they exist
            clearActiveRoute(map);

            // Grab the value the user selected
            const selectedValue = e.target.value;

            // Store it into a variable targetedCategoryId
            const targetedCategoryId = valueMap[selectedValue];

            // Loop through the loaded markers to toggle visibility based on the current value of targetedCategoryId
            databaseMarkers.forEach(marker => {
                if (selectedValue === "all" || marker.category_id === targetedCategoryId) {
                    marker.setMap(null);
                    marker.setMap(map);
                    marker.setAnimation(google.maps.Animation.DROP);
                } 
                else {
                    marker.setMap(null); // Hide non-matching markers
                }
            });
        });
    })
    .catch(error => console.error('Error loading database markers:', error));
}
