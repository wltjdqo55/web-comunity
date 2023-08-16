<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/static/css/header_side/side.css'/>">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href = "join"><span class = "join_span" >회원가입</span></a>
				<span class= "cent">|</span>
				<a href = "idpasswordFind" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "find_span">ID/PW찾기</span></a>
			</div>
			<form action = "IntegratedSearch" method = "post">
				<div class = "searchContent_div">
					<input type = "text" placeholder="메이플 인벤 통합검색" name = "searchContent" class = "searchContent" id = "searchContent">
					<input type = "submit" value = "확인" class="searchContent_sub">
				</div>
			</form>
		<%--//로그인검색창 --%>
		<!-- 모달창(회원탈퇴) -->
		<div class="modalPage">
		<div class="close" onclick = "hideModal()"></div>
		<%-- form태그 --%>
			<div class="cont">
				<p class="txt">
					<span class="accent">INVEN 로그인</span>
				</p>
				<div class="border-boxbox_withdrawal">
		            <div class="inner">
		                <div class = "present">
							<div style = "padding:10px;" id = "present_id">
								<input type = "text"  class = "id_pre" name = "userId" id = "userId" placeholder="아이디">
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
				<input type="button" onclick="form_button()" class="login_Sub" value="로그인" id = "login_form">
				<button class = "goto_Join" id = "goto_Join" onclick="location.href='join'; return false;">회원가입</button>
			</div>
		<%-- //form태그 --%>
		</div>
		<!-- //모달창(회원탈퇴) -->
		</c:when>
		<c:when test = "${userInfo ne null }">
		<c:choose>
			<c:when test="${userInfo.role eq 'admin' or userInfo.role eq 'super'}">
				<h3>메이플스토리 인벤</h3>
				<p><span style = "font-weight: bold">${userInfo.userNickName}</span> 관리자님</p>
				<div class = "joinAndfindIDPw">
					<a href = "note" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "post_span" >우편함</span></a>
					<span class= "cent">|</span>
					<a href = "info" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "modify_span">개인정보수정</span></a>
				</div>
				
				<div style = "margin-top:20px" class = "logout_div">
					<a href = "Admin.do" style = "color: blue; text-decoration: none;" style = "width: 50%;"><span style = "text-decoration: none; color: blue; background-color: #DDD; padding: 5px; border-radius: 10px; margin-top:10px;">회원관리</span></a>
					<a href = "Logout.do" class = "logout_class" style = "width: 50%;"><span class = "logout_span">로그아웃</span></a>
				</div>
				<br>
				<form action = "IntegratedSearch" method = "post">
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
					<a href = "note" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "post_span" >우편함</span></a>
					<span class= "cent">|</span>
					<a href = "info" onclick="window.open(this.href, '_blank', 'width=700,height=550,left=300, top=150'); return false;"><span class = "modify_span">개인정보수정</span></a>
				</div>
				
				<div style = "margin-top:20px" class = "logout_div">
					<a href = "logout" class = "logout_class"><span class = "logout_span">로그아웃</span></a>
				</div>
				<br>
				<form action = "IntegratedSearch" method = "post">
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
			<div class = "jobBO" id="link"><a href = "QNA?userNickName=${sessionScope.userInfo.userNickName}" id = "aaa"><span>고객센터</span></a></div>
			<div class = "jobBO" id="link"><a href = "Notice.do" id = "aaa"><span class = "tipOO" >메이플에 바란다</span></a></div>
		
		<%-- //커뮤니티 게시판 --%>
		</div>
		</div>
<%--//왼쪽 메뉴바 라인 --%>
</div>