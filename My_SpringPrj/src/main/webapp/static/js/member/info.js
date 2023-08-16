const userName = document.querySelector("#userName");
		const userEmail = document.querySelector("#userEmail");
		const userPhoneNumber = document.querySelector("#userPhoneNumber");
		const modify_btn = document.querySelector("#modify_btn");
		modify_btn.addEventListener("click", function(){
			 event.preventDefault();
			 if(userName.value === "" || userEmail.value === "" || userPhoneNumber === ""){
				 alert("내용을 모두 입력해주세요.");
				 return;
			 }else{
				 alert("개인정보가 수정되었습니다.");
				 const first_form = document.querySelector("#first_form");
				 first_form.submit();
			 }
		});
		const userPassword = document.querySelector("#userPassword");
		const userPasswordOK = document.querySelector("#userPasswordOK");
		const password_btn = document.querySelector("#password_btn");
		const second_form = document.querySelector("#second_form");
		password_btn.addEventListener("click", function(){
			event.preventDefault();
			if(userPassword.value===""){
				alert("새 비밀번호를 입력하세요.");
				userPassword.focus();
				return;
			}else if(userPassword.value.length < 8){
				alert("비밀번호는 8자리 이상 입력해주세요");
				userPassword.focus();
				return;
			}else if(userPasswordOK.value ===""){
				alert("새 비밀번호 확인을 입력하세요.");
				userPasswordOK.focus();
				return;
			}else if(userPasswordOK.value.length<8){
				alert("비밀번호는 8자리 이상 입력해주세요");
				userPasswordOK.focus();
				return;
			}else if(userPassword.value != userPasswordOK.value){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				userPassword.focus();
				return;
			}else{
				alert("비밀번호 변경이 완료되었습니다.")	;		
				second_form.submit();
			}
		});
		
		
		
	
		const reset_btn = document.querySelector("#reset_btn");
		reset_btn.addEventListener("click", function(){
			window.close();
		});
		const reset_btn1 = document.querySelector("#reset_btn1");
		reset_btn1.addEventListener("click", function(){
			window.close();
		});
	
		const menu1 = document.querySelector("#menu1");
		const menu2 = document.querySelector("#menu2");
		const menu3 = document.querySelector("#menu3");
		const menubutton1 = document.querySelector("#menubutton1");
		const menu1button2 = document.querySelector("#menubutton2");
		const menu1button3 = document.querySelector("#menubutton3");
		const span1 = document.querySelector("#span1");
		const span2 = document.querySelector("#span2");
		const span3 = document.querySelector("#span3");
		
		menubutton1.addEventListener("click", function(){
			menu1.style.display = "block";
			menu2.style.display = "none";
			menu3.style.display = "none";
			span1.style.backgroundColor = "white";
			span2.style.backgroundColor = "#dedcdc";
			span3.style.backgroundColor = "#dedcdc";
		});
		menubutton2.addEventListener("click", function(){
			menu1.style.display = "none";
			menu2.style.display = "block";
			menu3.style.display = "none";
			span1.style.backgroundColor = "#dedcdc";
			span2.style.backgroundColor = "white";
			span3.style.backgroundColor = "#dedcdc";
			
		});
		menubutton3.addEventListener("click", function(){
			menu1.style.display = "none";
			menu2.style.display = "none";
			menu3.style.display = "block";
			span1.style.backgroundColor = "#dedcdc";
			span2.style.backgroundColor = "#dedcdc";
			span3.style.backgroundColor = "white";
		});
		
		
		const Withdrawal_btn = document.querySelector("#Withdrawal_button");
	  	const myform = document.querySelector("#myform");
	  	Withdrawal_btn.addEventListener("click", function(event) {
		  event.preventDefault();
		  const result = confirm("정말 탈퇴하시겠습니까?");
		  if (result) {
			  	alert("회원탈퇴가 완료되었습니다.");
			  	myform.submit();
			  	
		  } else {
		    // 취소
		  }
		});
	  	var message = '${msg}'; 
	  	if(message=="메시지"){
	  		window.close();
	  	}
	  	
	