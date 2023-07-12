<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	tr:hover{background-color:#e3e4e6;}
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
 		
 		/* 컨텐츠 내용 */
 		
 		.center_content_header{ opacity: 0.8;height: 50px; width: 60vw; margin: 10px; border: none;text-align: left; align-items: center; background-color: #5f9ea0; font-size: 20px; font-weight: bold;  border-radius: 10px;}
 		.center_content_header>p{padding-top : 11px; padding-left: 22px; color: white;}
 		.menu_categori{display: flex; background-color: #eeeeee; width : 60vw; height: 40px; margin: 10px;}
 		.menu_categori>span{padding: 5px 10px 5px 10px; border-radius : 6px; border: 1px solid gray;margin: 5px; height: 20px; margin-top : 10px; }
 		.menu_categori>span>a{text-decoration: none; color: black;}
 		.menu_categori>select{height: 30px; margin: 5px; margin-top : 10px; margin-left: 15px; background-color: #f7f7f7; border-radius: 5px;}
 		.board_free_Input>div{height: 50px; width: 60vw;}
 		.board_free_list{float: right; border: 1px solid gray; padding :10px; margin: 5px; border-radius: 10px; color: gray;}
 		.board_free_write{float: right; padding : 10px; margin: 5px; background-color: #414a4c; color : white; border-radius: 10px; cursor: pointer;}
 		.menu_categori_choice{width: 60vw; margin:10px; margin-top:20px; margin-bottom: 0px; height: 20px;}
 		.span_text{padding: 5px 10px 5px 10px; margin: 20px; border-radius: 10px;  }
 		.span_l{color : #d0d0d0; }
 		.span_text>a{text-decoration: none;}
 		.span_text>a{color : black;}
 		#span_text_tupyo{background-color: #666666; color : white;}
 		#span_text_tupyo>a{color: white;}
 		.titleTD a{color: black; text-decoration: none;}
 		.menu_list_table{width: 60vw; margin: 10px; border-collapse: collapse;}
 		table td {
		      border-top: 1px solid #DDD;
		      border-bottom: 1px solid #DDD;
		      border-left: none;
		      border-right: none;
		      padding: 10px;
		     text-overflow:ellipsis; overflow:hidden;white-space:nowrap;
		    }
 		table{table-layout: fixed}
 		.trtrtrDD{text-align: center; font-weight: bold; text-overflow:ellipsis; overflow:hidden; }
 		.bunhoTD{width: 5vw; text-align: center; text-overflow:ellipsis; overflow:hidden;}
 		.hitTD, .recommendTD{width: 3.5vw; text-align: center; text-overflow:ellipsis; overflow:hidden; }
 		.titleTD{width: 30vw; text-overflow:ellipsis; overflow:hidden;  }
 		.NickNameTD{text-align: left; width: 6vw;text-overflow:ellipsis; overflow:hidden; }
 		.wtimeTD{text-align: center; width: 5vw;text-overflow:ellipsis; overflow:hidden; }
 		.titleTD a{color: black; text-decoration: none;}
 		
 		.pageP{width: 59.5vw; text-align: center; height: 30px; margin-top: 80px; font-size: 15px; color: black;}
 		.pageP a{color: black; text-decoration: none;}
 		.spanspans{border:1px solid #DDD; padding:5px 10px 5px 10px ; color: #7fcdff;}
 		.zxs{color: #ff3f3f; font-weight: bold;}
 		
 		 .user-nickname{cursor: pointer;}
 		 .option1{display: none; margin-top: 7px; margin-left:2px; border: 1px solid gray;}
 		 .option1-1{border-bottom: 1px solid gray;; cursor: pointer;}
 		 .option1-1:hover a { color: white;}
 		 .option1-1:hover{background-color: black;}
 		 .option1-2{ cursor: pointer;}
 		  .option1-2:hover a { color: white;}
 		 .option1-2:hover{background-color: black;}
 		 .option1 a {text-decoration: none; color: black; font-size: 13px; }
 		 .noteSpan_g{cursor: pointer; font-size: 13px;}
 		 .noteSpan_g:hover{color: white;}
 		 .option1-2:hover .noteSpan_g{ color: white;}
 		
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
				<div class = "center_content">
					<div class = "center_content_header">
						<p>메이플스토리 인벤 자유 게시판</p>
					</div>
					<div class = "board_free_Input">
						
						<div style = "display:flex;">
							<%--폼 메소드 --%>
							<div style = "float:left; width:70%; margin-left:15px; margin-top:15px;">
								<form action = "search_Board_Free.do" method = "post">
									<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
										<option value="0"  >제목+작성자</option>
										<option value="1"  >제목</option>
										<option value="2"  >작성자</option>
									</select>
									<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
									<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
								</form>							
							</div>
							<%--폼 메소드 끝--%>
							<div style = "float: right; width:30%;">
								<a href = "board_Free.do"><span class = "board_free_list">목록</span></a>
								<c:if test = "${userInfo ne null }">
									<a href = "board_free_write.do" onclick="checkUserPower(event)"><span class = "board_free_write">글쓰기</span></a>
								</c:if>
								<c:if test = "${userInfo eq null }">
									<span class = "board_free_write" id = "board_free_write_no">글쓰기</span>
								</c:if>
							</div>
						</div>
						<c:if test="${not empty sessionScope.userInfo}">
							<div class = "menu_categori">
							<span><a href = "onetwo_Board.do?good=10">👍10추글</a></span>
							<span><a href = "onetwo_Board.do?good=30">👍30추글</a></span>
							<span><a href = "My_writing_board.do<%-- userId = ${sessionScope.userInfo.userId }--%>">내 글</a></span>
							<span><a href = "My_comment_board.do<%--userId = ${sessionScope.userInfo.userId}}--%>">내 댓글</a></span>
						</div>
						</c:if>
						<c:if test="${empty sessionScope.userInfo}">
						    <div class = "menu_categori">
							<span><a href = "onetwo_Board.do?good=10">👍10추글</a></span>
							<span><a href = "onetwo_Board.do?good=30">👍30추글</a></span>
						</div>
						</c:if>
						<div class = "menu_categori_choice">
							<span class = "span_text" id = "span_text_entire"><a href = "board_Free.do">전체</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_suda"><a href = "board_Free_suda.do">수다</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_tupyo"><a href = "board_Free_tupyo.do">투표</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_insa"><a href = "board_Free_insa.do">인사</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_smail"><a href = "board_Free_smail.do">웃긴글</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_event"><a href = "board_Free_event.do">이벤트</a></span><span class = "span_l">|</span>
							<span class = "span_text" id = "span_text_jungbo"><a href = "board_Free_jungbo.do">정보</a></span><span class = "span_l">|</span>
							<hr>
						</div>
						<div class = "menu_list_table_div">
							<table class = "menu_list_table">
								<tr class = "trtrtrDD">
									<td class = "bunhoTD">번호</td><td class = "titleTD">제목</td><td class = "NickNameTD">글쓴이</td><td class = "wtimeTD">등록일</td><td class = "hitTD">조회</td><td class = "recommendTD">추천</td>
								</tr>
							<c:forEach items="${list}" var="item">
						      <tr class = "trtrtr">
						        <td class = "bunhoTD"><c:out value="${item.num}" /></td>
						        <td class = "titleTD">
						        	<c:set var="countValue" value="${item.comment}" />
						        	<a href = "board_Free_Content_View.do?num=${item.num}&comment=${countValue}">
						        		<c:out value="[${item.category}]" /> 
						        		<c:out value="${item.userTitle}" />&nbsp;
						        		<c:if test="${item.comment ne 0}">
										  	<span class="zxs">[<c:out value="${item.comment}" />]</span>
										</c:if>
						        	</a>
						        	<c:choose>
									    <c:when test="${not empty item.img_file || not empty item.img_file1 || not empty item.pub_file1 || not empty item.pub_file2}">
									        <span class = "zcmv"><img src="https://emoticon.emoticbox.com/dist/png/tab/123456789" class = "imgem"></span>
									    </c:when>
									</c:choose>
						        
						        </td>
						         <td class="NickNameTD">
								  <span class="user-nickname" onclick="showOptions(event)"><c:out value="${item.userNickName}" /></span>
								  <div class="option1">
								  	<div class = "option1-1">
								  		 <a href="Board_Free_NickName_search.do?userNickName=${item.userNickName}">이름으로 검색</a>
								  	</div>
								  <c:if test = "${empty sessionScope.userInfo}">
								  	<div class = "option1-2">
								  		 <span class = "noteSpan_g">쪽지 쓰기</span>
								  	</div>
								  	</c:if>
								  	<c:if test = "${not empty sessionScope.userInfo}">
								  	<div class = "option1-2">
								  		 <a href="note_writingGood.do?userNickName=${item.userNickName}" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;">쪽지 쓰기</a>	
								  	</div>
								  	</c:if>
								  </div>
								</td>
						        <td class = "wtimeTD">
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
						        </td>
						        <td class = "hitTD"><c:out value="${item.hit}" /></td>
						        <td class = "recommendTD"><c:out value="${item.recommend}" /></td>
						      </tr>
						    </c:forEach>
							</table>
							<div style = "display:flex;">
							<%--폼 메소드 --%>
							<div style = "float:left; width:70%; margin-left:15px; margin-top:15px;">
								<form action = "search_Board_Free.do" method = "post">
									<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
										<option value="0"  >제목+작성자</option>
										<option value="1"  >제목</option>
										<option value="2"  >작성자</option>
									</select>
									<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
									<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
								</form>							
							</div>
							<%--폼 메소드 끝--%>
							<div style = "float: right; width:30%;">
								<a href = "board_Free.do"><span class = "board_free_list">목록</span></a>
								<c:if test = "${userInfo ne null }">
									<a href = "board_free_write.do" onclick="checkUserPower(event)"><span class = "board_free_write">글쓰기</span></a>
								</c:if>
								<c:if test = "${userInfo eq null }">
									<span class = "board_free_write" id = "board_free_write_no">글쓰기</span>
								</c:if>
							</div>
						</div>
						
		<div class="pageP">
						<c:set var="curPage" value="${param.curPage }" />
						<c:if test="${curPage eq null }">
							<c:set var="curPage" value="0"/>
						</c:if>
						<c:forEach var="i" begin="0" end="${totalPage}" step="1">
							<c:choose>
								<c:when test="${i eq curPage}">
									${i+1}
								</c:when>
								<c:when test="${i ne curPage}">
									<a href="board_Free_tupyo.do?curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>					
						</div>
					</div>
				</div>				
			<%--//가운데 DIV --%>
			</div>
		</div>
<script>
function checkUserPower(event) {
	if ('${sessionScope.userInfo.power}' === '권한해제상태') {
      event.preventDefault(); // 링크 이동 중단
      alert('관리자에 의해 권한이 해제된 이용자입니다. 고객센터에 문의해주세요.');
    
  }
}
const board_free_write_no = document.querySelector("#board_free_write_no");
board_free_write_no.addEventListener("click", function(){
	alert("글쓰기 권한이 없습니다. 로그인 후 이용해주세요.");
});
function showOptions(event) {
	  var nickname = event.target;
	  var options = nickname.nextElementSibling;
	  options.style.display = 'block';
	  document.addEventListener('click', function(e) {
		    var target = e.target;

		    // 닉네임 요소 또는 옵션 요소를 클릭한 경우 아무 작업도 수행하지 않음
		    if (target === nickname || target === options || options.contains(target)) {
		      return;
		    }

		    // 클릭 이벤트가 발생한 요소가 닉네임 요소나 옵션 요소가 아닌 경우
		    // 옵션 요소를 숨김 처리
		    options.style.display = 'none';
		  });
	}
	
const noteSpans = document.querySelectorAll(".noteSpan_g");
noteSpans.forEach((span) => {
	span.addEventListener("click", function(){
	const modalPage = document.querySelector(".modalPage");
	alert("로그인 후 이용가능합니다.");
	modalPage.style.display = "block";
		
	})
});
function hideModal() {
	document.querySelector(".modalPage").style.display = "none";
}
</script>		
<script src="script/index.js"></script>
</body>
</html>



