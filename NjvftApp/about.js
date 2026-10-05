// Open About modal
function openAboutModal() {
	const modal = document.getElementById("about-modal");
	modal.style.display = "block";    
		
  	const htmlContent = `<h2 style="text-align: left;">Welcome to NJVFT</h2>
	<p>Welcome to New Jersey Virtual Field Trip! <br><br>

	This application allows you to explore various landmarks across the state of New Jersey virtually, including beaches, museums, and historic villages. <br><br>

	<h2 style="text-align: left;">Features</h2>

	1. Select a landmark on the map to learn more about it! <br><br>

  	2. Filter to your preferred landmark type with the dropdown menu! <br><br>

  	3. Generate driving directions from landmark to landmark by selecting the "Get Route" button!
  	</p>`;
		
    document.getElementById("aboutModalContent").innerHTML = htmlContent;
	}

//Close About modal
function closeAboutModal() {
	const aboutModal = document.getElementById("about-modal");
	aboutModal.style.display = "none";
}
