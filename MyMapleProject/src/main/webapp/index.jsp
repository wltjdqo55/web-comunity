<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.inven.project.DAO.MemberDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/header_side.css">
<style>
	body{margin: 0;padding : 0; width:100vw; height: auto; margin-bottom: 150px;background-image: url('images/메이플 배경이미지2.jpg'); background-size: 100% 100%; background-repeat: no-repeat; background-position: 0% 100%;
background-attachment: fixed;
background-gradient: rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0) 100%;}
	
 		/*가운데 div */
 		.container_wrap{background-color: white;}
 		.container_box{width: 100%; border: 0; padding: 0 ;  }
 		.350img{padding-right: 30px;}
 		.center_content_top_img{width : 62vw; height: 300px; }
 		.mapleInfo_mapleInven{display: flex; width : 62vw; height: 510px; }
 		.mapleInfo{width: 32.5vw; }
 		.mapleInven{width: 32.5vw; }
 		.mapleInfo_ib{margin: 10px;}
 		.mapleInfo_top_menu{width: 100%; display: flex; background-color: #DDD; height: 40px; margin-top:5px; border-top : 1px solid gray; border-bottom: 1px solid gray;}
 		.mapleInfo_top_menu span{padding-right: 30px; padding-left: 50px; padding-top:10px;  border-right: none; border-left : none;}
 		.mapleInfo_top_menu a{text-decoration: none; color: black;}
 		.mapleInven_top_menu{width: 100%; display: flex; background-color: #DDD; height: 40px; margin-top:5px; border:1px solid gray; border-right: none; border-left : none;}
 		.mapleInven_ib{margin: 10px; top: 15px; }
 		.mapleInven_top_menu a{width: 50%; text-align: center;  height: 40px; margin-top: 10px; text-decoration: none; color: black;}
 		
 		.mapleFree_mapleJob{display: flex; width : 62vw; height: 510px; }
 		.mapleFree{width: 32.5vw; }
 		.mapleJob{width: 32.5vw; }
 		.mapleFree_ib{margin: 10px; top: 15px; }
 		.mapleJob_ib{margin: 10px; top: 15px; }
 		.mapleFree_show{float:right; font-size:14px; color: gray; margin:5px; cursor: pointer;}
 		.joinAndfindIDPw{text-align: center; margin-left:10%;}
 		
 		.Free_Table{margin-left:10px; width: 94%; text-overflow: ellipsis;overflow: hidden; border-bottom: 1px solid gray;}
 		.Free_Table .categoryTD{font-weight: bold;}
 		.titleA{color: black; text-decoration: none;}
 		tr{height: 27px;}
 		.zxs{color: #ff3f3f; font-weight: bold;}
 		#mapleJob_all{font-weight: bold;}
 		.mapleInven_top_menu span{padding:6px; border-radius:10px; margin-left:24px; margin-top:3px; cursor: pointer;}
 		
 		 html,
	    body {
	      position: relative;
	    }
	
	
	    swiper-container {
	      width: 100%;
	      height:100%;
	      position: relative;
	      z-index:1;
	    }
	
	    swiper-slide {
	     position: relative;
	      text-align: center;
	      font-size: 18px;
	      background: #fff;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	       z-index:1;
	    }
	
	    swiper-slide img {
	     position: relative;
	      display: block;
	      width: 100%;
	      height: 100%;
	      object-fit: cover;
	      z-index:1;
	      
	    }
	     .max-size-image {
        max-width: 100%; /* 최대 가로 크기 설정 */
        max-height: 100%; /* 최대 세로 크기 설정 */
        width: 100%; /* 가로 크기 자동 조정 */
        height: auto; /* 세로 크기 자동 조정 */
    }
    
</style>
</head>
<body>
	<div class = "container"> 
	<%-- 전체 div --%>
		<div class = "container_header"> 
		<%-- 헤더영역 --%>
			<div class = "container_header_left">
				<h1 class = "header_left_h1">
					<span class = "header_left_span">
						<a href ="index.do"><img src = "images/logo_renew.png" alt="header_left_Img" class = "header_left_Img" width="30px" height="30px"></a>
					</span>
				</h1>
			</div>
			<div class = "container_header_right">
			</div>		
		</div>
		<%--//헤더영역 --%>
		<div class = "container_box">
		<%-- 가운데 content div --%>
			<div class = "container_top_menubar">
			<%--헤더 탑 메뉴바 --%>
				<ul class="top_menubar">
					<li class="top_menu"><a href="index.do">홈</a></li>
					<li class="top_menu">
						<a href="Warrior.do">직업 게시판</a>
						<%-- 
						<ul class="Maple_Job">
							<li class = "top_menu_li"><a href="Warrior1.do?good=1">전사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=2">마법사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=3">궁수 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=4">도적 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=5">해적 직업군 게시판</a></li>
						</ul>
						--%>
					</li>
					
					<li class="top_menu">
						<a href="Notice.do">정보공유 게시판</a>
						<%--
						<ul class="Infomation_Board">
							<li class = "top_menu_li"><a href="Notice.do">실시간 소식</a></li>
							<li class = "top_menu_li"><a href="Notice.do">팁과 노하우</a></li>
							<li class = "top_menu_li"><a href="Notice.do">메이플 기자 뉴스</a></li>
						</ul>
						--%>
					</li>
					<li class="top_menu">
						<a href="board_Free.do">커뮤니티 게시판</a>
						<%--
						<ul class="submenu">
							<li class = "top_menu_li"><a href="board_Free.do">자유게시판</a></li>
							<li class = "top_menu_li"><a href="board_Free.do">메이플에 바란다</a></li>
							<li class = "top_menu_li"><a href="board_Free.do">질문과 답변</a></li>
						</ul>
						--%>
					</li>
					<li class="top_menu">
						<a href="#">추천 사냥터</a>
					</li>
				</ul>
			</div>
		</div>
			<%--//헤더 탑 메뉴바 --%>
			<div class = "container_wrap">
			<%--가운데 DIV --%>
				<div class = "container_left_wrap">
				<%--왼쪽 메뉴바 라인 --%>
						
						<div class = "left_login_div">
						<c:choose>
						<%--로그인검색창 --%>
							<c:when test = "${userInfo eq null }">
							<h3>메이플스토리 인벤</h3>
							<p>로그인하세요!</p>
							<span class = "loginspan" id = "showModel">INVEN 로그인</span>
							<div class = "joinAndfindIDPw">
								<a href = "join.do"><span class = "join_span" >회원가입</span></a>
								<span class= "cent">|</span>
								<a href = "idpasswordFind.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "find_span">ID/PW찾기</span></a>
							</div>
							<form action = "IntegratedSearch.do" method = "post">
								<div class = "searchContent_div">
									<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
									<input type = "submit" value = "확인" class="searchContent_sub">
								</div>
							</form>
						<%--//로그인검색창 --%>
						<!-- 모달창(회원탈퇴) -->
						<div class="modalPage">
						<div class="close" onclick = "hideModal()"></div>
						<form action = "login.do" method="post" autocomplete="off" id = "myLoginform">
						<%-- form태그 --%>
							<div class="cont">
								<p class="txt">
									<span class="accent">INVEN 로그인</span>
								</p>
								<div class="border-boxbox_withdrawal">
						            <div class="inner">
						                <div class = "present">
											<div style = "padding:10px;" id = "present_id">
												<input type = "text"  class = "id_pre" name = "userID" id = "userId" placeholder="아이디">
											</div>
											<div style = "padding:10px;" id = "present_password">
												<input type = "password"  class = "password_pre" name = "userPassword" id = "userPassword" placeholder="비밀번호">
											</div>
										</div>
						            </div>
						            <div id = "border-boxbox_withdrawal_p">
						            	<div id = "border-boxbox_withdrawal_p_div1"><span class = "love">로그인 정보가 일치하지 않습니다.</span></div>
						            	<div id = "border-boxbox_withdrawal_p_div2"><span id = "spanClose">⨉</span></div>
						    
						            </div>
						        </div> 
							</div>
							<div class="btns">
								<!-- 버튼이 1개일경우 class="col1" 추가 -->
								<input type="submit" class="login_Sub" value="로그인" id = "login_form">
								<button class = "goto_Join" id = "goto_Join" onclick="location.href='join.do'; return false;">회원가입</button>
							</div>
						<%-- //form태그 --%>
						</form>
						</div>
						<!-- //모달창(회원탈퇴) -->
						</c:when>
						<c:when test = "${userInfo ne null }">
						<c:choose>
							<c:when test="${userInfo.role eq 'admin' or userInfo.role eq 'super'}">
								<h3>메이플스토리 인벤</h3>
								<p><span style = "font-weight: bold">${userInfo.userNickName}</span> 관리자님</p>
								<div class = "joinAndfindIDPw">
									<a href = "note.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "post_span" >우편함</span></a>
									<span class= "cent">|</span>
									<a href = "info.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "modify_span">개인정보수정</span></a>
								</div>
								
								<div style = "margin-top:20px" class = "logout_div">
									<a href = "Admin.do" style = "color: blue; text-decoration: none;" style = "width: 50%;"><span style = "text-decoration: none; color: blue; background-color: #DDD; padding: 5px; border-radius: 10px; margin-top:10px;">회원관리</span></a>
									<a href = "Logout.do" class = "logout_class" style = "width: 50%;"><span class = "logout_span">로그아웃</span></a>
								</div>
								<br>
								<form action = "IntegratedSearch.do" method = "post">
								<div class = "searchContent_div">
									<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
									<input type = "submit" value = "확인" class="searchContent_sub">
								</div>
							</form>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${userInfo.role ne 'admin' and userInfo.role ne 'super'}">
								<h3>메이플스토리 인벤</h3>
								<p><span style = "font-weight: bold">${userInfo.userNickName}</span> 님 반갑습니다.</p>
								<div class = "joinAndfindIDPw">
									<a href = "note.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "post_span" >우편함</span></a>
									<span class= "cent">|</span>
									<a href = "info.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "modify_span">개인정보수정</span></a>
								</div>
								
								<div style = "margin-top:20px" class = "logout_div">
									<a href = "Logout.do" class = "logout_class"><span class = "logout_span">로그아웃</span></a>
								</div>
								<br>
								<form action = "IntegratedSearch.do" method = "post">
								<div class = "searchContent_div">
									<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
									<input type = "submit" value = "확인" class="searchContent_sub">
								</div>
							</form>
							</c:when>
						</c:choose>
						</c:when>
						
					</c:choose>
						</div>
						<div class = "job_BoardType">
						<%--직업게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">직업 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "Warrior1.do?good=1" id = "aaa" ><span>전사</span></a></div>
							<div class = "jobBO" id="link"><a href = "Warrior1.do?good=2" id = "aaa"><span>마법사</span></a></div>
							<div class = "jobBO" id="link"><a href = "Warrior1.do?good=3" id = "aaa"><span>궁수</span></a></div>
							<div class = "jobBO" id="link"><a href = "Warrior1.do?good=4" id = "aaa"><span>도적</span></a></div>
							<div class = "jobBO" id="link"><a href = "Warrior1.do?good=5" id = "aaa"><span>해적</span></a></div>
						<%--//직업게시판 --%>
						</div>
						<div>
						<%--메이플 핫 게시판 --%>
						<div class = "hotBoard">
							<div class = "Jobz"><span class="Jobzsp">메이플 HOT 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "board_Free.do" id = "aaa" ><span class = "OKBO">자유게시판</span></a></div>
							<div class = "jobBO" id="link"><a href = "onetwo_Board.do?good=30" id = "aaa"><span>&nbsp;&nbsp;☞ 오늘의 30추글</span></a></div>
							<div class = "jobBO" id="link"><a href = "onetwo_Board.do?good=10" id = "aaa"><span>&nbsp;&nbsp;☞ 오늘의 10추글</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span>팁과 노하우</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span>실시간 소식/공지</span></a></div>
						</div>
						<%--//메이플 핫 게시판 --%>
						<div class = "info_board">
						<%-- 정보 공유 게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">정보 공유 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa" ><span>리포터 뉴스</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span>실시간 소식/공지</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice1.do?good=5" id = "aaa"><span>&nbsp;&nbsp;☞ 메이플 버그제보</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span class = "tipOO" >팁과 노하우</span></a></div>
						<%-- //정보 공유 게시판 --%>				
						</div>
						<div class = "comunity_board">
						<%-- 커뮤니티 게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">커뮤니티 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "board_Free.do" id = "aaa" ><span style = "font-weight: bold">자유 게시판</span></a></div>
							<div class = "jobBO" id="link"><a href = "Warrior.do" id = "aaa"><span>메이플스토리 티어랭킹</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice1.do?good=3" id = "aaa"><span>점검</span></a></div>
							<div class = "jobBO" id="link"><a href = "QNA.do?userNickName=${sessionScope.userInfo.userNickName}" id = "aaa"><span>고객센터</span></a></div>
							<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span class = "tipOO" >메이플에 바란다</span></a></div>
						
						<%-- //커뮤니티 게시판 --%>
						</div>
						</div>
				<%--//왼쪽 메뉴바 라인 --%>
				</div>
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
									<p><img src = "images/주황버섯.jpg" alt="주황버섯" width ="30" height="20"> 자유 게시판<a href = "board_Free.do" class = "mapleFree_show" style = "color:gary; text-decoration: none;">더보기+</a></p>
								</div>
								<c:forEach items="${Freelist}" var="item" begin="0" end="13">
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
									<p><img src = "images/주황버섯.jpg" alt="주황버섯" width ="30" height="20"> 메이플 인벤 오늘의 화제</p>
								</div>
								<c:forEach items="${goodlist}" var="item" begin="0" end="13">
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
									<p><img src = "images/주황버섯.jpg" alt="주황버섯" width ="30" height="20"> 메이플 정보센터</p>
									<div class = "mapleInfo_top_menu">
										<span style = "font-weight: bold; cursor: pointer;" class = "dksk1">소식/공지</span>
										<span style = "cursor: pointer;" class = "dksk2">버그제보</span>
										<span style = "cursor: pointer;" class = "dksk3">이벤트</span>
									</div>
									<div class = "list_Free_Board good1" style = "display:block;">
										<c:forEach items="${NoticeList1}" var="item" begin="0" end="14">
										<table style="table-layout: fixed" class = "Free_Table">
											<tr>
												<td class = "categoryTD" style="width:25%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${item.category}</td>
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
										<c:forEach items="${NoticeList2}" var="item" begin="0" end="14">
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
										</c:forEach>
									</div>
									<div class = "list_Free_Board good3" style = "display:none;">
										<c:forEach items="${NoticeList3}" var="item" begin="0" end="14">
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
										</c:forEach>
									</div>
								</div>
							</div>
							<div class = "mapleJob">
								<div class = "mapleJob_ib">
									<p><img src = "images/주황버섯.jpg" alt="주황버섯" width ="30" height="20"> 직업 게시판</p>
									<div class = "mapleInven_top_menu">
										<span id = "mapleJob_all">전체</span>
										<span id = "mapleJob_warrior">전사</span>
										<span id = "mapleJob_Wizard">마법사</span>
										<span id = "mapleJob_archer">궁수</span>
										<span id = "mapleJob_bandit">도적</span>
										<span id = "mapleJob_Pirate">해적</span>
									</div>
									<div class = "list_Free_Board this0" style = "display:block;">
										<c:forEach items="${Warriorlist}" var="item" begin="0" end="14">
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
										<c:forEach items="${list1}" var="item" begin="0" end="14">
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
										<c:forEach items="${list2}" var="item" begin="0" end="14">
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
										<c:forEach items="${list3}" var="item" begin="0" end="14">
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
										<c:forEach items="${list4}" var="item" begin="0" end="14">
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
										<c:forEach items="${list5}" var="item" begin="0" end="14">
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
		</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script>
var dksk1 = document.querySelector(".dksk1");
var dksk2 = document.querySelector(".dksk2");
var dksk3 = document.querySelector(".dksk3");
var good1 = document.querySelector(".good1");
var good2 = document.querySelector(".good2");
var good3 = document.querySelector(".good3");

dksk1.addEventListener("click", function(){
	dksk1.style.fontWeight = "bold";
	dksk2.style.fontWeight = "normal";
	dksk3.style.fontWeight = "normal";
	good1.style.display = "block";
	good2.style.display = "none";
	good3.style.display = "none";
	
});
dksk2.addEventListener("click", function(){
	dksk1.style.fontWeight = "normal";
	dksk2.style.fontWeight = "bold";
	dksk3.style.fontWeight = "normal";
	good1.style.display = "none";
	good2.style.display = "block";
	good3.style.display = "none";
	
});
dksk3.addEventListener("click", function(){
	dksk1.style.fontWeight = "normal";
	dksk2.style.fontWeight = "normal";
	dksk3.style.fontWeight = "bold";
	good1.style.display = "none";
	good2.style.display = "none";
	good3.style.display = "block";
	
});






var mapleJob_all = document.querySelector("#mapleJob_all");
var mapleJob_warrior = document.querySelector("#mapleJob_warrior");
var mapleJob_Wizard = document.querySelector("#mapleJob_Wizard");
var mapleJob_archer = document.querySelector("#mapleJob_archer");
var mapleJob_bandit = document.querySelector("#mapleJob_bandit");
var mapleJob_Pirate = document.querySelector("#mapleJob_Pirate");

var this0 = document.querySelector(".this0");
var this1 = document.querySelector(".this1");
var this2 = document.querySelector(".this2");
var this3 = document.querySelector(".this3");
var this4 = document.querySelector(".this4");
var this5 = document.querySelector(".this5");

mapleJob_all.addEventListener("click", function(){
	this0.style.display = "block";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight = "bold";
	mapleJob_warrior.style.fontWeight = "normal";
	mapleJob_Wizard.style.fontWeight = "normal";
	mapleJob_archer.style.fontWeight = "normal";
	mapleJob_bandit.style.fontWeight = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_warrior.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "block";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "bold";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_Wizard.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "block";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "bold";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_archer.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "block";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "bold";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_bandit.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "block";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "bold";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_Pirate.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "block";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "bold";
	
});











const error = '${pageContext.request.getAttribute("error")}';
if(error == '아이디 또는 비밀번호가 올바르지 않습니다.'){
	document.querySelector(".modalPage").style.display = "block";
	document.querySelector(".present").style.border = "1px solid red";
	document.querySelector(".border-boxbox_withdrawal").style.height = "200px";
	document.querySelector("#border-boxbox_withdrawal_p").style.display = "block";
	document.querySelector("#border-boxbox_withdrawal_p").style.display = "flex";
	document.querySelector("#userId").focus();
	
}
const sugo = '${pageContext.request.getAttribute("sugo")}';
if(sugo == '성공'){
	window.sessionStorage.clear();
	window.close();
}
const closeY = document.querySelector(".close");
closeY.addEventListener("click", function(){
	document.querySelector(".border-boxbox_withdrawal").style.height = "";
	document.querySelector(".present").style.border = "#DDD";
	document.querySelector("#border-boxbox_withdrawal_p").style.display = "none";
});

const spanClose = document.querySelector("#spanClose");
spanClose.addEventListener("click", function(){
	document.querySelector("#border-boxbox_withdrawal_p").style.display = "none";
	document.querySelector(".border-boxbox_withdrawal").style.height = "";
	document.querySelector(".present").style.border = "none";
	document.querySelector("#userId").focus();
});
const mapleFree_show = document.querySelector(".mapleFree_show")
mapleFree_show.addEventListener("click", function(){
	window.location.href = "board_Free.do";
});
window.addEventListener("DOMContentLoaded", function() {
	$.ajax({
        url: "updategogo.do",
        type: "POST",
        data: { "gogo": 1 },
        dataType: "text",
        success: function(result) {
        },
        error: function() {
        }
    });
});
</script>
<script src="script/index.js"></script>
</body>
</html>



























































