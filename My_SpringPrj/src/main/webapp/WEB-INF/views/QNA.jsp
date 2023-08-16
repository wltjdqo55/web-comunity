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
			 <div style = "text-align: center; height: 50px; width: 100%; margin:0 auto;">
				<span style = "position: absolute;font-size: 24px; font-weight: bold; margin-top : 50px;">고객센터</span>
			</div>
			<div style = "text=align: center; height: auto; width: 100%; margin: 0 auto; margin-top: 100px;">
				<c:if test = "${empty sessionScope.userInfo.userNickName}">
					<div style = "width: 80%; height: 100px; border: 1px solid gray; margin-left: 19%;" >
						<div style ="margin: 10px; background-color: #e3e4e6; width: 96%; height: 80%;">
							<span style = "font-size: 24px; font-weight: bold; position: absolute; margin-top: 19px; margin-left: 11%;">로그인 후 이용해주세요!</span>
						</div>
					</div>
				</c:if>
				<c:if test = "${not empty sessionScope.userInfo.userNickName}">
					<div style = "width: 80%; height: auto; margin-left: 19%;" >
						<form action = "QNA_Write" method = "post">
						<div style = "display:flex;" style = "width: 100%;">
							<div style = "float:left; width: 50%;">
								<input type = "button" onclick = "btn_QNA()" value = "문의하기" class = "styled-button">
							</div>
							<div style = "float:right; width: 50%; display: none;" class = "sub_btn_g">
								<input type = "submit" value = "등록" class = "styled-button" style = "float:right;">
							</div>
						</div>
						<div style = "margin-top: 10px; display: none;" class = "form_div" >
							<table border = "1">
								<tr>
									<td>문의사유</td>
									<td>
										<input type="radio" name = "QNARadio" value = "1" checked>게시판관련문의
										<input type="radio" name = "QNARadio" value = "2">회원관련문의
										<input type="radio" name = "QNARadio" value = "3">권한문의
										<input type="radio" name = "QNARadio" value = "4">기타
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<textarea rows="15" cols="75" name = "content" placeholder="문의사항을 입력해주세요."></textarea>
										<input type = "hidden" name = "userNickName" value = "${sessionScope.userInfo.userNickName}">
									</td>
								</tr>
							</table>
							
						</div>
					</form>								
						
					</div>
					<div style = "width: 80%; margin-left: 19%; margin-top: 20px;">
						<table border = "1">
							<tr>
								<th style = "text-align: center; width: 18%;">문의시각</th>
								<th style = "text-align: center; width: 67%;">문의내용</th>
								<th style = "text-align: center; width: 15%;">상태</th>
							</tr>
							<c:forEach items = "${list}" var = "item">
							<tr>
								<td style = "text-align: center; width: 18%;"><c:out value = "${item.wtime }"/></td>
								<c:if test = "${item.state eq '답변대기'}">
									<td style = "width: 67%;"><c:out value = "${item.content }"/></td>
								</c:if>
								<c:if test = "${item.state eq '답변완료'}">
									<td style = "width: 67%;"><a href = "QNA_RE_GOOD?num=${item.num}" style = "color:black; font-weight: bold; text-decoration: none;"><c:out value = "${item.content }"/></a></td>
								</c:if>
								<c:if test = "${item.state eq '답변대기'}">
									<td style = "text-align: center; width: 15%;"><span style = "color:red;"><c:out value = "${item.state }"/></span></td>
								</c:if>
								<c:if test = "${item.state eq '답변완료'}">
									<td style = "text-align: center; width: 15%;"><span style = "color:blue;"><c:out value = "${item.state }"/></span></td>
								</c:if>
							</tr>
							</c:forEach>
						</table>
					</div>
					
					
				</c:if>
			</div>
											
		<%--//가운데 div 라인 --%>
	</div>				
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script src="<c:url value='/static/js/member/qna.js'/>"></script>
<script src="<c:url value='/static/js/member/side.js'/>"></script>
</body>
</html>



























































