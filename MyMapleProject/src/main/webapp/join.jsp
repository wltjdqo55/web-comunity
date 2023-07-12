<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{width: 80%; margin:0; padding:0; margin: 0 auto; height: 800px;}
     .container{width: 70%; margin: 0 auto; text-align: center; margin-top: 100px; height: 550px; border: 1px solid #e0e0e0;}
     table{margin: 0 auto; text-align: left; background-color : #F5F5F5; border: 1px solid #DDD; padding: 15px;}
     .join_p{font-size: 24px; color: #5F9EA0; font-weight: bold;}
     .lefttd{width: 150px;}
     tr{height: 40px;}
     input{height: 30px; background-color: #FFFFFF; border:none;}
     .userID, .nickName{width: 300px;}
     .userNickname{width:72%;}
     .userID_btn, .userNickname_btn{padding: 8px;background-color: #B0C4DE; color: white; font-size:15px; border: none; border-radius : 5px; cursor: pointer;}
     .userID_btn:hover, .userNickname_btn:hover{background-color : #778899;}
     .userPassword, .userPasswordOK, .userEmail, .userName, .userBirth{width:98%;}
     .userPhone{width:100px;}
	.reception{}
	.spango{padding-bottom: 15px;}
	.ddddd{height: 18px;}
	.ddd{height: 18px;}
	.subclass{margin-top: 20px;height: 50px;}
	.join_sub, .back_button{width: 100px; height:50px; background-color:  #B0C4DE; color: white; border: none; font-size: 16px; font-weight: bold; cursor: pointer; border-radius: 5px; }
	.join_sub:hover, .back_button:hover{background-color:#778899;}
	
}
</style>
</head>
<body>
     <div class = "container">
     	<p class = "join_p">INVEN 회원가입</p>
     	
     	<form action = "JoinOK.do" method = "post" id = "myForm">
     	<table>
     		<tr>
     			<td class = "lefttd"><label for = "userName">이름</label></td>
     			<td><input type = "text" name = "userName" id = "userName" class = "userName" placeholder="이름을 입력하세요"></td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "userID">아이디</label></td>
     			<td>
     				<input type = "text" name = "userID" id = "userID" class = "userID" placeholder="아이디를 입력하세요">
     				<button class = "userID_btn" id = "userID_button">아이디 중복체크</button>
     			</td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "NickName">닉네임</label></td>
     			<td>
     				<input type = "text" name = "userNickname" id = "userNickname" class = "nickName" placeholder="닉네임을 입력하세요">
     				<button class = "userNickname_btn" id = "userNickname_button">닉네임 중복체크</button>
     			</td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "userPassword">비밀번호</label></td>
     			<td><input type = "password" name = "userPassword" id = "userPassword" class = "userPassword" placeholder="비밀번호는 8자리 이상 입력하세요"></td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "userPasswordOK">비밀번호확인</label></td>
     			<td><input type = "password" name = "userPasswordOK" id = "userPasswordOK" class = "userPasswordOK" placeholder="비밀번호를 확인하세요"></td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "userBirth">생년월일</label></td>
     			<td><input type = "text" name = "userBirth" id = "userBirth" class = "userBirth" placeholder="ex) 19960415" maxlength="8"></td>
     		</tr>
     		
     		<tr>
     			<td class = "lefttd"><label for = "userEmail">이메일</label></td>
     			<td><input type = "email" name = "userEmail" id = "userEmail" class = "userEmail" placeholder="이메일을 입력하세요"></td>
     		</tr>
     		<tr>
     			<td class = "lefttd"><label for = "userPhone">전화번호</label></td>
     			<td>
     				<input type = "text" name = "first_phone" id = "first_userPhone" class = "userPhone" placeholder="3자리" maxlength="3"> -
     				<input type = "text" name = "center_phone" id = "second_userPhone" class = "userPhone" placeholder="4자리" maxlength="4"> -
     				<input type = "text" name = "last_phone" id = "last_userPhone" class = "userPhone" placeholder="4자리" maxlength="4">
     			</td>
     		</tr>
     		<tr class = "ddddd">
     			<td>수신동의</td>
     			<td class = "reception">
     				<span class = "spango">이메일</span><input type ="checkbox" name = "mail_reception" value = "mail_reception" class = "ddd">
     				전화번호<input type = "checkbox" name = "phone_reception" value = "phone_reception" class = "ddd">
     			</td>
     		</tr>
     	</table>
		<div class = "subclass">
			<input type= "submit" value = "회원가입" class = "join_sub" id = "join_sub">
			<input type="button" value = "취소" class = "back_button" onclick="location.href='index.do'; return false;">
		</div>
     	</form>
     </div>
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	<script src = "script/join.js"></script>
     
</body>
</html>