<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{border: 1px solid gray; width: 680px; height: 530px;}
	.container_header{width: 100%; height: 50px; background-color: #DDD;}
	.container_inner_header{ font-size: 19px; font-weight: bold; color: black; text-align: center;margin-right : 120px;}
	.container_inner_header span{position: absolute; padding-top : 10px; }
	.container_content{ width:95%; height: 80%; margin : 0 auto;}
		table {
	    width: 100%;
	    border-collapse: collapse;
	    font-size: 15px;
	  }
	
	  th, td {
	    padding: 10px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	  }
	
	  tr:nth-child(even) {
	    background-color: #f2f2f2;
	  }
	
	  input[type="radio"] {
	    margin-right: 5px;
	  }
	
	  textarea {
	    width: 100%;
	    resize: vertical;
	  }
	  .sub_btn{border: none; float:left;}
	  .reset_btn{float:right;}
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
	<div class = "container">
		<div class = "container_header">
			<div class = "container_inner_header">
				<span>신고하기</span>
			</div>
		</div>
		<div class = "container_content">
		<form action = "ReportOK.do" method = "post">
			<table>
				<tr>
					<td>제목</td>
					<td>${title}</td>
				</tr>
				<tr>
					<td>작성자 닉네임</td>
					<td>${replyNickName}</td>
				</tr>
				<tr>
					<td>신고자 닉네임</td>
					<td>${userNickName}</td>
				</tr>
				<tr>
					<td>신고사유</td>
					<td>
						<input type="radio" name = "ReportRadio" value = "1" checked>욕설/비방
						<input type="radio" name = "ReportRadio" value = "2">도배
						<input type="radio" name = "ReportRadio" value = "3">홍보/상업성
						<input type="radio" name = "ReportRadio" value = "4">음란성
						<input type="radio" name = "ReportRadio" value = "5">불법촬영물
						<input type="radio" name = "ReportRadio" value = "6">기타
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="13" cols="90" name = "reportcontent"></textarea>
						<input type = "hidden" value = "${userNickName}" name = "userNickName">
						<input type = "hidden" value = "${replyNickName}" name = "replyNickName">
						<input type = "hidden" value = "${title}" name = "title">
					</td>
				</tr>
			</table>
			<div style = "font-size: 14px; font-weight: bold; margin-top:10px;">
				※ 허위 신고시 신고자의 활동에 제한을 받게 되오니, 그 점 유의해 주시기 바랍니다.
			</div>
			<div style = "margin: 15px; text-align: center;">
				<input type = "submit" value = "신고하기" class = "sub_btn">
				<input type = "button" value = "닫기" class = "reset_btn">
			</div>
		</form>
		</div>
		
	</div>
</body>
<script>
const reset_btn = document.querySelector(".reset_btn");
reset_btn.addEventListener("click", function(){
	window.close();
});
</script>
</html>