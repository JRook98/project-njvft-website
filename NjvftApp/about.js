// Open About modal
function openAboutModal() {
	const modal = document.getElementById("about-modal");
	modal.style.display = "block";    
		
  	const htmlContent = `<h2 style="text-align: left;">Welcome to NJVFT</h2><br>
	<p>Welcome to New Jersey Virtual Field Trip! <br><br>

	This application allows you to explore various landmarks across the state of New Jersey virtually, including beaches, museums, and historic villages. <br><br>

	<h2 style="text-align: left;">Features</h2><br>

	1. Select a landmark on the map to learn more about it! <br><br>

  	2. Rate each location with a star rating from 1 to 5! <br><br>

  	3. Generate driving directions from your current location to a chosen landmark!
  	</p>`;
		
    document.getElementById("aboutModalContent").innerHTML = htmlContent;
	}

//Close About modal
function closeAboutModal() {
	const aboutModal = document.getElementById("about-modal");
	aboutModal.style.display = "none";
}
