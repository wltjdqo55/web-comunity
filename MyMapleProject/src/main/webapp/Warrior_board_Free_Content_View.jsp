<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.inven.project.DAO.MemberDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/header_side.css">
<style>
	body{margin: 0;padding : 0; width:100vw; height: 200vh; margin-bottom: 150px;background-image: url('images/메이플 배경이미지2.jpg'); background-size: 100% 100%; background-repeat: no-repeat; background-position: 0% 100%;
background-attachment: fixed;
background-gradient: rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0) 100%;}
	
 		/*가운데 div */
 		.container_wrap{background-color: white;display: flex; width:80vw; border: 0; padding: 0 ; margin:0 ;margin-bottom: 150px;margin-left: 10%; height: auto;}
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
 		.joinAndfindIDPw{text-align: center; margin-left:10%;}
 		
 			
 		.center_content{width: 62vw; height: auto;}
 		.center_content_good{width:62vw; height: 50px;}
 		.center_content_good a{text-decoration: none; color: gray; padding: 15px;}
 		.center_content .center_content_good span{float : right; color: gray; padding: 15px;}
 		.center_title{ margin: 10px; width: 60.5vw; height: 50px; background-color: #DDD; display: flex;}
 		.center_title span{margin-top : 12px;}
 		.NickName_title{width: 12vw; float: left;}
		.NickName_title>span{position: absolute; margin-top: 12px; margin-left: 10px; padding: 3px;}
 		.wtime_title{width: 35vw;}
 		.wtime_title>span{position: absolute; margin-top: 12px; margin-left:12%;}
 		.right_title{width: 15vw; }
 		.right_title>span{position: absolute; margin-top: 12px; margin-left: 5%;}
 		
 		.center_ccc{width: 60.5vw; margin: 10px; height: 50px;}
 		.center_ccc_ccc{padding: 10px; margin-top: 20px; margin-left:20px;}
 		.center_big{width: 55.5vw; margin: 30px; height: 70px; text-align: left;}
 		.center_big_span{font-weight: bold; font-size: 26px; color : #c68642;}
 		
 		.center_content_div{ width:55vw; margin: 10px; margin-top: 10px; text-align: left; margin-left: 30px; line-height: 1.8; margin-bottom:100px;}
 		.center_content_recomand{width:60.5vw; height: 60px; margin: 10px; display: flex;}
 		.good_recomand{width:6vw; height: 50px; border: 1px solid #DDD; margin-left: 38%; font-size: 20px; color: #d9534f; border-radius: 6px; cursor: pointer;}
 		.fuck_recomand{width:6vw; height: 50px; border: 1px solid #DDD; margin-left: 10px; font-size: 20px; color : #428bca; border-radius: 6px; cursor: pointer;}
 		.good_recomand span{position: absolute; margin-top:12.5px; margin-left: 20px;}
 		.fuck_recomand span{position: absolute; margin-top:12.5px; margin-left: 20px;}
 		
 		.listandgo{width: 60.5vw; margin: 10px; height: 50px;margin-left: 30px;}
 		.listandgo span a{text-decoration: none; color : gray;}
 		
 		.command_user{width: 60.5vw; height: auto; margin: 10px;}
 		.command_user_title{display: flex; height: 40px;}
 		.command_user_title_left{width:30vw; text-align: left;font-size: 13px; color: gray;}
 		.command_user_title_right{width:30vw; text-align:right;font-size: 13px; color: gray;}
 		.command_user_title_left span{margin-top: 10px; }
 		.command_user_title_right span{margin-top: 10px;}
 		.ddd{font-size: 16px; color : black;}
 		
 		.userCo{width:60.5vw; height: auto; border-top: 1px solid #DDD; border-bottom: 1px solid #DDD;}
 		.userKN{display:flex; height: 40px;}
 		.userKN_left{width:30vw;  text-align: left; margin-left: 15px;} 
 		.userKN_right{width:30vw;  text-align: right; margin-right: 15px;}
 		.userKN_right span{width:24px; height:14px; border: 1px solid gray; border-radius: 5px; padding:2px; cursor: pointer;}
 		.Dfds{margin-top: 8px; margin-bottom: 8px;}
 		.Dfdsd{margin-top: 10px; margin-bottom: 4px;}
 		
 		.Rre_Co{text-align: right; color: gray; font-size: 14px; margin-right: 15px;}
 		
 		.dfjfj{width:59.5vw; text-align:right;font-size: 13px; color: gray; margin: 10px; }
 		.dfjtj>span{margin-top: 10px; margin-right: 35px;}
 		
 		.conta_b{width: 59.5vw; margin: 10px; background-color: #e3e4e6; height: auto; display:block;}
 		.conta_bb{display: flex;}
 		.conta_bb .user_Content{width: 52vw; height: 60px; margin:15px; border: 1px solid gray; }
 		.conta_bb .sub_r{width:6vw; height: 60px; margin: 15px; border-radius : 5px; font-weight: bold; margin-left:5px; border: 1px solid gray; cursor: pointer;}
 		::placeholder{margin: 5px; padding: 5px;}
 		
 		.ckckck{width: 59.5vw; margin: 10px; height: 50px; display: flex; margin-top: 30px;}
 		.ckckck_left{width: 29.7vw;}
 		.ckckck_left span{border:1px solid gray; padding : 5px 10px 5px 10px; border-radius: 4px;}
 		.ckckck_left span a{color: gray; text-decoration: none; font-size: 14px;}
 		.ckckck_right{width: 29.7vw; text-align: right;}
 		.ckckck_right span{border:1px solid gray; padding : 5px 10px 5px 10px; border-radius: 4px; background-color: black; color:white; cursor: pointer; font-size: 14px;}
 		
 		.usergk{padding: 5px 2px 5px 2px; background-color:#7fcdff; color: white; font-size: 9px; font-weight: bold; border:none; border-radius: 11px; }
 		
 		.replydelete{float: right; color: gray;}
 		.replydelete a{text-decoration: none; color: gray; font-size: 15px;}
 		
 		.sarogochim, .sarogochim1{font-weight: bold; cursor: pointer;}
 		.dabgle{font-weight: bold; cursor: pointer;}
 		.ddddddd{display:flex;}
 		.leftin{width: 60px; font-size: 24px; }
 		.leftin span{padding-top: 30px; padding-left: 10px;}
 	
 		
 		.Dfdsfff{display: flex;}
 		.userKNN{display:flex; height: 30px;}
 		.userKNN_left{width:25vw;  text-align: left; margin-left: 15px;} 
 		.userKNN_right{width:30vw;  text-align: right; margin-right: 15px;}
 		.userKNN_right span{width:24px; height:14px; border: 1px solid gray; border-radius: 5px; padding:2px; cursor: pointer;}
 		.input_Co{width: 46vw; margin-left: 15px;height: auto;}
 		.input_Co span{ display: block;overflow-wrap: break-word;word-wrap: break-word;}
 		.userCoc{width:57.5vw; height: auto; border-top: 1px solid #DDD; border-bottom: 1px solid gray; background-color: #dfe3ee; }
 		.conta_a{width: 59.5vw; margin: 10px; background-color: #e3e4e6; height: auto;}
 		
 		.max-image{}
 		.center_content_recomand a{text-decoration: none; color: black;}
 		.good_recomand a{color : #d9534f;}
 		.fuck_recomand a{color : #428bca;}
 		.zkzk{text-align:center;max-width: 900px;max-height: 900px;width: auto;height: auto;}
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
						<ul class="Maple_Job">
							<li class = "top_menu_li"><a href="Warrior1.do?good=1">전사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=2">마법사 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=3">궁수 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=4">도적 직업군 게시판</a></li>
							<li class = "top_menu_li"><a href="Warrior1.do?good=5">해적 직업군 게시판</a></li>
						</ul>
					</li>
					
					<li class="top_menu">
						<a href="Notice.do">정보공유 게시판</a>
						<ul class="Infomation_Board">
							<li class = "top_menu_li"><a href="Notice.do">실시간 소식</a></li>
							<li class = "top_menu_li"><a href="Notice.do">팁과 노하우</a></li>
							<li class = "top_menu_li"><a href="Notice.do">메이플 기자 뉴스</a></li>
						</ul>
					</li>
					<li class="top_menu">
						<a href="board_Free.do">커뮤니티 게시판</a>
						<ul class="submenu">
							<li class = "top_menu_li"><a href="board_Free.do">자유게시판</a></li>
							<li class = "top_menu_li"><a href="board_Free.do">메이플에 바란다</a></li>
							<li class = "top_menu_li"><a href="board_Free.do">질문과 답변</a></li>
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
				<%--가운데 내용 --%>
				
				<div class = "center_content">
					<div class = "center_content_good">
						<span><a href = "Warrior.do">메이플스토리 인벤 직업게시판</a></span>
					</div>
					<c:forEach items="${list}" var="item">
					<div class = "center_title">
						<div class = "NickName_title"><span><c:out value="${item.userNickName}" /></span></div>
						<div class = "wtime_title"><span><c:out value="${item.wtime}" /></span></div>
						<div class = "right_title"><span>조회: <c:out value="${item.hit}" /> &nbsp;&nbsp;&nbsp;추천: <c:out value="${item.recommend}" /></span></div>
					</div>
					<div class = "center_ccc">
						<div class = "center_ccc_ccc" ><span>[<c:out value="${item.category}" />]</span>
						
						<c:if test="${sessionScope.userInfo.userNickName eq item.userNickName}">
							<span class = "replydelete"><a href = "Warrior_board_free_writeOK.do?num=${item.num}">수정</a>&nbsp; | &nbsp;<a href = "Warrior_board_free_delete.do?num=${item.num }" class = "deleteGOTO">삭제</a>&nbsp; | &nbsp;<a href = "Warrior.do">목록</a>&nbsp; | &nbsp;<a href = "#">댓글(${item.comment })</a></span>
						</c:if>
						<c:if test="${sessionScope.userInfo.userNickName ne item.userNickName}">
							<span class = "replydelete"><a href = "Warrior.do">목록</a>&nbsp; | &nbsp;<a href = "#">댓글(${item.comment})</a></span>
							<c:if test = "${not empty sessionScope.userInfo.userNickName}">
							<a href = "Report.do?title=${item.userTitle}&replyNickName=${item.userNickName}&userNickName=${sessionScope.userInfo.userNickName}" style = "float:right;text-decoration: none; color:black; cursor: pointer; margin-right:12px; color: gray;" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">신고&nbsp;&nbsp;|</a>
							</c:if>	
						</c:if>
						
						</div>
						<input type = "hidden" id = "BNum" value = "${item.num }">
					</div>
					<div class = "center_big">
						<span class = "center_big_span"><c:out value="${item.userTitle}" /></span>
					</div>
					<div class = "center_content_div">
					<div style = "margin-top: 130px;margin-bottom:130px;">
							${item.boardContent}
						</div>
					
					</div>
					<div class = "center_content_recomand">
						<%--로그인 되었을때 실행 --%>
						<c:if test = "${not empty sessionScope.userInfo.userNickName}">
							<div class = "good_recomand">
								<a href="Warrior_FreeBoard_recommend.do?bnum=${item.num}&commend=1&userNickName=${sessionScope.userInfo.userNickName}&comment=${item.comment}"
								   onclick="return confirm('추천하시겠습니까?');">
								  <span class = "recommend">👍<c:out value="${item.recommend}" /></span>
								</a>
							</div>
							<div class = "fuck_recomand">
								<a href="Warrior_FreeBoard_recommend.do?bnum=${item.num}&commend=0&userNickName=${sessionScope.userInfo.userNickName}&comment=${item.comment}"
								   onclick="return confirm('비추천하시겠습니까?');">
								  <span class="fuckrecommend">👎<c:out value="${item.fuckrecommend}" /></span>
								</a>
							</div>
						</c:if>
						<%--로그인 되지 않았을때 alert창 --%>
						<c:if test = "${empty sessionScope.userInfo.userNickName}">
							<div class = "good_recomand">
								<span class = "recommend recommendT">👍<c:out value="${item.recommend}" /></span>
							</div>
							<div class = "fuck_recomand">
								<span class = "fuckrecommend fuckrecommendT">👎<c:out value="${item.fuckrecommend}" /></span> <%-- 비추 sql도 만들어야 함 --%>
							</div>
						</c:if>
					</div>
					
					<div class = "listandgo">
					 	<span><a href = "Warrior.do">목록</a>&nbsp; | &nbsp;<a href = "#">댓글(${item.comment})</a></span>
					</div>
					<div class = "command_user">
						<div class = "command_user_title">
							<div class = "command_user_title_left">
								<span class = "ddd" style = "font-weight: bold">💬 댓글(${item.comment})</span>&nbsp;&nbsp;&nbsp;<span>등록순&nbsp;&nbsp;|&nbsp;&nbsp;최신순</span>
							</div>
							<div class = "command_user_title_right">
								<span class = "sarogochim1">새로고침</span>
							</div>
						</div>
						<c:forEach items="${replylist}" var="replylist">
						
						<c:if test="${replylist.stepNum != 0}">
						<div class = "ddddddd">
						<div class = "leftin"><span>↪</span></div>
						<div class = "userCoc">
							<div class = "Dfds">
								
								<div class = "Dfdsfff">
										<%-- --%>
										<div class = "userKNN">
											<c:if test="${replylist.replyNickName eq item.userNickName}">
												<div class = "userKNN_left">
												<span style="font-weight: bold;">
													<c:out value="${replylist.replyNickName}" />&nbsp;<span class = "usergk">작성자</span>
												</span>&nbsp;
												<span style = "font-size:13px;">
													(<c:out value="${replylist.wtime}" />)
												</span>
												<span style = "font-size:13px;">
													<c:if test = "${sessionScope.userInfo.userNickName eq replylist.replyNickName}">
													<a href="#" onclick = "WarriordeleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
													</c:if>		
													<c:if test = "${sessionScope.userInfo.userNickName ne replylist.replyNickName}">
													<c:if test = "${not empty sessionScope.userInfo.userNickName}">
											<a href = "Report.do?title=${replylist.replytext}&replyNickName=${replylist.replyNickName}&userNickName=${sessionScope.userInfo.userNickName}" style = "text-decoration: none; color:black; cursor: pointer; font-weight: bold;" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">신고</a>
											</c:if>	
											</c:if>										
												</span>
												</div>
											</c:if>
											<c:if test="${replylist.replyNickName ne item.userNickName}">
												<div class = "userKNN_left">
												<span style="font-weight: bold;">
													<c:out value="${replylist.replyNickName}" />
												</span>&nbsp;
												<span style = "font-size:13px;">
													(<c:out value="${replylist.wtime}" />)
												</span>
												<span style = "font-size:13px;">
													<c:if test = "${sessionScope.userInfo.userNickName eq replylist.replyNickName}">
													<a href="#" onclick = "WarriordeleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
													</c:if>	
													<c:if test = "${sessionScope.userInfo.userNickName ne replylist.replyNickName}">
													<c:if test = "${not empty sessionScope.userInfo.userNickName}">
											<a href = "Report.do?title=${replylist.replytext}&replyNickName=${replylist.replyNickName}&userNickName=${sessionScope.userInfo.userNickName}" style = "text-decoration: none; color:black; cursor: pointer; font-weight: bold;" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">신고</a>
											</c:if>	
												</c:if>											
												</span>
												</div>
											</c:if>
				
										</div>
								</div>
									<div class = "input_Co">
										<span><c:out value="${replylist.replytext}" /></span>
									</div>
							</div>
								
						</div>
						</div>
							<div class = "dabgle_div">
								
								<input type = "hidden" value = "<c:out value="${replylist.stepNum}" />" name = "stepNum">
								<input type = "hidden" value = "<c:out value="${replylist.groupNum}" />" name = "groupNum">
							</div>
						</c:if>
						
						<%---ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>
						
						<c:if test="${replylist.stepNum == 0}">
						<div class = "userCo">
							<div class = "Dfdsd">
								<div class = "userKN">
									<c:if test="${replylist.replyNickName eq item.userNickName}">
										<div class = "userKN_left">
										<span style="font-weight: bold;">
											<c:out value="${replylist.replyNickName}" />&nbsp;<span class = "usergk">작성자</span>
										</span>&nbsp;
										<span style = "font-size:13px;">
											(<c:out value="${replylist.wtime}" />)
										</span>
										<span style = "font-size:13px;">
											<c:if test = "${sessionScope.userInfo.userNickName eq replylist.replyNickName}">
											<a href="#" onclick = "WarriordeleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
											</c:if>	
											<c:if test = "${sessionScope.userInfo.userNickName ne replylist.replyNickName}">
												<c:if test = "${not empty sessionScope.userInfo.userNickName}">
											<a href = "Report.do?title=${replylist.replytext}&replyNickName=${replylist.replyNickName}&userNickName=${sessionScope.userInfo.userNickName}" style = "text-decoration: none; color:black; cursor: pointer; font-weight: bold;" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">신고</a>
											</c:if>	
											</c:if>												
										</span>
										</div>
									</c:if>
									<c:if test="${replylist.replyNickName ne item.userNickName}">
										<div class = "userKN_left">
										<span style="font-weight: bold;">
											<c:out value="${replylist.replyNickName}" />
										</span>&nbsp;
										<span style = "font-size:13px;">
											(<c:out value="${replylist.wtime}" />)
										</span>
										<span style = "font-size:13px;">
											<c:if test = "${sessionScope.userInfo.userNickName eq replylist.replyNickName}">
											<a href="#" onclick = "WarriordeleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
											</c:if>		
										<c:if test = "${sessionScope.userInfo.userNickName ne replylist.replyNickName}">
											<c:if test = "${not empty sessionScope.userInfo.userNickName}">
											<a href = "Report.do?title=${replylist.replytext}&replyNickName=${replylist.replyNickName}&userNickName=${sessionScope.userInfo.userNickName}" style = "text-decoration: none; color:black; cursor: pointer; font-weight: bold;" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">신고</a>
											</c:if>	
										</c:if>									
										</span>
										</div>
									</c:if>
								
								</div>
								<div class = "input_Co">
									<span><c:out value="${replylist.replytext}" /></span>
								</div>
								<div class = "Rre_Co">
									<span class = "dabgle">답글</span>
									
								</div>
							</div>
							<div class = "conta_b" style = "display: none;">
								<c:if test="${not empty requestScope.replylist}">
									<div class = "conta_bb">
										<c:if test = "${empty sessionScope.userInfo}">
											<textarea class = "user_Content emptyComment" name = "userContent" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유표 등의 글을 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다."></textarea>
											<input type = "button" value = "등록" class = "sub_r sub_r_false">
										</c:if>
								<c:if test = "${not empty sessionScope.userInfo}">
									<textarea class = "user_Content user_Content_good" name = "userContent" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유표 등의 글을 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다."></textarea>
									<input type = "button" value = "등록" class = "sub_r dfdfda" onclick = "btn_good('${sessionScope.userInfo.userId}', '${sessionScope.userInfo.userNickName }', '${sessionScope.userInfo.userPassword }', '${sessionScope.userInfo.userName }',${item.num }, ${item.comment }, ${replylist.groupNum }, ${replylist.stepNum })">
								</c:if>
										</div>
									</c:if>
								</div>
							
						</div>
						</c:if>
						
						<%-- 유동적으로 댓글 누르면 이동하는 div --%>
						
						</c:forEach>	
						<%-- 하단 고정 댓글 --%>
						<div class = "conta_a">
								<div class = "conta_bb">
									<c:if test = "${empty sessionScope.userInfo}">
										<textarea class = "user_Content emptyContent" name = "userContent" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유표 등의 글을 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다."></textarea>
										<input type = "button" value = "등록" class = "sub_r sub_r_false">
									</c:if>
									<c:if test = "${not empty sessionScope.userInfo}">
										<textarea class = "user_Content_not user_Content" name = "userContent" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유표 등의 글을 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다."></textarea>
										<input type = "button" value = "등록" class = "sub_r" onclick = "btn_notEmpty('${sessionScope.userInfo.userId}', '${sessionScope.userInfo.userNickName }', '${sessionScope.userInfo.userPassword }', '${sessionScope.userInfo.userName }',${item.num }, ${item.comment })">
									</c:if>
								</div>
						</div>
						<div class = "ckckck">
							<div class = "ckckck_left">
								<span><a href = "Warrior.do">목록</a></span>
								<span><a href = "Warrior_NextPred_board_Free_Content_View.do?num=${item.num}&next=1&comment=${item.comment}">다음글</a></span>
								<span><a href = "Warrior_NextPred_board_Free_Content_View.do?num=${item.num}&next=0&comment=${item.comment}">이전글</a></span>
							</div>
							<div class = "ckckck_right">
								<c:if test = "${userInfo ne null }">
									<a href = "Warrior_board_free_write.do" onclick="checkUserPower(event)"><span class = "board_free_write">글쓰기</span></a>
								</c:if>
								<c:if test = "${userInfo eq null }">
									<span class = "board_free_write" id = "board_free_write_no">글쓰기</span>
								</c:if>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>	
						
			<%--//가운데 DIV --%>
			</div>
		</div>
<%-- 
<script src = "script/board_Free_Content_View.js"></script>
--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "script/board_Free_Content_View.js"></script>
<script>
const dabgle = document.querySelectorAll(".dabgle");
const contaBElements = document.querySelectorAll(".conta_b");

dabgle.forEach(function(element, index) {
  element.addEventListener("click", function() {
    // 기존에 보이는 답글 숨기기
    contaBElements.forEach(function(contaBElement) {
      contaBElement.style.display = "none";
    });

    // 선택한 답글 보이기
    const targetContaB = contaBElements[index];
    targetContaB.style.display = "block";
  });
});


var modalPage = document.querySelector(".modalPage");
	var showModel = document.querySelector("#showModel");
	
	showModel.addEventListener("click", function(){
		   modalPage.style.display = "block";
	});

	function hideModal() {
		document.querySelector(".modalPage").style.display = "none";
	}


function btn_notEmpty(userId, userNickName, userPassword, userName, num, comment) {
    var userContent = document.querySelector(".user_Content_not");
    $.ajax({
        url: "Warrior_board_Free_ReCommand.do",
        type: "POST",
        data: {
            "userId": userId,
            "userNickName": userNickName,
            "userPassword": userPassword,
            "userName": userName,
            "num": num,
            "comment": comment,
            "userContent": userContent.value
        },
        dataType: 'text',
        success: function(result) { 
            if (result == 0) {
                location.reload();
            }
        },
        error: function() {
            alert("서버 요청 실패"); 
        }
    });
}

function btn_good(userId, userNickName, userPassword, userName, num, comment, groupNum, stepNum) {
	
		const btn = event.target; // 클릭된 버튼 요소
	  	const parentDiv = btn.parentNode; // 버튼의 부모 요소

	  const userContentGood = parentDiv.querySelector(".user_Content_good").value;
	  const data = {
	    "userId": userId,
	    "userNickName": userNickName,
	    "userPassword": userPassword,
	    "userName": userName,
	    "num": num,
	    "comment": comment,
	    "userContent": userContentGood,
	    "stepNum": stepNum,
	    "groupNum": groupNum
	  };
	  
	  $.ajax({
	    url: "Warrior_board_Free_Dabgle.do",
	    type: "POST",
	    data: data,
	    dataType: 'text',
	    success: function(result) { 
	      if (result == 0) {
	        location.reload();
	      }
	    },
	    error: function() {
	      alert("서버 요청 실패"); 
	    }
	  });
	}
	

</script>
</body>
</html>


