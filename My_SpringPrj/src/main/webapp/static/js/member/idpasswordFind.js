
		const reset_btn = document.querySelector("#reset_btn");
		reset_btn.addEventListener("click", function(){
			window.close();
		});
	
		const menu1 = document.querySelector("#menu1");
		const menu2 = document.querySelector("#menu2");
		const menubutton1 = document.querySelector("#menubutton1");
		const menu1button2 = document.querySelector("#menubutton2");
		const span1 = document.querySelector("#span1");
		const span2 = document.querySelector("#span2");
		
		menubutton1.addEventListener("click", function(){
			menu1.style.display = "block";
			menu2.style.display = "none";
			span1.style.backgroundColor = "white";
			span2.style.backgroundColor = "#dedcdc";
		});
		menubutton2.addEventListener("click", function(){
			menu1.style.display = "none";
			menu2.style.display = "block";
			span1.style.backgroundColor = "#dedcdc";
			span2.style.backgroundColor = "white";
			
		});
	
	
	
		
		


		