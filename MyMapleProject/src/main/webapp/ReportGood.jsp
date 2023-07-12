<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	  .sub_btn, .reset_btn {
		  display: inline-block;
		  padding: 10px 20px;
		  font-size: 16px;
		  background-color: #337ab7;
		  color: white;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  transition: background-color 0.3s;
		}
		
		.sub_btn:hover, .reset_btn:hover {
		  background-color: #23527c;
		}
</style>
</head>
<body>
	
	<div style = "font-size: 24px; font-weight: bold; margin-top: 100px; margin-left:100px;">
		<span style = "color: blue;">${replyNickName}</span> 님에 대한 신고가 완료되었습니다.<br><br>
		<input type = "button" value = "닫기" class = "reset_btn">
	</div>
	<script>
const reset_btn = document.querySelector(".reset_btn");
reset_btn.addEventListener("click", function(){
	window.close();
});
</script>
</body>
</html>