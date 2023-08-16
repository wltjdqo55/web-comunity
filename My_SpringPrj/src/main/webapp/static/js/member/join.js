	 const userName = document.querySelector("#userName");
     var userID = document.querySelector("#userID");
     var userNickname = document.querySelector("#userNickname");
     const userPassword = document.querySelector("#userPassword");
     const userPasswordOK = document.querySelector("#userPasswordOK");
     const userEmail = document.querySelector("#userEmail");
     const first_userPhone = document.querySelector("#first_userPhone");
     const second_userPhone = document.querySelector("#second_userPhone");
     const last_userPhone = document.querySelector("#last_userPhone");
     const userBirth = document.querySelector("#userBirth");
     var myForm = document.querySelector("#myForm");
     var userID_button = document.querySelector("#userID_button");
     var join_sub = document.querySelector("#join_sub");
	 var userNickname_btn = document.querySelector(".userNickname_btn");
     userID_button.checked = false;
     userNickname_button.checked = false;
     
     
     
     
      $("#userID_button").on('click', function(event){
    	 event.preventDefault();
    	var id = $('#userID').val();
    	$.ajax({
    		url : "idCheck",
    		type : "post",
    		data : {"userId": id},
    		dataType: 'text',
    		success: function(result){
    			if(result == 0){
    				alert("사용 할 수 없는 아이디입니다.");
    				userID_button.checked = true;
    				document.querySelector("#userID").style.border = "1px solid red";
    			}else{
    				alert("사용 가능한 아이디입니다.");
    				userID_button.checked = true;
    				document.querySelector("#userID").style.border = "none";
    			}
    		},
    		error:function(){
    			alert("서버요청실패");
    		}
    		
    	});
		var myForm = document.querySelector("#myForm");
    	myForm.addEventListener("submit", (event) => {
    	  event.preventDefault(true);
    	});
    });
   
  
   	
      $(".userNickname_btn").on('click', function(event){
		  event.preventDefault();
    	 var NickName = $('#userNickname').val();
    	$.ajax({
    		url : "NickNameChk",
    		type : "post",
    		data : {"userNickName": NickName},
    		dataType: 'text',
    		
    		success: function(result){
    			if(result == 0){
    				alert("사용 할 수 없는 닉네임입니다.");
    				userNickname_button.checked = true;
    				document.querySelector("#userNickname").style.border = "1px solid red";
    			}else if(result == 1){
    				alert("사용 가능한 닉네임입니다.");
    				userNickname_button.checked = true;
    				document.querySelector("#userNickname").style.border = "none";
    			}
    		},
    		error:function(){
    			alert("서버요청실패");
    		}
    		});
    	 	var myForm = document.querySelector("#myForm");
    	myForm.addEventListener("submit", (event) => {
    	  event.preventDefault(true);
    	});
    		
    	});
 
     
   
     join_sub.addEventListener("click", function(event){
    	  event.preventDefault();
		if(userName.value === ""){
			alert("이름을 입력하세요.");
			userName.focus();
			return;
		}else if(userID.value === ""){
			alert("아이디를 입력하세요.");
			userID.focus();
			return;
		}else if(userNickname.value === ""){
			alert("닉네임을 입력하세요.");
			userNickname.focus();
			return;
		}else if(userPassword.value === "") {
   	        alert("현재 비밀번호를 입력하세요.");
   	        userPassword.focus();
   	        return;
   	    }else if(userPasswordOK.value===""){
   	    	alert("비밀번호 확인을 입력하세요.");
   	    	userPasswordOK.focus();
   	    	return;
   	    }else if(userPassword.value.length<8){
   	    	alert("비밀번호는 8자리 이상 입력하세요.");
   	    	userPassword.focus();
   	    	return;
   	    }else if(userPasswordOK.value.length<8){
   	    	alert("비밀번호확인은 8자리 이상 입력하세요.");
   	    	userPasswordOK.focus();
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
		}else if(first_userPhone.value === ""){
			alert("휴대폰번호를 입력하세요.");
			first_userPhone.focus();
			return;
		}else if(second_userPhone.value === ""){
			alert("휴대폰번호를 입력하세요.");
			second_userPhone.focus();
			return;
		}else if(last_userPhone.value === ""){
			alert("휴대폰번호를 입력하세요.");
			last_userPhone.focus();
			return;
		}else if(userPassword.value !== userPasswordOK.value){
   	    	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
   	    	userPassword.focus();
   	    	return;
		}else{
			if(userID_button.checked == false){
				alert("아이디를 중복체크하지 않았습니다.");
				return;
			}else if(userNickname_button.checked == false){
				alert("닉네임을 중복체크하지 않았습니다.");
				return;
			}else{
				myForm.submit();
				alert("회원가입이 완료되었습니다.");
				
			}
	    	
		}
});
