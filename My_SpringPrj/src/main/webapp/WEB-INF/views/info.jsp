<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="<c:url value='/static/css/member/info.css'/>">
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
				<form action = "member_modify" method = "post" id = "first_form">
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
				<form action = "member_passwordOK" method = "post" id = "second_form">
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
			<form action = "WithdrawalOK" method = "post" id = "myform">
				<div class = "table_sub">
					<input type = "hidden" name = "userId" value = "${userInfo.userId }">
					<button type = "submit" id = "Withdrawal_button" class = "Withdrawal_btn">탈퇴하기</button>
					<button type = "reset" id = "reset_btn1" class = "reset_btn">취소</button>
				</div>
			</form>
		</div>
	</div>
	<script src="<c:url value='/static/js/member/info.js'/>"></script>
</body>
</html>



