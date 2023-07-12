<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{margin:0;padding:0;width:100%; height: auto;}
.header{width:100%;  margin-right:0; }
.header_header{width: 100%;}
.headerBar{width: 90%; height: 60px; text-align: right; margin-top:30px; margin-right: 30px;}
.headerBar a{text-decoration: none; color : black; font-size: 24px; font-weight: bold;  }
.headerBar span{margin-left:5%;margin-top:10%; }
tr:hover{background-color:#e3e4e6;}
.container{width: 50%; height: 80vh;   margin-top:40px;margin : 0 auto;}
.container {
  margin-left: 25%;
  margin-top: 5%;
}

table {
  border: 1px solid black;
  border-collapse: collapse;
  width: 100%;
}

table td {
  border: 1px solid black;
  padding: 10px;
}

textarea {
  width: 100%;
  height: 200px;
}

</style>
</head>
<body>
	<div class = "header" style = "width: 100%; display: flex;">
		<div class = "header_header">
			<div class = "headerBar">
			<span><a href = "index.do">HOME</a></span>
			<c:if test = "${sessionScope.userInfo.role eq 'super'}">
				<span><a href = "Admin_Request.do" style = "color:blue;">관리자요청</a></span>
			</c:if>
			<span><a href = "Admin.do" >통계</a></span>
				<span><a href = "Admin_Member.do">회원관리</a></span>
				<span><a href = "Admin_Board.do">게시판관리</a></span>
				<span><a href = "Admin_Notice.do">공지/문의</a></span>
				<span><a href = "Admin_Image.do">이미지등록</a></span>
				<span><a href = "Admin_Report.do">신고</a></span>
			</div>
		</div>
	</div>
	<div class = "container">
		<input type = "button" onclick = "deleteGood('${userNickName}')" style = "padding:10px; margin:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "탈퇴처리" >
		<a href = "Admin_Request.do"><input type = "button" style = "padding:10px; margin:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "목록" ></a>
		<table>
			<tr>
				<td>닉네임</td>
				<td>${userNickName}</td>
			</tr>
			<tr>
				<td>요청한관리자</td>
				<td>${adminNickName}</td>
			</tr>
			<tr>
				<td>삭제사유</td>
				<td>
					<textarea rows="20" cols="40">${reasons}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
   		function deleteGood(userNickName){
   			var confirm = window.confirm("정말 회원탈퇴 처리하시겠습니까?");
   			if(confirm){
   				$.ajax({
				      url: "deleteGood.do",
				      type: "post",
				      data: {
				        "userNickName": userNickName
				      },
				      dataType: "text",
				      success: function(result) {
				        if (result == 1) {
				          alert(userNickName + " 님이 탈퇴처리 되었습니다.");
				          location.href = "Admin_Request.do";
				        } 
				      },
				      error: function() {
				        alert("서버 요청 실패");
				      }
				    });
   			}else{
  			
   			}
   		}
    </script>
</html>