let directionsRendererInstance = null;

let routeInfoBoxInstance = null;

// Function calculateAndDisplayRoute() handles displaying route from current device location to selected landmark, along with time and distance information.
function calculateAndDisplayRoute(place, mapObject) {

    // Check if the user location was saved successfully
    if (!window.userPosition) {
        alert("Unable to calculate route: Please enable your device's location to use driving directions.");
        return;
    }

    // Remove any existing floating travel info panel from previous routes
    if (routeInfoBoxInstance && mapObject.controls[google.maps.ControlPosition.TOP_RIGHT].getLength() > 0) {
        mapObject.controls[google.maps.ControlPosition.TOP_RIGHT].clear();
    }

    // Initialize or re-use the Google Directions Renderer
    if (!directionsRendererInstance) {
        directionsRendererInstance = new google.maps.DirectionsRenderer({
            suppressMarkers: true,
            polylineOptions: {
                strokeColor: "#0000FF", // Forces a classic blue route line
                strokeWeight: 6,
                strokeOpacity: 0.7
            }
        });
    }
    
    directionsRendererInstance.setMap(mapObject);

    const directionsService = new google.maps.DirectionsService();

    // Configure the routing request parameters
    const request = {
        origin: new google.maps.LatLng(window.userPosition.lat, window.userPosition.lng),
        destination: new google.maps.LatLng(place.lat, place.lng),
        travelMode: google.maps.TravelMode.DRIVING // Calculates driving path
    };

    // Query the Google Maps Routing API
    directionsService.route(request, function (result, status) {
        if (status === google.maps.DirectionsStatus.OK) {
            // Draws the blue path line
            directionsRendererInstance.setDirections(result);

            // Real-time duration and distance text
            const routeLeg = result.routes[0].legs[0];
            const travelDuration = routeLeg.duration.text; // e.g., "45 mins"
            const travelDistance = routeLeg.distance.text; // e.g., "28.4 mi"

            // Create a styled floating UI container box directly on the map surface
            const infoBox = document.createElement("div");
            infoBox.className = "route-info-box"; 
            
            // Set dynamic markup text contents
            infoBox.innerHTML = `
                <div style="color: #0000FF; font-size: 16px; margin-bottom: 4px;">Driving Directions</div>
                <div>🕒 Time: <span style="font-weight: normal; color: #555;">${travelDuration}</span></div>
                <div>📍 Distance: <span style="font-weight: normal; color: #555;">${travelDistance}</span></div>
            `;

            // Add clear button to route
            const clearRouteBtn = document.createElement("button");
            clearRouteBtn.textContent = "Clear Route";
            clearRouteBtn.className = "route-clear-btn";

            clearRouteBtn.addEventListener("click", function() {
                clearActiveRoute(mapObject);
            });

            infoBox.appendChild(clearRouteBtn);
            
            // Save instance handle reference globally
            routeInfoBoxInstance = infoBox;

            // Push infoBox to the top center of the Google Map
            mapObject.controls[google.maps.ControlPosition.TOP_RIGHT].push(infoBox);

        } else {
            alert("Could not display driving directions for this route layout.");
        }
    });
}

// Function clearActiveRoute() removes the blue route line and infobox when user selects a new landmark type
function clearActiveRoute(mapObject) {
    if (directionsRendererInstance) {
        directionsRendererInstance.setMap(null);
        directionsRendererInstance = null;
    }

    if (mapObject && mapObject.controls && mapObject.controls[google.maps.ControlPosition.TOP_RIGHT]) {
        if (mapObject.controls[google.maps.ControlPosition.TOP_RIGHT].getLength() > 0) {
            mapObject.controls[google.maps.ControlPosition.TOP_RIGHT].clear();
        }
        routeInfoBoxInstance = null;
    }
}
