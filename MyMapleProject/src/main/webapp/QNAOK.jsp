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
 		
 		.Free_Table{margin-left:10px; width: 450px; text-overflow: ellipsis;overflow: hidden; border-bottom: 1px solid gray;}
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
	     .styled-button {
	    padding: 10px;
	    background-color: #4CAF50;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size: 16px;
	    font-weight: bold;
	  }
	
	  .styled-button:hover {
	    background-color: #45a049;
	  }
	  table {
	    border-collapse: collapse;
	    width: 100%;
	  }
	
	  table td {
	    padding: 10px;
	    text-align: left;
	  }
	
	  table th {
	    padding: 10px;
	    text-align: left;
	    background-color: #f2f2f2;
	  }
	
	  input[type="radio"] {
	    margin-right: 5px;
	  }
	
	  textarea {
	    width: 97.8%;
	    resize: vertical;
	    padding: 5px;
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
														
					<%--//가운데 div 라인 --%>
				</div>				
			<%--//가운데 DIV --%>
			</div>
		</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script>




function btn_QNA(){
	document.querySelector(".sub_btn_g").style.display = "block";
	document.querySelector(".form_div").style.display = "block";
}

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



























































