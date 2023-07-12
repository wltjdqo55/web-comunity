<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/header_side.css">
<style>
	body{margin: 0;padding : 0; width:100vw; height: 200vh; margin-bottom: 150px;background-image: url('images/메이플 배경이미지2.jpg'); background-size: 100% 740px; background-repeat: no-repeat; background-position: 0% 100%;
background-attachment: fixed;
background-gradient: rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0) 100%;}
	
 		/*가운데 div */
 		
 		.container_box{width: 100%; border: 0; padding: 0 ;  }
 		.350img{padding-right: 30px;}
 		.center_content_top_img{width : 62vw; height: 300px; border:1px solid black;}
 		
 		.mapleInfo_mapleInven{display: flex; width : 62vw; height: 510px; border: 1px solid black;}
 		.mapleInfo{width: 32.5vw; border: 1px solid black;}
 		.mapleInven{width: 32.5vw; border: 1px solid black;}
 		.mapleInfo_ib{margin: 10px;}
 		.mapleInfo_top_menu{width: 100%; display: flex; background-color: #DDD; height: 40px; margin-top:5px; border-top : 1px solid gray; border-bottom: 1px solid gray;}
 		.mapleInfo_top_menu span{padding-right: 30px; padding-left: 30px; padding-top:10px;  border-right: none; border-left : none;}
 		.mapleInfo_top_menu a{text-decoration: none; color: black;}
 		.mapleInven_top_menu{width: 100%; display: flex; background-color: #DDD; height: 40px; margin-top:5px; border:1px solid gray; border-right: none; border-left : none;}
 		.mapleInven_ib{margin: 10px; top: 15px; }
 		.mapleInven_top_menu a{width: 50%; text-align: center;  height: 40px; margin-top: 10px; text-decoration: none; color: black;}
 		
 		.mapleFree_mapleJob{display: flex; width : 62vw; height: 510px; border: 1px solid black;}
 		.mapleFree{width: 32.5vw; border: 1px solid black;}
 		.mapleJob{width: 32.5vw; border: 1px solid black;}
 		.mapleFree_ib{margin: 10px; top: 15px; }
 		.mapleJob_ib{margin: 10px; top: 15px; }
 		.mapleFree_show{float:right; font-size:14px; color: gray; margin:5px;}
 		
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
						<a href ="#"><img src = "images/logo_renew.png" alt="header_left_Img" class = "header_left_Img" width="30px" height="30px"></a>
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
					<li class="top_menu"><a href="#">홈</a></li>
					<li class="top_menu">
						<a href="#">직업 게시판</a>
						<ul class="Maple_Job">
							<li class = "top_menu_li"><a href="#">전사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="#">마법사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="#">궁수 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="#">도적 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="#">해적 직업군 게시판</a></li>
						</ul>
					</li>
					
					<li class="top_menu">
						<a href="#">정보공유 게시판</a>
						<ul class="Infomation_Board">
							<li class = "top_menu_li"><a href="#">실시간 소식</a></li>
							<li class = "top_menu_li"><a href="#">팁과 노하우</a></li>
							<li class = "top_menu_li"><a href="#">메이플 기자 뉴스</a></li>
						</ul>
					</li>
					<li class="top_menu">
						<a href="#">커뮤니티 게시판</a>
						<ul class="submenu">
							<li class = "top_menu_li"><a href="#">자유게시판</a></li>
							<li class = "top_menu_li"><a href="#">메이플에 바란다</a></li>
							<li class = "top_menu_li"><a href="#">질문과 답변</a></li>
						</ul>
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
							<div class = "searchContent_div">
								<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
								<input type = "submit" value = "확인" class="searchContent_sub">
							</div>
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
							<h3>메이플스토리 인벤</h3>
							<p><span style = "font-weight: bold">${userInfo.userNickName}</span> 님 반갑습니다.</p>
							<div class = "joinAndfindIDPw">
								<a href = "#"><span class = "post_span" >우편함</span></a>
								<span class= "cent">|</span>
								<a href = "info.do" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "modify_span">개인정보수정</span></a>
							</div>
							
							<div style = "margin-top:20px" class = "logout_div">
								<a href = "Logout.do" class = "logout_class"><span class = "logout_span">로그아웃</span></a>
							</div>
							<br>
							<div class = "searchContent_div">
								<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
								<input type = "submit" value = "확인" class="searchContent_sub">
							</div>
						</c:when>
						
					</c:choose>
						</div>
						<div class = "job_BoardType">
						<%--직업게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">직업 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa" ><span>전사</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>마법사</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>궁수</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>도적</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>해적</span></a></div>
						<%--//직업게시판 --%>
						</div>
						<div>
						<%--메이플 핫 게시판 --%>
						<div class = "hotBoard">
							<div class = "Jobz"><span class="Jobzsp">메이플 HOT 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa" ><span class = "OKBO">자유게시판</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>&nbsp;&nbsp;☞ 오늘의 30추글</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>&nbsp;&nbsp;☞ 오늘의 10추글</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>팁과 노하우</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>실시간 소식/공지</span></a></div>
						</div>
						<%--//메이플 핫 게시판 --%>
						<div class = "info_board">
						<%-- 정보 공유 게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">정보 공유 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa" ><span>리포터 뉴스</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>실시간 소식/공지</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>&nbsp;&nbsp;☞ 메이플 버그제보</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span class = "tipOO" >팁과 노하우</span></a></div>
						<%-- //정보 공유 게시판 --%>				
						</div>
						<div class = "comunity_board">
						<%-- 커뮤니티 게시판 --%>
							<div class = "Jobz"><span class="Jobzsp">커뮤니티 게시판</span></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa" ><span style = "font-weight: bold">자유 게시판</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>메이플스토리 티어랭킹</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>리부트 게시판</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span>질문과 답변</span></a></div>
							<div class = "jobBO" id="link"><a href = "#" id = "aaa"><span class = "tipOO" >메이플에 바란다</span></a></div>
						
						<%-- //커뮤니티 게시판 --%>
						</div>
						
						</div>
				<%--//왼쪽 메뉴바 라인 --%>
				</div>
				<div class = "center_content">
					
				</div>				
			<%--//가운데 DIV --%>
			</div>
		</div>
		

<script src="script/index.js"></script>
</body>
</html>