<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
.container{width: 50%; height: 80vh; margin : 0 auto;}
.container {
  margin-left: 25%;
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
}
.my-button {
  /* 배경색과 테두리 스타일 */
  background-color: #007bff;
  border: none;
  color: white;

  /* 패딩과 여백 설정 */
  padding: 8px 16px;
  margin: 5px;

  /* 글꼴 스타일 */
  font-family: Arial, sans-serif;
  font-size: 14px;
  font-weight: bold;

  /* 호버(마우스 오버) 스타일 */
  cursor: pointer;
}

.my-button:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>
	<div class = "header" style = "width: 100%; display: flex;">
		<div class = "header_header">
			<div class = "headerBar">
			<span><a href = "index.do">HOME</a></span>
			<c:if test = "${sessionScope.userInfo.role eq 'super'}">
				<span><a href = "Admin_Request.do" >관리자요청</a></span>
			</c:if>
			<span><a href = "Admin.do" >통계</a></span>
				<span><a href = "Admin_Member.do">회원관리</a></span>
				<span><a href = "Admin_Board.do">게시판관리</a></span>
				<span><a href = "Admin_Notice.do">공지/문의</a></span>
				<span><a href = "Admin_Image.do">이미지등록</a></span>
				<span><a href = "Admin_Report.do" style = "color:blue;">신고</a></span>
			</div>
		</div>
	</div>
	<div class = "container">
	<a href = "Admin_Report.do"><input type = "button" style = "padding:10px; margin:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "목록" ></a>
	<a href = "Admin_Update.do?num=${dto.num}" onclick="executeScript(event)"><input type = "button" style = "padding:10px; margin:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "처리등록" ></a>	
		<table>
			<tr>
				<td>신고 시각</td>
				<td>${dto.wtime}</td>
			</tr>
			<tr>
				<td>신고한 닉네임</td>
				<td>${dto.userNickName}<span style = "float:right;  padding: 2.5px; background-color:black; color:white; cursor: pointer;border-radius: 7px;" onclick = "userNickNameC('${dto.userNickName}')">권한해제</span></td>
			</tr>
			<tr>
				<td>신고내용</td>
				<td>
					<textarea rows="10" cols="40">${dto.reportcontent}</textarea>
				</td>
			</tr>
			<tr >
				<td>신고당한 닉네임 </td>
				<td>
					${dto.replyNickName} (신고당한 횟수 : ${count} 회)<span style = "float: right;"></span>
					<span style = "float:right;  padding: 2.5px; background-color:black; color:white; cursor: pointer;border-radius: 7px;" onclick = "replyNickNameC('${dto.replyNickName}')">권한해제</span>
				</td>
			</tr>
			<tr>
				<td>신고당한 내용</td>
				<td>
					<textarea rows="10" cols="40">${dto.title}</textarea>
				</td>
			</tr>
		</table>
	</div>
	
		<script>
		function executeScript(event){
			event.preventDefault();
			var confirm = window.confirm("처리등록 하시겠습니까?");
			if(confirm){
				window.location.href = event.currentTarget.getAttribute("href");
			}else{
				
			}
		}
		function userNickNameC(userNickName){
			var confirm = window.confirm(userNickName + " 님에 대한 글쓰기 및 댓글쓰기 권한을 해제하시겠습니까?");
			if(confirm){
				$.ajax({
				    url: "User_Revocation.do",
				    type: "POST",
				    data: {
				      "userNickName" : userNickName , 
				      "good" : 1
				    },
				    dataType: "text",
				    success: function(result) {
				      if (result == 1) {
				        alert(userNickName + " 님의 모든 권한이 해제되었습니다.");
				      } else {
				        alert("오류");
				      }
				    },
				    error: function() {
				      alert("서버 요청 오류");
				    }
				  });
			}else{
				
			}
		}
		function replyNickNameC(replyNickName){
			var confirm = window.confirm(replyNickName + " 님에 대한 글쓰기 및 댓글쓰기 권한을 해제하시겠습니까?");
			if(confirm){
				$.ajax({
				    url: "User_Revocation.do",
				    type: "POST",
				    data: {
				      "replyNickName" : replyNickName , 
				      "good" : 2
				    },
				    dataType: "text",
				    success: function(result) {
				      if (result == 1) {
				        alert(replyNickName + " 님의 모든 권한이 해제되었습니다.");
				      } else {
				        alert("오류");
				      }
				    },
				    error: function() {
				      alert("서버 요청 오류");
				    }
				  });
			}else{
				
			}
		}
		
		
		</script>
		
	</body>
</html>
























