<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색</title>
<link rel="stylesheet" href="<c:url value='/static/css/header_side/center.css'/>">
</head>
<body>
<%@ include file="/static/includes/header.jsp" %>
<div class = "container_wrap">
	<%@ include file="/static/includes/side.jsp" %>
	<div class = "center_content">
		<div class = "center_content" style = "margin: 0 auto;">
			<div class = "container_header_content" style = "width: 100%; height: 100px; margin-top: 20px; background-color:#76b6c4; position: relative;">
				<div class = "header_content_inner" style = "width: 90%; height: 100%;  margin : 0 auto;">
					<form action = "IntegratedSearch.do" method = "post">
						<div class = "zkxkck" style = "width: 100%; height: 50%; margin: 0 auto; display: flex; margin-top: 4%; position: absolute;">
							<div style = "width: 18%; color: white; font-weight: bold; font-size: 19px;"><span style = "position: absolute;margin-top:5px;">인벤 통합검색</span></div>
							<div style = "width: 82%;">
								<input type = "text" name = "searchContent" style = "width: 80%; height: 37px; border-radius:2px; border:none;" value = "${search }">
								<input type = "submit" value = "검색" style = "padding: 9px 13px; border: none; border-radius: 5px; cursor: pointer;font-weight: bold;font-size:14px;  ">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div style = "width: 100%; position: relative; height: auto; border: 1px solid #e5e6eb; border-radius: 10px; margin-top: 50px; margin-bottom:80px;">
				<div style = "width: 100%; height: 50px; margin:20px; margin-bottom:0; font-size: 17px; font-weight: bold;">
					<span>게시판</span>
					<a href = "IntegratedSearch_time.do?searchContent=${search}" style = "float: right; margin-right: 50px; font-size:15px; color: gray; font-weight: normal; text-decoration: none;">날짜순</a>
					<a href = "IntegratedSearch_Accuracy.do?searchContent=${search}" style = "float: right; margin-right: 50px; font-size:15px; color: gray; font-weight: normal; text-decoration: none;">정확도순</a>
				</div>
				
			<c:forEach items = "${list}" var = "item">
			<c:if test = "${item.boardcategory eq '자유게시판' }">
				<div class = "table_div_gogo" style = "margin: 20px; margin-top:0; height: auto; width: 95%; border-radius: 10px;">
						<div style = "width: 100%; margin-bottom: 20px; border: 1px solid #e5e6eb; border-radius:10px;">
						     <div style = "width: 90%; height: auto; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; margin:10px;">
						     	<c:set var="countValue" value="${item.comment}" />
						     	<a href = "board_Free_Content_View?num=${item.num}&comment=${countValue}" style = "color: #146eb4; font-weight: bold; font-size:17px;">${item.userTitle}</a>
						     </div>
							<div style="width: 95%; color: black; height: 20px; margin-top: 5px; margin: 10px; overflow-wrap: break-word; white-space: nowrap; text-overflow: ellipsis;" class="dividv" id="contentDiv">
							  <c:set var="hasImage" value="${fn:contains(item.boardContent, '<img')}" />
							  <c:if test="${not hasImage}">
							    <c:set var="strippedContent" value="${fn:replace(item.boardContent, '<div>', ' ')}" />
							    <c:set var="strippedContentNoDiv" value="${fn:replace(strippedContent, '</div>', '')}" />
							    <c:set var="strippedContentFinal" value="${fn:replace(strippedContentNoDiv, '<br>', '')}" />
							    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" class="zvvf">
							      <c:set var="delimiter" value=" " />
							      <c:set var="tokens" value="${fn:split(strippedContentFinal, delimiter)}" />
							      <c:forEach var="token" items="${tokens}">
							        <c:choose>
							          <c:when test="${token eq search}">
							          <strong>${token}</strong>
							          </c:when>
							          <c:otherwise>
							            ${token}
							          </c:otherwise>
							        </c:choose>
							        ${delimiter}
							      </c:forEach>
							    </div>
							  </c:if>
							</div>
						     <div style = "width: 95%; margin:10px;">
						     		<span style = "color:#0abdc6;"><a href = "board_Free" style = "color:#49ab81; font-size: 14px; text-decoration: none;">${item.boardcategory}</a></span> &nbsp;&nbsp;&nbsp;
						     		<span style = "color:#b3b3b3; font-size:13px;">
						     		<script>
						        	 var wtime = new Date("<c:out value="${item.wtime}" />");
						             var today = new Date();

						             if (wtime.toDateString() === today.toDateString()) {
						               var formattedTime = wtime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
						               document.write(formattedTime);
						             } else {
						               var month = String(wtime.getMonth() + 1).padStart(2, '0');
						               var date = String(wtime.getDate()).padStart(2, '0');
						               var formattedDate = month + '-' + date;
						               document.write(formattedDate);
						             }
								    </script>
								    </span>
						     </div>
						</div>
				</div>
			</c:if>
			<c:if test = "${item.boardcategory eq '직업게시판' }">
				<div class = "table_div_gogo" style = "margin: 20px; margin-top:0; height: auto; width: 95%; border-radius: 10px;">
						<div style = "width: 100%; margin-bottom: 20px; border: 1px solid #e5e6eb; border-radius:10px;">
						     <div style = "width: 90%; height: auto; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; margin:10px;">
						     	<c:set var="countValue" value="${item.comment}" />
						     	<a href = "Warrior_board_Free_Content_View?num=${item.num}&comment=${countValue}" style = "color: #146eb4; font-weight: bold; font-size:17px;">${item.userTitle}</a>
						     </div>
							<div style="width: 95%; color: black; height: 20px; margin-top: 5px; margin: 10px; overflow-wrap: break-word; white-space: nowrap; text-overflow: ellipsis;" class="dividv" id="contentDiv">
							  <c:set var="hasImage" value="${fn:contains(item.boardContent, '<img')}" />
							  <c:if test="${not hasImage}">
							    <c:set var="strippedContent" value="${fn:replace(item.boardContent, '<div>', ' ')}" />
							    <c:set var="strippedContentNoDiv" value="${fn:replace(strippedContent, '</div>', '')}" />
							    <c:set var="strippedContentFinal" value="${fn:replace(strippedContentNoDiv, '<br>', '')}" />
							    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" class="zvvf">
							      <c:set var="delimiter" value=" " />
							      <c:set var="tokens" value="${fn:split(strippedContentFinal, delimiter)}" />
							      <c:forEach var="token" items="${tokens}">
							        <c:choose>
							          <c:when test="${token eq search}">
							          <strong>${token}</strong>
							          </c:when>
							          <c:otherwise>
							            ${token}
							          </c:otherwise>
							        </c:choose>
							        ${delimiter}
							      </c:forEach>
							    </div>
							  </c:if>
							</div>
						     <div style = "width: 95%; margin:10px;">
						     		<span style = "color:#0abdc6;"><a href = "Warrior" style = "color:#49ab81; font-size: 14px; text-decoration: none;">${item.boardcategory}</a></span> &nbsp;&nbsp;&nbsp;
						     		<span style = "color:#b3b3b3; font-size:13px;">
						     		<script>
						        	 var wtime = new Date("<c:out value="${item.wtime}" />");
						             var today = new Date();

						             if (wtime.toDateString() === today.toDateString()) {
						               var formattedTime = wtime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
						               document.write(formattedTime);
						             } else {
						               var month = String(wtime.getMonth() + 1).padStart(2, '0');
						               var date = String(wtime.getDate()).padStart(2, '0');
						               var formattedDate = month + '-' + date;
						               document.write(formattedDate);
						             }
								    </script>
								    </span>
						     </div>
						</div>
				</div>
			</c:if>
			<c:if test = "${item.boardcategory eq '정보게시판' }">
				<div class = "table_div_gogo" style = "margin: 20px; margin-top:0; height: auto; width: 95%; border-radius: 10px;">
						<div style = "width: 100%; margin-bottom: 20px; border: 1px solid #e5e6eb; border-radius:10px;">
						     <div style = "width: 90%; height: auto; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; margin:10px;">
						     	<c:set var="countValue" value="${item.comment}" />
						     	<a href = "Notice_board_Free_Content_View?num=${item.num}&comment=${countValue}" style = "color: #146eb4; font-weight: bold; font-size:17px;">${item.userTitle}</a>
						     </div>
							<div style="width: 95%; color: black; height: 20px; margin-top: 5px; margin: 10px; overflow-wrap: break-word; white-space: nowrap; text-overflow: ellipsis;" class="dividv" id="contentDiv">
							  <c:set var="hasImage" value="${fn:contains(item.boardContent, '<img')}" />
							  <c:if test="${not hasImage}">
							    <c:set var="strippedContent" value="${fn:replace(item.boardContent, '<div>', ' ')}" />
							    <c:set var="strippedContentNoDiv" value="${fn:replace(strippedContent, '</div>', '')}" />
							    <c:set var="strippedContentFinal" value="${fn:replace(strippedContentNoDiv, '<br>', '')}" />
							    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" class="zvvf">
							      <c:set var="delimiter" value=" " />
							      <c:set var="tokens" value="${fn:split(strippedContentFinal, delimiter)}" />
							      <c:forEach var="token" items="${tokens}">
							        <c:choose>
							          <c:when test="${token eq search}">
							            <strong>${token}</strong>
							          </c:when>
							          <c:otherwise>
							            ${token}
							          </c:otherwise>
							        </c:choose>
							        ${delimiter}
							      </c:forEach>
							    </div>
							  </c:if>
							</div>
						     <div style = "width: 95%; margin:10px;">
						     		<span style = "color:#0abdc6;"><a href = "Notice" style = "color:#49ab81; font-size: 14px; text-decoration: none;">${item.boardcategory}</a></span> &nbsp;&nbsp;&nbsp;
						     		<span style = "color:#b3b3b3; font-size:13px;">
						     		<script>
						        	 var wtime = new Date("<c:out value="${item.wtime}" />");
						             var today = new Date();

						             if (wtime.toDateString() === today.toDateString()) {
						               var formattedTime = wtime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
						               document.write(formattedTime);
						             } else {
						               var month = String(wtime.getMonth() + 1).padStart(2, '0');
						               var date = String(wtime.getDate()).padStart(2, '0');
						               var formattedDate = month + '-' + date;
						               document.write(formattedDate);
						             }
								    </script>
								    </span>
						     </div>
						</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		</div>			
	</div>				
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script src="<c:url value='/static/js/member/side.js'/>"></script>
<script src="<c:url value='/static/js/member/index.js'/>"></script>
</body>
</html>



























































