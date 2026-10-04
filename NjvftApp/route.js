const routeButton = document.getElementById("route-btn");

const routeModal = document.getElementById("route-modal");

const routeModalContainer = document.getElementById("route-modal-container");

// When the Get Route button is clicked
routeButton.addEventListener("click", function () {

    // Load RouteInfo.html
    fetch("RouteInfo.html")

        .then(response => {

            if (!response.ok) {
                throw new Error("Unable to load RouteInfo.html");
            }

            return response.text();
        })

        .then(html => {

            // Put RouteInfo.html inside the modal
            routeModalContainer.innerHTML = html;

            // Show the modal
            routeModal.style.display = "flex";

            // Grab the close button from RouteInfo.html
            const closeButton = document.getElementById("close-route-btn");

            // Close modal when X is clicked
            closeButton.addEventListener("click", function () {

                routeModal.style.display = "none";

            });

        })

        .catch(error => {

            console.error("Error loading Route modal:", error);

        });

});


// Close modal when clicking outside of the modal box
routeModal.addEventListener("click", function (event) {

    if (event.target === routeModal) {

        routeModal.style.display = "none";

    }

});
