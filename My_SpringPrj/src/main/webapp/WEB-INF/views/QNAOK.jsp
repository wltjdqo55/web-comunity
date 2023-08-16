<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
	<link rel="stylesheet" href="<c:url value='/static/css/member/qna.css'/>">
</head>
<body>
	<%@ include file="/static/includes/header.jsp" %>
<div class = "container_wrap">
	<%@ include file="/static/includes/side.jsp" %>
	<div class = "center_content">
		<%--가운데 div 라인 --%>
		<div style = "text=align: center; height: auto; width: 100%; margin: 0 auto; margin-top: 100px;">
			<c:if test = "${empty sessionScope.userInfo.userNickName}">
				<div style = "width: 80%; height: 100px; border: 1px solid gray; margin-left: 19%;" >
					<div style ="margin: 10px; background-color: #e3e4e6; width: 96%; height: 80%;">
						<span style = "font-size: 24px; font-weight: bold; position: absolute; margin-top: 19px; margin-left: 11%;">로그인 후 이용해주세요!</span>
					</div>
				</div>
			</c:if>
			<c:if test = "${not empty sessionScope.userInfo.userNickName}">
				<div style = "width: 80%; margin-left: 19%; margin-top: 20px;">
					<div style = "font-weight: bold; font-size: 22px;">나의 문의</div>
					<table border = "1" style = "margin-top:30px;">
						<tr>
							<th style = "text-align: center; width: 18%;">문의시각</th>
							<th style = "text-align: center; width: 69%;">문의내용</th>
						</tr>
						<tr>
							<td style = "text-align: center; width: 25%;"><c:out value = "${userdto.wtime }"/></td>
							<td style = "width: 75%;"><c:out value = "${userdto.content }"/></td>
						</tr>
					</table>
				</div>
				<div style = "width: 80%; margin-left: 19%; margin-top: 45px;">
					<div style = "font-weight: bold; font-size: 22px;">고객센터 답변</div>
					<div style = "width: 100%; height: auto;border-top: 1px solid #DDD; border-bottom: 1px solid #DDD; margin-top:30px;">
						<div style = "margin: 15px; width: 90%; height: 100%;">
							${admindto.content}
						</div>
					</div>
				</div>
				
				
				
			</c:if>
		</div>
											
	</div>				
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="<c:url value='/static/js/member/side.js'/>"></script>
</body>
</html>



























































