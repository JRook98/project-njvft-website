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
 		zoom: 0,
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

        // Place a marker at the user's device location
 			currentMarker = new google.maps.Marker({
 				position: userPos,
 				map: mapObject,
                title: 'Your Location', // Shows location name on hover
                icon: {
                    url: '/NjvftApp/images/NJVFT_marker_user.png',
                    scaledSize: new google.maps.Size(30, 45)
            }  
 			});
 		},
 	);
 	} 

 	// When the google map is clicked...
 	mapObject.addListener("click", (event) => {

    // If there is currently a marker on the map (like user location), remove it
 		if (currentMarker) {
 			currentMarker.setMap(null);
 		}

    // Place a marker wherever the user clicked.
 		currentMarker = new google.maps.Marker({
 			position: event.latLng,
 			map: mapObject,
            icon: {
                url: '/NjvftApp/images/NJVFT_marker_user.png',
                scaledSize: new google.maps.Size(30, 45)
            }  
 		});
 	});

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

            // Place each marker on the google map
 			places.forEach(place => {
                const markerIcon = CATEGORY_ICONS[String(place.category)] || defaultIcon; // Grab the correct marker image for the landmark
 				const marker = new google.maps.Marker({
 					position: { lat: place.lat, lng: place.lng },
 					map: map,
                    title: place.name, // Shows location name on hover
                    gmpClickable: true,
                    icon: {
                     url: markerIcon, // Adds the marker image to the current marker
                     scaledSize: new google.maps.Size(30, 45)
                     }  
                });
 			
            // Save current marker's category_id to databaseMarkers array
            marker.category_id = String(place.category); 
            attachModalToMarker(marker, map, place);
            databaseMarkers.push(marker);
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

            // Grab the value the user selected
            const selectedValue = e.target.value;

            // Store it into a variable targetedCategoryId
            const targetedCategoryId = valueMap[selectedValue];

            // Loop through the loaded markers to toggle visibility based on the current value of targetedCategoryId
            databaseMarkers.forEach(marker => {
                if (selectedValue === "all" || marker.category_id === targetedCategoryId) {
                    marker.setMap(map); // Show all markers
                } else {
                    marker.setMap(null); // Hide non-matching markers
                }
            });
        });
    })
    .catch(error => console.error('Error loading database markers:', error));
}
