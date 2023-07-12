		document.querySelector("#Withdrawal_button").addEventListener("click", function(event) {
			event.preventDefault();
		  const result = confirm("정말 탈퇴하시겠습니까?");
		  if (result) {
			  	alert("회원탈퇴가 완료되었습니다.");
			  	const myform = document.querySelector("#myform");
			  	myform.submit();
			  	window.close();
		  } else {
		    // 취소
		  }
		});