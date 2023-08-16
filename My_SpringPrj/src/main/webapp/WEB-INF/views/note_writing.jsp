<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
	.container{width:650px; height: 450px; border:1px solid gray; margin-left: 10px; margin-top:10px; display: flex;}
	
	.container_left_box{border: 1px solid black; width: 150px; margin: 5px; background-color: #f2f2f2; border-radius: 10px;}
	.container_left_inner_box{border: 1px solid black; margin: 10px; background-color: white; height: 95%; border-radius: 10px;  }
	.left_header{height: 50px; border-bottom: 2px solid #DDD;}
	.left_header span{padding-top : 14px; padding-left: 25px;position: absolute; font-size: 18px; font-family: monospace; font-weight: bold;}
	.left_content_type{height: 45px; border-bottom: 1px solid #DDD;}
	.left_content_type span{position: absolute; padding-top: 13px; padding-left: 10px; font-size: 13px;}
	.left_content_type span a{text-decoration: none; color : black;}
	.left_content_type:hover{font-weight: bold;}
	.writing_span{font-weight: bold;}
	
	
	.container_right_box{border: 1px solid black; width: 500px; margin: 5px;background-color: #f2f2f2; border-radius: 10px;}
	.container_right_inner_box{border: 1px solid black; margin: 10px; background-color: white; height: 95%; border-radius: 10px;}
	.right_header{height: 25px;}
	.right_header_span{position: absolute; margin-top:10px; font-size: 14px; margin-left: 10px;}
	.right_table_div{margin: 15px; height: 350px; margin-top : 20px;}
	.first_td{width: 120px; font-size: 14px; text-align: center;}
	.second_td{width: 350px;}
	.goodd{width: 350px; height: 32px;}
	table td{border: 1px solid gray;}
	.ddd{height: 40px;}
	.bottom_left{margin-left: 8px;float:left; padding: 5px 10px 5px 10px; border: 1px solid black; border-radius: 3px; font-size: 13px; margin-top:5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);}
	.bottom_left a{text-decoration: none; color: black;}
	.bottom_right{float: right; padding: 5px;}
	.bottom_right input[type="submit"]{padding:5px; border-radius: 3px; font-size: 13px; border:1px solid black; cursor: pointer; background-color: #ffffff; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);}
</style>
</head>
<body>
<div class = "container">
	<div class = "container_left_box">
		<div class = "container_left_inner_box">
			<div class = "left_header">
				<span>쪽지함</span> 
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span writing_span"><a href = "note_writing">▶ 쪽지 보내기</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span send_span"><a href = "note">▶ 받은 쪽지함</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span write_span"><a href = "note_write">▶ 보낸 쪽지함</a></span>
			</div>
		</div>
	</div>
	<div class = "container_right_box">
		
		<div class = "container_right_inner_box">
			<div class = "right_header">
				<span class = "right_header_span"><span style = "font-size : 20px;">📬</span> ${sessionScope.userInfo.userNickName}님의 <span style ="color:#f37736;">새쪽지쓰기</span>입니다.</span>
			</div>
			<div class = "right_table_div">
			<form action = "note_writingOK" method = "post">
			<table>
				<tr>
					<td class = "first_td"><label for = "tosendNickName">닉네임</label></td>
					<td class = "second_td"><input type = "text" name = "tosendNickName" id = "tosendNickName" class = "goodd" value = "${userNickName}"> </td>
				</tr>
				<tr>
					<td class = "first_td"><label for = "title">제목</label></td>
					<td class = "second_td"><input type = "text" name = "title" id = "title" class = "goodd"> </td>
				</tr>
				<tr>
					<td class = "first_td"><label for = "content">내용</label></td>
					<td class = "second_td"><textarea cols="46" rows="16" name = "content" id = "content"></textarea> </td>
				</tr>
			</table>
			<div class = "ddd">
				<input type = "hidden" value = "${sessionScope.userInfo.userNickName}" name = "userNickName">
				<span class = "bottom_left"><a href = "note.do">취소</a></span>
				<span class = "bottom_right"><input type = "submit" value = "쪽지보내기"></span>
			</div>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>









