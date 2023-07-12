const link = document.querySelector("#link");
link.addEventListener("click", function(){
	window.location.href = "#";
});
var modalPage = document.querySelector(".modalPage");
	var showModel = document.querySelector("#showModel");
	
	showModel.addEventListener("click", function(){
		   modalPage.style.display = "block";
	});

	function hideModal() {
		document.querySelector(".modalPage").style.display = "none";
	}
const error = '${pageContext.request.getAttribute("error")}';
		if(error == '아이디 또는 비밀번호가 올바르지 않습니다.'){
			document.querySelector(".modalPage").style.display = "block";
			document.querySelector(".present").style.border = "1px solid red";
			document.querySelector(".border-boxbox_withdrawal").style.height = "200px";
			document.querySelector("#border-boxbox_withdrawal_p").style.display = "block";
			document.querySelector("#border-boxbox_withdrawal_p").style.display = "flex";
			document.querySelector("#userId").focus();
			
		}
		const sugo = '${pageContext.request.getAttribute("sugo")}';
		if(sugo == '성공'){
			window.sessionStorage.clear();
			window.close();
		}
		const closeY = document.querySelector(".close");
		closeY.addEventListener("click", function(){
			document.querySelector(".border-boxbox_withdrawal").style.height = "";
			document.querySelector(".present").style.border = "#DDD";
			document.querySelector("#border-boxbox_withdrawal_p").style.display = "none";
		});
		
		const spanClose = document.querySelector("#spanClose");
		spanClose.addEventListener("click", function(){
			document.querySelector("#border-boxbox_withdrawal_p").style.display = "none";
			document.querySelector(".border-boxbox_withdrawal").style.height = "";
			document.querySelector(".present").style.border = "none";
			document.querySelector("#userId").focus();
		});