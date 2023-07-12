<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{width:650px; height: 450px; border:1px solid gray; margin-left: 10px; margin-top:10px; }
	.container ul{display:flex; background-color: #cbcaca; margin : 3px; border-radius: 10px;}
	.container ul li{list-style-type : none; padding:10px; width: 210px; text-align: left;}
	.container ul li a{text-decoration: none; color: black;}
	.container ul li a span{background-color: #dedcdc; padding: 8px; border-radius : 5px;}
	
	#span1{background-color : white;}
	#menu2{display: none;}
	#menu3{display: none;}
	#menu1, #menu2, #menu3{margin: 20px;}
	
	.menu1_box{display: flex; font-size: 14px;}
	.menu1_imo{width: 30px;}
	.menu1_text{width:570px;}
	.menu1_div{margin-top: 15px; width: 600px; height: 320px;}
	.menu1_table{ width: 95%; height: 200px; margin: 10px; }
	.menu1_table td{border: 1px solid #DDD; border-radius : 10px;}
	.menu1_header{height: 30px;}
	.table_sub{margin-left: 15px;}
	.table_sub button{width:100px; height: 40px; background-color: #B0C4DE; color: white; border: none; border-radius: 3px; font-weight: bold; font-size: 15px; cursor: pointer;}
	.table_sub button:hover{background-color : #778899;}
	.userName, .userEmail, .userPhoneNumber{height: 90%; width:98%; font-size: 16px; border: none;}
	.label_first_id{width:180px}
	.label_second_id{font-size: 18px; }
	
	.menu2_box{display: flex; font-size: 14px;}
	.menu2_content_box{font-size: 13px; margin-top: 20px;}
	.menu2_table_div{margin-top: 20px;}
	.menu2_table{width: 95%; height: 100px; margin: 10px;}
	.menu2_table td{border: 1px solid #DDD; border-radius : 10px;}
	.userPassword, .userPasswordOK{height: 90%; width:98%; font-size: 16px; border: none;}
	
	.menu3_box{display: flex; font-size: 14px;}
	.menu3_content_p{font-size: 14px; line-height: 1.6; }
</style>
</head>
<body>
	<div class = "container">
		<ul>
			<li><a href="#" id = "menubutton1"><span id = "span1"><strong>회원정보수정</strong></span></a></li>
   		    <li><a href="#" id = "menubutton2" ><span id = "span2"><strong>비밀번호변경</strong></span></a></li>
   		    <li><a href="#" id = "menubutton3"><span id = "span3"><strong>회원탈퇴</strong></span></a></li>
		</ul>
		<div id = "menu1">
			<div class = "menu1_box">
				<div class = "menu1_imo">⚠</div>
				<div class = "menu1_text">인벤은 회원님의 개인정보를 암호화하여 안전하게 보호하고 있으며, 가입하신 정보는 회원님의 명백한 동의없이는 공개 또는 제3자에게 제공되지 않습니다. </div>
			</div>
			<div class = "menu1_div">
				<div class = "menu1_header">
					<span style="float:left"><strong>⭕ 회원정보수정</strong></span><span style = "float:right">⭐ 표시는 필수 입력사항</span>
				</div>
				<div class = "menu1_table_div">
				<form action = "modify.do" method = "post" id = "first_form">
				<table class = "menu1_table">
					<tr>
						<td class = "label_first_id"><label for = "userName">⭐ 이름</label></td>
						<td class = "label_second_id"><input type = "text" value = "${userInfo.userName }" id = "userName" name = "userName" class = "userName" style="text-indent: 20px"></td>
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "userId">⭐ 아이디</label></td>
						<td class = "label_second_id">
							<span style="margin-left: 20px">${userInfo.userId }</span>
							<input type = "hidden" name = "userId" value = "${userInfo.userId}">
							<input type = "hidden" name = "userNickName" value = "${userInfo.userNickName }">
						</td>
						
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "userNickName">⭐ 닉네임</label></td>
						<td class = "label_second_id"><span style="margin-left: 20px">${userInfo.userNickName }</span></td>
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "userEmail">⭐ 이메일</label></td>
						<td class = "label_second_id"><input type = "email" value = "${userInfo.userEmail}" id = "userEmail" name = "userEmail" class = "userEmail" style="text-indent: 20px"></td>
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "userPhoneNumber">⭐ 휴대폰번호</label></td>
						<td class = "label_second_id"><input type = "text" value = "${userInfo.userPhoneNumber}" id = "userPhoneNumber" name = "userPhoneNumber" class = "userPhoneNumber" style="text-indent: 20px"></td>
					</tr>
				</table>
				<div class = "table_sub">
					<button type = "submit" id = "modify_btn" class = "modify_btn">수정하기</button>
					<button type = "reset" id = "reset_btn" class = "reset_btn">취소</button>
				</div>
				</form>
				</div>
			</div>
		</div>
		<div id = "menu2">
			<div class = "menu2_box">
				<div class = "menu1_imo">⚠</div>
				<div class = "menu1_text">인벤은 회원님의 개인정보를 암호화하여 안전하게 보호하고 있으며, 가입하신 정보는 회원님의 명백한 동의없이는 공개 또는 제3자에게 제공되지 않습니다. </div>
			</div>
			<div class = "menu2_content_box">
				✔ 비밀번호는 8자이상의 영문자(대,소문자), 숫자, 특수문자를 혼용해 사용할 수 있습니다.<br>
				✔ 동일한 문자반복, 키보드상의 연속된 문자들의 집합등 특정 패턴을 갖는 비밀번호로 지정하지 마세요.<br>
				✔ 제3자가 쉽게 알 수 있는 이름, 생일, 휴대전화 등으로 비밀번호를 구성하지 마세요.<br>
				✔ 이전과 동일한 비밀번호를 지정하지 마세요.<br>
			</div>
			<div class = "menu2_table_div">
				<form action = "passwordOK.do" method = "post" id = "second_form">
				<table class = "menu2_table">
					<tr>
						<td class = "label_first_id"><label for = "password">&nbsp;&nbsp;새로운 비밀번호 입력</label></td>
						<td class = "label_second_id">
							<input type = "password" id = "userPassword" class = "userPassword" name = "userPassword">
							<input type = "hidden" name = "userId" value = "${userInfo.userId }">
						</td>
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "passwordOK">&nbsp;&nbsp;새로운 비밀번호 확인</label></td>
						<td class = "label_second_id"><input type = "password" id = "userPasswordOK" class = "userPasswordOK" name = "userPasswordOK"></td>
					</tr>
				</table>
				<div class = "table_sub">
					<button type = "submit" id = "password_btn" class = "password_btn">변경하기</button>
					
				</div>
				</form>
			</div>
		</div>
		<div id = "menu3">
			<div class = "menu3_box">
				<div class = "menu1_imo">⚠</div>
				<div class = "menu1_text">인벤은 회원님의 개인정보를 암호화하여 안전하게 보호하고 있으며, 가입하신 정보는 회원님의 명백한 동의없이는 공개 또는 제3자에게 제공되지 않습니다. </div>
			</div>
			<div class = "menu3_content">
				<p>⭕ 회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요.</p>
				<div class = "menu3_content_p">
					✔ 탈퇴 신청시 즉시 탈퇴 처리됩니다.<br>
					✔ 탈퇴 후 3개월 동안 회원가입이 불가능합니다.<br>
					✔ 사용하고 계신 아이디와 닉네임은 탈퇴 후 재사용 할 수 없습니다.<br>
					✔ 탈퇴 후 3개월이 지나면 회원정보 및 서비스와 관련된 포인트가 모두 삭제됩니다.<br>
					✔ 재가입에 3개월의 시간이 걸리는 만큼, 닉네임변경을 목적으로 하는경우 신중히 판단해주세요.<br>
					✔ 탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.<br>
					✔ <span style = "color : red">게시물 삭제 등을 원하는 경우 반드시 삭제 처리 후 탈퇴를 신청해주세요.</span>
				</div>
				<p>⭕ 아래 확인 버튼을 누르면 탈퇴가 진행됩니다.</p>
			</div>
			<form action = "WithdrawalOK.do" method = "post" id = "myform">
				<div class = "table_sub">
					<input type = "hidden" name = "userId" value = "${userInfo.userId }">
					<button type = "submit" id = "Withdrawal_button" class = "Withdrawal_btn">탈퇴하기</button>
					<button type = "reset" id = "reset_btn1" class = "reset_btn">취소</button>
				</div>
			</form>
		</div>
	</div>
	<script>
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
	  	
	
		 
	</script>
</body>
</html>



