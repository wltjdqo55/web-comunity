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

.container{width: 80%; height: 80vh;   margin-top:40px;margin : 0 auto;}
tr:hover{background-color:#e3e4e6;}
#myChart{width: 60%; height: 60%;}
table{width:90%; margin : 0 auto; border-collapse: collapse;}
.container_header{height: 50px; width: 90%; margin-bottom: 30px;}
.pageP{width:90%; margin : 0 auto;  text-align: center; margin-top: 30px; }
.pageP a{color: black; text-decoration: none;}
.spanspans{border:1px solid #DDD; padding:5px 10px 5px 10px ; color: #7fcdff;}
 td {
    padding: 4px;
    border-bottom: 1px solid #ddd;
  }
  
  /* 짝수 행 스타일 */
  tr:nth-child(even) {
    background-color: #f9f9f9;
  }
  
  /* 마우스 호버 스타일 */
  tr:hover {
    background-color: #e6e6e6;
  }
 th {
    background-color: #f2f2f2;
    text-align: left;
    padding: 8px;
    
  }
 td:first-child, th:first-child{
    text-align: center;
  }
  
  /* 마지막 td 스타일 */
  td:last-child, th:last-child {
    text-align: center;
  }
td a{text-decoration: none; color: black;}
.TD1{width:5%; text-align: center;}
.TD2{width:12%; text-align: center;}
.TD3{width:70%;}
.TD4{text-align: center;}

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
		<table border = "1">
			<tr>
				<th class = "TD1">번호</th>
				<th class = "TD2">닉네임</th>
				<th class = "TD3">삭제사유</th>
				<th class = "TD4">요청한관리자</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td class = "TD1"><c:out value="${item.num}" /></td>
					<td class = "TD2">
						<a href = "Admin_RequestOK.do?userNickName=${item.userNickName}&reasons=${item.reasons}&adminNickName=${item.adminNickName}"><c:out value="${item.userNickName}" /></a>
					</td>
					<td class = "TD3">
						<a href = "Admin_RequestOK.do?userNickName=${item.userNickName}&reasons=${item.reasons}&adminNickName=${item.adminNickName}"><c:out value="${item.reasons}" /></a>
					</td>
					<td class = "TD4">
						<a href = "Admin_RequestOK.do?userNickName=${item.userNickName}&reasons=${item.reasons}&adminNickName=${item.adminNickName}"><c:out value="${item.adminNickName}" /></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
   
    </script>
</html>