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
                title: 'Your Location' // Shows location name on hover
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
 			map: mapObject
 		});
 	});

 }



 /* Function loadDatabaseMarkers() initializes the database, grabs the name, longitude, and latitude of landmarks, 
 	and displays them on the Google Map */
 	function loadDatabaseMarkers(map) {
    
    	// Fetch markers using get_markers.php
 		const apiEndpoint = 'get_markers.php'; 

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
 			places.forEach(place => {
 				new google.maps.Marker({
 					position: { lat: place.lat, lng: place.lng },
 					map: map,
                    title: place.name // Shows location name on hover
                });
 			});
 		})
 		.catch(error => console.error('Error loading database markers:', error));
 	}