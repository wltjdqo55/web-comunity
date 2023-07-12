	const userPhoneNumber = document.querySelector("#userPhoneNumber");
		const userBirth = document.querySelector("#userBirth");
		const userName = document.querySelector("#userName");
		const userEmail = document.querySelector("#userEmail");
		
		
		const modify_btn = document.querySelector("#modify_btn");
		const first_form = document.querySelector("#first_form");
		
		modify_btn.addEventListener("click", function(event){
			event.preventDefault();
			if(userName.value === ""){
				alert("이름을 입력하세요.");
				userName.focus();
				return;
			}else if(userBirth.value ===""){
				alert("생년월일을 입력하세요.");
				userBirth.focus();
				return;
			}else if (!(userBirth.value.match(/^[0-9]+$/)) || userBirth.value.length != 8) {
			  alert("생년월일은 8자리의 숫자만 입력하세요. ex) 19960415");
			  userBirth.focus();
			  return;
			}else if(userEmail.value === ""){
				alert("이메일을 입력하세요.");
				userEmail.focus();
				return;
			}
			else if(userPhoneNumber.value === ""){
				alert("휴대폰번호를 입력하세요.");
				userPhoneNumber.focus();
				return;
			}else{
				first_form.submit();
				
			}
		});
		/*
		
		*/