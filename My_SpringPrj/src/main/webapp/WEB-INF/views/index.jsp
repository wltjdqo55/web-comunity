<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/static/css/member/index.css'/>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>

</head>
<body>
<%@ include file="/static/includes/header.jsp" %>
<div class = "container_wrap">
	<%@ include file="/static/includes/side.jsp" %>
	<c:set var="imgList" value="${ImgList}" />
		<div class = "center_content">
			<%--가운데 div 라인 --%>
				<c:if test="${not empty imgList}">
				<div class = "center_content_top_img">
					<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30"
								centered-slides="true" autoplay-delay="5500" autoplay-disable-on-interaction="false">
						
					 <c:forEach items="${imgList}" var="imgFile">
					    	<swiper-slide><img src = "fileFolder/${imgFile}" class="max-size-image"></swiper-slide>
					</c:forEach>
					  </swiper-container>
					
				</div>
				</c:if>
					  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
				<div class = "mapleInfo_mapleInven">
				<%-- 메이플 정보센터 & 메이플 인벤 오늘의 화제 --%>
					<div class = "mapleFree">
						<div class = "mapleFree_ib">
							<p><img src = "<c:url value='/static/images/주황버섯.jpg'/>" alt="주황버섯" width ="30" height="20"> 자유 게시판<a href = "board_Free.do" class = "mapleFree_show" style = "color:gary; text-decoration: none;">더보기+</a></p>
						</div>
						<c:forEach items="${FreeList}" var="item" begin="0" end="13">
						<div class = "list_Free_Board">
							<table style="table-layout: fixed" class = "Free_Table">
								<tr>
									<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
									<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
							        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
							        		<c:out value="${item.userTitle}" />&nbsp;
							        		<c:if test="${item.comment ne 0}">
											  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
											</c:if>
							        	</a>
				      				  </td>
								</tr>
							</table>
						</div>
						</c:forEach>
					</div>
					
					<div class = "mapleInven">
						<div class = "mapleInven_ib">
							<p><img src = "<c:url value='/static/images/주황버섯.jpg'/>" alt="주황버섯" width ="30" height="20"> 메이플 인벤 오늘의 화제</p>
						</div>
						<c:forEach items="${TodayList}" var="item" begin="0" end="13">
						<div class = "list_Free_Board">
							<table style="table-layout: fixed" class = "Free_Table">
								<tr>
									<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
									<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
							        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
							        		<c:out value="${item.userTitle}" />&nbsp;
							        		<c:if test="${item.comment ne 0}">
											  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
											</c:if>
							        	</a>
				      				  </td>
								</tr>
							</table>
						</div>
						</c:forEach>
					</div>
				<%-- 메이플 정보센터 & 메이플 인벤 오늘의 화제 --%>
				</div>
				<div class = "mapleFree_mapleJob">
				<%-- 메이플 정보센터 & 메이플 인벤 오늘의 화제 --%>
					<div class = "mapleInfo">
						<div class = "mapleInfo_ib">
							<p><img src = "<c:url value='/static/images/주황버섯.jpg'/>" alt="주황버섯" width ="30" height="20"> 메이플 정보센터</p>
							<div class = "mapleInfo_top_menu">
								<span style = "font-weight: bold; cursor: pointer;" class = "dksk1">소식/공지</span>
								<span style = "cursor: pointer;" class = "dksk2">버그제보</span>
								<span style = "cursor: pointer;" class = "dksk3">이벤트</span>
							</div>
							<div class = "list_Free_Board good1" style = "display:block;">
								<c:forEach items="${NoticeList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:22%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:75%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board good2" style = "display:none;">
								<c:forEach items="${BugList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:22%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:75%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board good3" style = "display:none;">
								<c:forEach items="${EventList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:22%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:75%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class = "mapleJob">
						<div class = "mapleJob_ib">
							<p><img src = "<c:url value='/static/images/주황버섯.jpg'/>" alt="주황버섯" width ="30" height="20"> 직업 게시판</p>
							<div class = "mapleInven_top_menu">
								<span id = "mapleJob_all">전체</span>
								<span id = "mapleJob_warrior">전사</span>
								<span id = "mapleJob_Wizard">마법사</span>
								<span id = "mapleJob_archer">궁수</span>
								<span id = "mapleJob_bandit">도적</span>
								<span id = "mapleJob_Pirate">해적</span>
							</div>
							<div class = "list_Free_Board this0" style = "display:block;">
								<c:forEach items="${AllList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board this1" style = "display:none;">
								<c:forEach items="${WarriorList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board this2" style = "display:none;">
								<c:forEach items="${WizardList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board this3" style = "display:none;">
								<c:forEach items="${ArcherList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board this4" style = "display:none;">
								<c:forEach items="${BanditList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
							<div class = "list_Free_Board this5" style = "display:none;">
								<c:forEach items="${PirateList}" var="item" begin="0" end="14">
								<table style="table-layout: fixed" class = "Free_Table">
									<tr>
										<td class = "categoryTD" style="width:15%;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
										<td class = "titleTD" style="width:85%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
								        	<a href = "Warrior_board_Free_Content_View.do?num=${item.num}&comment=${item.comment}" class = "titleA">
								        		<c:out value="${item.userTitle}" />&nbsp;
								        		<c:if test="${item.comment ne 0}">
												  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
												</c:if>
								        	</a>
					      				  </td>
									</tr>
								</table>
								</c:forEach>
							</div>
						</div>
					</div>
				<%-- 메이플 정보센터 & 메이플 인벤 오늘의 화제 --%>
				</div>										
			<%--//가운데 div 라인 --%>
		</div>				
	<%--//가운데 DIV --%>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value='/static/js/member/index.js'/>"></script>
<script src="<c:url value='/static/js/member/side.js'/>"></script>
</body>
</html>


