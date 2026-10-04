<script>
  
	// open About modal
	function openAboutModal() {
		var modal = document.getElementById("aboutModal");
		modal.style.display = "block";    
		
    var htmlContent = `<h2 style="text-align: center;">Welcome to NJVFT</h2>
		<p>Welcome to New Jersey Virtual Field Trip! This application allows you to explore various landmarks across the state of New Jersey virtually, including beaches, museums, and historic villages. You can also generate driving directions from landmark to landmark.</p>`;
		
    document.getElementById("aboutModalContent").innerHTML = htmlContent;
	}

	//close About modal
	function closeAboutModal() {
		var modal = document.getElementById("aboutModal");
		modal.style.display = "none";
	}

</script>
