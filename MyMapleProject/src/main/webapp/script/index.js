
var modalPage = document.querySelector(".modalPage");
	var showModel = document.querySelector("#showModel");
	
	showModel.addEventListener("click", function(){
		   modalPage.style.display = "block";
	});

	function hideModal() {
		document.querySelector(".modalPage").style.display = "none";
	}
