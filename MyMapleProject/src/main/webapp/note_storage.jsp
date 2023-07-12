<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.storage_span{font-weight: bold;}
	
	
	.container_right_box{border: 1px solid black; width: 500px; margin: 5px;background-color: #f2f2f2; border-radius: 10px;}
	.container_right_inner_box{border: 1px solid black; margin: 10px; background-color: white; height: 95%; border-radius: 10px;}
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
				<span class = "left_content_type_span writing_span"><a href = "note_writing.do">▶ 쪽지 보내기</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span send_span"><a href = "note.do">▶ 받은 쪽지함</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span write_span"><a href = "note_write.do">▶ 보낸 쪽지함</a></span>
			</div>
		</div>
	</div>
	<div class = "container_right_box">
		<div class = "container_right_inner_box">
			
		</div>
	</div>
</div>
</body>
</html>