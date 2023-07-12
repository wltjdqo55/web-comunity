<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/header_side.css">
<style>
                @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    font-family: GmarketSansMedium;
    }
	body{margin: 0;padding : ; width:100vw; height: 200vh; margin-bottom: 150px;background-image: url('images/메이플 배경이미지2.jpg'); background-size: 100% 100%; background-repeat: no-repeat; background-position: 0% 100%;
background-attachment: fixed;
background-gradient: rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0) 100%;}
	
 		/*가운데 div */
 		.container_wrap{background-color: white;}
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
 		
 		
		.center_content{margin: 10px;}
 		.center_content_title{display: flex; width: 60.5vw; height: 45px; border-top:2px solid gray; border-bottom: 1px solid gray; background-color: #f1f1f1;}
 		.select_left{width: 10vw; text-align: center; align-items: center; justify-content: center;}
 		.select_left>select{padding: 5px; margin-top: 8px; border-radius: 2px;}
 		.title_right{width: 50.5vw; padding: 5px; margin-top: 5px;}
 		.BoardTitle{width: 45vw; height: 20px; border-radius: 2px; border: 1px solid gray;}
 		.NickNameAndStorage{width: 60.5vw; height: 40px; background-color: #f1f1f1; border-bottom : 1px solid gray; margin:0;}
 		.Storage{float: right; padding: 4.5px 10px 4.5px 10px; background-color: #f9f9f9; border: 1px solid gray; border-radius: 3px; margin: 5px; margin-left: 20px; cursor: pointer;}
 		.Storage_goto{float: right; padding: 4.5px 10px 4.5px 10px; background-color: #f9f9f9; border: 1px solid gray; border-radius: 3px; margin: 5px; margin-left: 20px; cursor: pointer;}
 		
 		.NickName_right{float:left; margin: 10px; margin-right: 20px; font-size: 18px; font-weight: bold;}
 		.editor_on{display: block; overflow: scroll; resize: none; width: 60.5vw;}
 		.editor_textarea{ width: 59vw; height: 60vh;} 
 		.editableDiv{width: 59vw; height: 60vh; border: 1px solid gray;  overflow: scroll; }
 		.text_on{display: none; overflow: scroll; resize: none; width: 60.5vw;}
 		
 		.attachment{display: flex;}
 		.attachment span{margin:10px; padding: 7px 10px 7px 10px; cursor: pointer;}
 		.attachment_img_goto{ border-radius: 3px;  background-color:#65737e; color: white; }
 		.attachment_file_goto{border-radius: 3px; color: gray;  background-color:#65737e; color: white; }
 		.Voting_goto{background-color: #428bca; color : white; border: none; border-radius: 3px;}
 		
 		.attachment_img_div{width: 60vw;  line-height: 2.0; margin-bottom: 20px;} 
 		.attachment_img_div_flex{}
 		.attachment_img_div_flex_flex{display: flex;}
 		.attachment_img_div_left{width : 48vw; margin: 10px; float: left;}
 		.attachment_img_div_right{width: 12vw;  float: right; align-items: center; justify-content: center;}
 		.attachment_img_div_left_span{color:red; font-weight: bold;}
 		.img_file{padding-right : 15px;}
 		.custom-file-upload{margin-top:30px;float:right;position: relative;display: inline-block;border: 1px solid gray;  color: black;padding: 6px 12px;  border-radius: 4px;cursor: pointer; width: 80px; height: 80px;border-radius: 10px;  font-size: 20px;}
 		.attachment_img_div_right span{position: absolute;top: 50%; left: 50%;transform: translate(-50%, -50%);text-align: center;width: 100%;}
        .hrclcl{width: 60vw;}
       	.writeForm{width: 100px; height: 40px; background-color: black; color: white; border-radius: 5px; border: none; cursor: pointer; margin-left: 2%;}
       
       	.TextANDWepeditorSelector{height: 40px; background-color : #DDD; width : 60.5vw; margin-top: 0px;  border-bottom : 1px solid gray; text-align: left; display:inline-block;}
       	.TextANDWepeditorSelector .tean{ margin-top:16px; margin-left: 20px; }
       
       
        .attachment_file{display:none;}
        .Voting{display:none;}
       
        
        .attachment_file{width: 60vw;border-bottom: 1px solid gray; height: 70px; margin-bottom: 20px;}
        .attachment_file_flex{display: flex; margin: 10px; margin-top: 20px;}
        .attachment_img_div_flex_flex{}
 		.attachment_file_left{width: 50%; float: left; }
 		.attachment_file_right{width: 50%; float:left; }
 		.attachment_file_text{width: 60vw; color: gray;}
 		
 		.Voting{width: 58vw; height: auto; border-bottom: 1px solid gray; margin-bottom: 20px; margin-left: 10px;}
 		.voting_questions{margin-bottom: 20px; margin-top : 15px; height: 30px; width: 58vw;text-indent: 10px;}
 		.Answer{margin-bottom:5px; width: 58vw; height: 25px; text-indent: 10px;}
 		.answer_button{width: 58vw; height: 35px; background-color: black; color : white; text-align: center; font-size: 18px; font-weight: bold; border-radius: 10px; align-items: center; justify-content: center; cursor: pointer;}
 		.answer_button div{padding-top: 6px;}
 		
 		.noneimg{color : #c68642;}
 		.zzzddd{margin: 15px;}
 		.zzzddd img{width: 130px; height: 85px; cursor: pointer;}
 		
 		.radiobutton{height: 40px; background-color : #DDD; width : 60.5vw; margin-top: 0px;  border-bottom : 1px solid gray; margin-bottom: 20px;  vertical-align: top;float:left; }
 		.radiobutton .textOK{margin-left: 20px; margin-top : 16px; }
 		.editor_textarea{border: 1px solid gray;}
 		
 		.imgTagsrc{text-align:center;max-width: 900px;max-height: 900px;width: auto;height: auto;}
 		.img_file{display: none;}
 		.zkzk{text-align:left;max-width: 700px;max-height: 700px;width: auto;height: auto;}
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
					<form action = "Notice_BoardmodifyOK.do" method = "post" enctype="multipart/form-data">
					<%-- 글쓰기 폼 --%>
					<div class = "center_content_title">
						<div class = "select_left">
							<select name="category">
							  <option value="1" ${dto.category == '분류' ? 'selected' : ''}>분류</option>
							  <option value="2" ${dto.category == '공지' ? 'selected' : ''}>공지</option>
							  <option value="3" ${dto.category == '이벤트' ? 'selected' : ''}>이벤트</option>
							  <option value="4" ${dto.category == '점검' ? 'selected' : ''}>점검</option>
							  <option value="5" ${dto.category == '소식' ? 'selected' : ''}>소식</option>
							  <option value="6" ${dto.category == '버그제보' ? 'selected' : ''}>버그제보</option>
							</select>
						</div>
						<div class= "title_right">
							<span>제목 : </span>
							<input type = "text" size = "30vw" placeholder="제목을 입력하세요" name = "userTitle" id = "userTitle" class = "BoardTitle" value = "${dto.userTitle}">
							<input type = "hidden" name = "num" value = "${dto.num }">
						</div>
					</div>
					<div class = "NickNameAndStorage">
						<span class = "NickName_right">닉네임 : ${userInfo.userNickName }</span>
						 <span class="Storage_goto" onclick="loadTemporaryTitle()">임시저장 불러오기</span>
  						<span class="Storage" onclick="saveTemporaryTitle()">임시저장</span>
  						
					</div>
					<div class = radiobutton>
						<input type="radio" name="type" value="editor" class = "textOK" id = "editorType" checked > 웹 에디터
					</div>
					<div class="editor_on">
						  	<input type = "hidden" name = "userName" value = "${userInfo.userName}">
							<input type = "hidden" name = "userId" value = "${userInfo.userId}">
							<input type = "hidden" name = "userPassword" value = "${userInfo.userPassword}">
							<input type = "hidden" name = "userNickName" value = "${userInfo.userNickName}">
  							<textarea name="BoardContent"  class = "editor_textarea" id="BoardContent editContent" wrap="hard">${dto.boardContent}</textarea>
					</div>
					<div class = "attachment">
						<span id = "attachment_img" class = "attachment_img_goto">이미지 첨부</span>
						<span id = "attachment_file" class = "attachment_file_goto">파일 첨부</span>
						<span id = "Voting" class = "Voting_goto">투표</span>
					</div>
					<hr style="width:60vw">
					<div class = "attachment_img_div">
						<div class = "attachment_img_div_flex">
							<div class = "noneimg">
								<div> * 하단 사진을 클릭하시면 본문에 추가됩니다(커서의 위치에 이미지가 등록됩니다.)</div>
								<div class = "zzzddd">
								</div>
							</div>
							<div class = "attachment_img_div_flex_flex">
								<div class = "attachment_img_div_left">
									<span class = "attachment_img_div_left_span">*이미지를 업로드 하신 후 클릭을 하셔야 본문에 첨부됩니다.</span><br>
									* 이미지 업로드는 최대 15MB까지 가능합니다.<br>
									* 총 30개까지 업로드 가능합니다.<br>
									* 통신 환경에 따라 고용량 이미지의 업로드가 실패할 수 있습니다.<br>
								</div>
								<div class = "attachment_img_div_right">
									<label for="img_file" class="custom-file-upload"><span>업로드</span></label>
									<input type="file" name="img_file" class="img_file" id="img_file" accept="image/*,.pdf,.docx,.xlsx" onchange = "zzzddd(event)"<%--  onchange="insertImage(event)"--%>>
								</div>
							</div>
						</div>
						<hr style = "width: 60vw" class = "hrclcl">
					</div>
					<div class = "attachment_file">
						<div class = "attachment_file_flex">
							<div class = "attachment_file_left">
								파일 첨부 : <input type="file" name="pub_file1" class="pub_file" id="pub_file" accept=".zip,.rar">
							</div>
							<div class = "attachment_file_right">
								파일 첨부 : <input type="file" name="pub_file2" class="pub_file" id="pub_file" accept=".zip,.rar">
							</div>
						</div>
						<div class = "attachment_file_text">
							* "파일 첨부"는 압축 파일만 업로드 가능합니다. 이미지 업로드는 "이미지 첨부" 기능을 사용해 주세요.
						</div>
					</div>
					<div class = "Voting">
						<div class = "voting_questions_div">
							<input type = "text" placeholder="투표 질문을 입력하세요" name ="voting_questions" id = "voting_questions" class= "voting_questions">
							<input type = "text" placeholder="1. 답변입력" name = "Answer1" id = "Answer1" class = "Answer">
							<input type = "text" placeholder="2. 답변입력" name = "Answer2" id = "Answer2" class = "Answer">						
						</div>
						<div class= "answer_button">
							<div class = "answer_btn">답변추가</div>
						</div>
					</div>
					
					<div class = "formSub">
						<input type = "submit" class = "writeForm" id = "writeForm" value = "작성완료">
					</div>
					
					<%-- form 끝 --%>
					</form>
				</div>				
			<%--//가운데 DIV --%>
			</div>
		</div>
<script type="text/javascript" src="//js.nicedit.com/nicEdit-latest.js"></script> 
 <script type="text/javascript">

       bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
 </script>		
<script>

function saveTemporaryTitle() {
    var titleInput = document.getElementById('userTitle');
    var temporaryTitle = titleInput.value;
  
    <%--
    var editorInput = document.querySelector('.ediv');
    var temporaryEditor= editorInput.value;
   --%>
    
    
    localStorage.setItem('temporaryTitle', temporaryTitle);
    <%--  localStorage.setItem('temporaryEditor', temporaryEditor); --%>
    alert('임시 내용이 저장되었습니다.');
  }

  function loadTemporaryTitle() {
    var storedTitle = localStorage.getItem('temporaryTitle');
    <%--  var storedEditor = localStorage.getItem('temporaryEditor'); --%>
    
    if (storedTitle) {
      var titleInput = document.getElementById('userTitle');
      <%-- var editorInput = document.querySelector('.ediv'); --%>
      
      titleInput.value = storedTitle;
      <%-- editorInput.value = storedEditor;--%>
      alert('임시 내용을 불러왔습니다.');
    }
  }
  function zzzddd(event) {
	    var files = event.target.files; // 선택된 모든 파일 가져오기
	    var output = document.querySelector('.zzzddd');

	    for (var i = 0; i < files.length; i++) {
	        var reader = new FileReader();
	        var file = files[i];

	        reader.onload = (function(file) {
	            return function() {
	                var img = document.createElement('img');
	                img.src = this.result;

	                img.onclick = function() {
	                    insertImageFromThumbnail(img);
	                };

	                output.appendChild(img);
	            };
	        })(file);

	        reader.readAsDataURL(file); // 각 파일을 읽어옴
	    }
	}

  function insertImageFromThumbnail(img) {
	    var editableDiv = document.getElementById("editContent");
	    var editor_textarea = document.querySelector(".editor_textarea");
	    var sel = window.getSelection();


	    var range = sel.getRangeAt(0);
	    var startNode = range.startContainer;
	    var startOffset = range.startOffset;

	    var insertNode = document.createElement('img');
	    insertNode.setAttribute("src", img.src);
	    insertNode.classList.add("zkzk");
	    range.deleteContents();
	    range.insertNode(insertNode);

	    var newRange = document.createRange();
	    newRange.setStartAfter(insertNode);
	    newRange.collapse(true);
	    sel.removeAllRanges();
	    sel.addRange(newRange);

	    editableDiv.focus();
	    editableDiv.dispatchEvent(new Event('input'));
	}
  

<%--
var storageBtn = document.querySelector(".Storage");
var editableDiv = document.querySelector(".editor_textarea");
var boardTitleInput = document.querySelector(".BoardTitle");
storageBtn.addEventListener("click", function() {
	 
     var temporaryContent = editableDiv.innerHTML;
     var boardTitle = boardTitleInput.value;
     
     localStorage.setItem('draft1', temporaryContent);
     localStorage.setItem('draft2', boardTitle);
     alert('게시글이 임시저장되었습니다.');
  
});

var storageGoto = document.querySelector(".Storage_goto");

storageGoto.addEventListener("click", function() {
  const savedDraft1 = localStorage.getItem('draft1');
  const savedDraft2 = localStorage.getItem('draft2');
	
  alert('임시저장된 게시글이 불러와졌습니다.');
  if (savedDraft2) {
	  //savedDraft1.innerHTML  = temporaryContent;
	  savedDraft2.value = boardTitle;
	  
  } else {
    alert('임시저장된 게시글이 없습니다.');
  }
  
});
--%>

const writeForm = document.querySelector("#writeForm");
writeForm.addEventListener("click", function(){
	alert("게시글 수정이 완료되었습니다.");
});
<%--
function saveCursorPosition() {
    var sel = window.getSelection();
    if (sel.rangeCount > 0) {
        var range = sel.getRangeAt(0);
        sessionStorage.setItem('cursorPosition', JSON.stringify({
            startContainer: range.startContainer,
            startOffset: range.startOffset
        }));
    }
}

function restoreCursorPosition() {
    var cursorPosition = sessionStorage.getItem('cursorPosition');
    if (cursorPosition) {
        var position = JSON.parse(cursorPosition);
        var sel = window.getSelection();
        var range = document.createRange();
        range.setStart(position.startContainer, position.startOffset);
        range.collapse(true);
        sel.removeAllRanges();
        sel.addRange(range);
    }
}
--%>
<%--
function insertImage(event) {
    var editableDiv = document.getElementById("editContent");
    var sel = window.getSelection();
    var range = sel.getRangeAt(0);
    var startNode = range.startContainer;
    var startOffset = range.startOffset;

    var file = event.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        var imgSrc = e.target.result;

        var insertNode = document.createElement('img');
        insertNode.setAttribute("src", imgSrc);
        insertNode.classList.add("zkzk");
        range.deleteContents();
        range.insertNode(insertNode);

        var newRange = document.createRange();
        newRange.setStartAfter(insertNode);
        newRange.collapse(true);
        sel.removeAllRanges();
        sel.addRange(newRange);

        editableDiv.focus();
        editableDiv.dispatchEvent(new Event('input'));
    };
    reader.readAsDataURL(file);
}
--%>








</script>
<script src = "script/board_Free_write.js"></script>
<script src="script/index.js"></script>
</body>
</html>












