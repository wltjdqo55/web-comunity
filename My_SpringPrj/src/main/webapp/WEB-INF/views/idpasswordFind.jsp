<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호찾기</title>
<link rel="stylesheet" href="<c:url value='/static/css/member/idpasswordFind.css'/>">

</head>
<body>
	<div class = "container">
		<ul>
			<li style = "width:90px"><a href="#" id = "menubutton1"><span id = "span1"><strong>① 인증</strong></span></a></li>
   		    <li><a href="#" id = "menubutton2" ><span id = "span2"><strong>② 아이디/비밀번호찾기</strong></span></a></li>
		</ul>
		<div id = "menu1">
			<div class = "menu1_box">
				<div class = "menu1_imo">⚠</div>
				<div class = "menu1_text">회원정보에 등록된 정보를 정확히 입력해주세요. </div>
			</div>
			<div class = "menu1_div">
				<div class = "menu1_table_div">
				<form action = "idpasswordFindOK" method = "post" id = "first_form">
				<table class = "menu1_table">
					<tr>
						<td class = "label_second_id"><input type = "text" id = "userName" name = "userName" placeholder = "이름을 입력해주세요." class = "userName" style="text-indent: 20px"></td>
					</tr>
					<tr>
						<td class = "label_second_id"><input type = "text" placeholder = "생년월일을 입력해주세요. ex) 20020101" id = "userBirth" name = "userBirth" class = "userBirth" style="text-indent: 20px"></td>
					</tr>
					<tr>
						<td class = "label_second_id"><input type = "text"  id = "userEmail" name = "userEmail" class = "userEmail" style="text-indent: 20px" placeholder = "가입할 때 입력했던 이메일을 입력해주세요. ex) aaa@naver.com"></td>
					</tr>
					<tr>
						<td class = "label_second_id"><input type = "text"  id = "userPhoneNumber" name = "userPhoneNumber" class = "userPhoneNumber" style="text-indent: 20px" placeholder = "가입할 때 입력했던 휴대폰 번호를 - 빼고 입력해주세요. ex) 01086206367"></td>
					</tr>
				</table>
				<div class = "table_sub">
					<button type = "submit" id = "modify_btn" class = "modify_btn">회원정보 찾기</button>
					<button type = "reset" id = "reset_btn" class = "reset_btn">취소</button>
				</div>
				</form>
				</div>
			</div>
		</div>
		<div id = "menu2">
			<div class = "menu2_box">
				<div class = "menu1_text">아이디는 아래와 같습니다. </div>
			</div>
			<div class = "menu2_content_box">
				<div class = "menu2_content_box_left">
					<span>아이디</span>
				</div>
				<div class = "menu2_content_box_right">
					<span>${userId}</span>
				</div>
			</div>
			<div class = "menu2_table_div">
				<form action = "Findpassword" method = "post" id = "second_form">
				<table class = "menu2_table">
					<tr>
						<td class = "label_first_id"><label for = "password">&nbsp;&nbsp;새로운 비밀번호 입력</label></td>
						<td class = "label_second_id">
							<input type = "password" id = "userPassword" class = "userPassword" name = "userPassword" style="text-indent: 10px">
							<input type = "hidden" value = "${userId}" name = "userId">
						</td>
					</tr>
					<tr>
						<td class = "label_first_id"><label for = "passwordOK">&nbsp;&nbsp;새로운 비밀번호 확인</label></td>
						<td class = "label_second_id"><input type = "password" id = "userPasswordOK" class = "userPasswordOK" name = "userPasswordOK" style="text-indent: 10px"></td>
					</tr>
				</table>
				<div class = "table_sub">
					<button type = "submit" id = "password_btn" class = "password_btn">변경하기</button>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="<c:url value='/static/js/member/idpasswordFind.js'/>"></script>
	<script>
	const testData = '${next}';
	document.addEventListener("DOMContentLoaded", function() {
	    if (testData === '입력하신 정보가 일치합니다. 다음단계로 넘어갑니다.') {
	    	alert(testData);
			document.querySelector("#menu1").style.display = "none";
			document.querySelector("#menu2").style.display = "block";
			document.querySelector("#span1").style.backgroundColor = "#dedcdc";
			document.querySelector("#span2").style.backgroundColor = "white";
	    }
	});
	const error = '${error}';
	document.addEventListener("DOMContentLoaded", function() {
	    if (error === '입력하신 정보가 일치하지 않습니다.') {
	    	alert(error);
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
	
	var userName = document.querySelector("#userName");
	 var userEmail = document.querySelector("#userEmail");
	 var userPhoneNumber = document.querySelector("#userPhoneNumber");
	 var userBirth = document.querySelector("#userBirth");
	 var modify_btn = document.querySelector("#modify_btn");
	 var first_form = document.querySelector("#first_form");
	 
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
		}else if(userPhoneNumber.value === ""){
			alert("휴대폰번호를 입력하세요.");
			userPhoneNumber.focus();
			return;
		}else if(!(userPhoneNumber.value.match(/^[0-9]+$/)) || userPhoneNumber.value.length <= 11){
			alert("휴대폰번호는 11자리의 이하의 숫자를 입력하세요.");
			userPhoneNumber.focus();
			return;
		}else{
			first_form.submit();
		}
	})
	</script>
</body>
</html>

