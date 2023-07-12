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
	#menu1, #menu2{margin: 20px;}
	
	.menu1_box{display: flex; font-size: 14px;}
	.menu1_imo{width: 30px;}
	.menu1_text{width:570px;}
	.menu1_div{margin-top: 15px; width: 600px; height: 320px;}
	.menu1_table{ width: 95%; height: 200px; margin: 10px; }
	.menu1_table td{border: 1px solid #DDD; border-radius : 10px;}
	.menu1_header{height: 30px;}
	.table_sub{margin-left: 15px;}
	.table_sub button{width:120px; height: 50px; background-color: #B0C4DE; color: white; border: none; border-radius: 3px; font-weight: bold; font-size: 15px; cursor: pointer;}
	.table_sub button:hover{background-color : #778899;}
	.userName, .userEmail, .userPhoneNumber, .userBirth{height: 90%; width:98%; font-size: 16px; border: none;}
	.label_first_id{width:180px}
	.label_second_id{font-size: 18px; }
	
	.menu2_box{display: flex; font-size: 14px; margin-top: 20px; color: red; margin-left: 30px;}
	.menu2_content_box{font-size: 13px; margin-top: 30px; display: flex; width: 100%;}
	.menu2_table_div{margin-top: 20px;}
	.menu2_table{width: 95%; height: 100px; margin: 10px;}
	.menu2_table td{border: 1px solid #DDD; border-radius : 10px;}
	.userPassword, .userPasswordOK{height: 90%; width:98%; font-size: 16px; border: none;}
	
	.menu2_content_box_left{width: 30%; height: 60px;  text-align: center; font-size: 24px; font-weight: bold; }
	.menu2_content_box_right{width: 70%; height: 60px;  text-align: left; font-size: 24px; }
	.menu2_content_box_right span{margin-left: 15px; }
	.menu2_content_box_left span{}
</style>
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
				<form action = "idpasswordFindOK.do" method = "post" id = "first_form">
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
					<span>${Member.userId}</span>
				</div>
			</div>
			<div class = "menu2_table_div">
				<form action = "FindpasswordOK.do" method = "post" id = "second_form">
				<table class = "menu2_table">
					<tr>
						<td class = "label_first_id"><label for = "password">&nbsp;&nbsp;새로운 비밀번호 입력</label></td>
						<td class = "label_second_id">
							<input type = "password" id = "userPassword" class = "userPassword" name = "userPassword" style="text-indent: 10px">
							<input type = "hidden" value = "${Member.userId}" name = "userId">
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
	<script src = "script/idpasswordFindOK.js"></script>
	<script>
	const next = '${pageContext.request.getAttribute("next")}';
	if(next == '입력하신 정보가 일치합니다. 다음단계로 넘어갑니다.'){
		alert(next);
		document.querySelector("#menu1").style.display = "none";
		document.querySelector("#menu2").style.display = "block";
		document.querySelector("#span1").style.backgroundColor = "#dedcdc";
		document.querySelector("#span2").style.backgroundColor = "white";
	}
	const resultOMG = '${pageContext.request.getAttribute("resultOMG")}';
	if(resultOMG == '입력하신 정보가 일치하지 않습니다.'){
		alert(resultOMG);
	}
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
		
		
	</script>
</body>
</html>

