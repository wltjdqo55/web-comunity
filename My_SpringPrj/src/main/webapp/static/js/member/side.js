
function form_button(){
	const userId = document.querySelector("#userId").value;
	const userPassword = document.querySelector("#userPassword").value;
	
	$.ajax({
        url: "login",
        type: "POST",
        data: { "userId": userId,
        		"userPassword": userPassword 
        },
        dataType: "text",
        success: function(result) {
        	if(result=="0"){
        		document.querySelector(".modalPage").style.display = "none";
        		location.reload();
        	}else{
        		document.querySelector(".modalPage").style.display = "block";
				document.querySelector(".present").style.border = "1px solid red";
				document.querySelector(".border-boxbox_withdrawal").style.height = "200px";
				document.querySelector("#border-boxbox_withdrawal_p").style.display = "block";
				document.querySelector("#border-boxbox_withdrawal_p").style.display = "flex";
				document.querySelector("#userId").focus();
        	}
        },
        error: function() {
        	alert("서버요청에러")
        }
    });

}
var modalPage = document.querySelector(".modalPage");
	var showModel = document.querySelector("#showModel");
	
	showModel.addEventListener("click", function(){
		   modalPage.style.display = "block";
	});

	function hideModal() {
		document.querySelector(".modalPage").style.display = "none";
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