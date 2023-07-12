<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{margin:0;padding:0;width:100%; height: auto;}
.header{width:100%;  margin-right:0; }
.header_header{width: 100%;}
.headerBar{width: 90%; height: 60px; text-align: right; margin-top:30px; margin-right: 30px;}
.headerBar a{text-decoration: none; color : black; font-size: 24px; font-weight: bold;  }
.headerBar span{margin-left:5%;margin-top:10%; }
tr:hover{background-color:#e3e4e6;}
.container{width: 85%; height: 80vh; margin : 0 auto; display: flex; }
.container_wrap{width: 20%; height: 100%; margin: 0 auto; }
.container_wrap_box{ width: 80%; height: auto; margin: 30px;}
.goodspan{cursor: pointer; font-weight: bold;}


.container_warp_content{width: 67vw;height: 100%;}
.Free_Board_Content{ width: 100%; height: 100%; display: none;}
.Warrior_Board_Content{width: 100%; height: 100%; display: none;}
.Notice_Board_Content{width: 100%; height: 100%; display: none;}
.Admin_Board_Content{width: 100%; height: 100%; display: none;}
.sub_btn {
  position: fixed;
  z-index: 5;
  padding: 7px 22px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-left:0px;;
  font-size: 20px;
}

.sub_btn:hover {
  background-color: #45a049;
}

.sub_btn:active {
  background-color: #3e8e41;
}

.sub_btn:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
}
.sub_btn1 {
  position: fixed;
  z-index: 5;
  padding: 7px 22px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-left:0px;;
  font-size: 20px;
}

.sub_btn1:hover {
  background-color: #45a049;
}

.sub_btn1:active {
  background-color: #3e8e41;
}

.sub_btn1:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
}
.sub_btn2 {
  position: fixed;
  z-index: 5;
  padding: 7px 22px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-left:0px;;
  font-size: 20px;
}

.sub_btn2:hover {
  background-color: #45a049;
}

.sub_btn2:active {
  background-color: #3e8e41;
}

.sub_btn2:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
}
::placeholder{color : #808080;}
table {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
  }

  th {
    background-color: #f2f2f2;
    font-weight: bold;
    padding: 12px;
    text-align: left;
    border: 1px solid #dddddd;
  }

  td {
    padding: 12px;
    text-align: left;
    border: 1px solid #dddddd;
  }

  tr:nth-child(even) {
    background-color: #f9f9f9;
  }

  tr:hover {
    background-color: #f5f5f5;
  }
 	.Content_View_Modify{display: none;}	
</style>
</head>
<body>
	<div class = "header" style = "width: 100%; display: flex;">
		<div class = "header_header">
			<div class = "headerBar">
			<span><a href = "index.do">HOME</a></span>
			<c:if test = "${sessionScope.userInfo.role eq 'super'}">
				<span><a href = "Admin_Request.do">관리자요청</a></span>
			</c:if>
			<span><a href = "Admin.do" >통계</a></span>
				<span><a href = "Admin_Member.do">회원관리</a></span>
				<span><a href = "Admin_Board.do">게시판관리</a></span>
				<span><a href = "Admin_Notice.do" style = "color:blue;">공지/문의</a></span>
				<span><a href = "Admin_Image.do">이미지등록</a></span>
				<span><a href = "Admin_Report.do">신고</a></span>
			</div>
		</div>
	</div>
	<div class="container">
		 <div class = "container_wrap">
		 	<div class = "container_wrap_box">
		 		<div style = "width : 100%; height: 20px; font-size: 24px; font-weight: bold;" class = "header_d">
			 		<span style = "cursor: pointer;">게시판 공지등록</span>	 		
		 		</div>
		 		<div style = "width: 100%; height: 100px; margin-top: 30px; margin-left:20px; display: none; line-height: 2.3" class ="header_c">
		 			<span class = "goodspan FreeBoard_span">→ 자유게시판</span><br>
		 			<span class = "goodspan WarriorBoard_span">→ 직업게시판</span><br>
		 			<span class = "goodspan NoticeBoard_span">→ 정보공유게시판</span><br>
		 			<span class = "goodspan AdminBoard_span">→ 관리자게시판목록</span><br>
		 		</div>
		 	</div><br>
		 	<div class = "container_wrap_box">
		 		<div style = "width : 100%; height: 20px; font-size: 24px; font-weight: bold;">
			 		<span style = "cursor: pointer;" class = "zizizi">문의내역</span>	 		
		 		</div>
		 	</div><br>
		 </div>
		 <div class = "container_warp_content">
		 	<%--자유게시판영역 --%>
		 	<div class = "Free_Board_Content">
			 	<form action = "Admin_Write_Board.do" method = "post" class = "myform">
			 		<input type = "text" name = "title" class = "classB" style = "width: 78%; height: 44px; border: none;border-radius:10px; background-color:#e8f4ea; text-indent: 20px; font-size: 18px;" placeholder="제목을 입력해주세요.">
			 		<input type = "submit" value = "자유게시판 공지등록" class = "sub_btn">
			 		 <textarea id="summernote" name = "content"></textarea>
				 </form>
		 	</div>
		 	<%--직업게시판영역 --%>
		 	<div class = "Warrior_Board_Content">
			 	<form action = "Admin_Write_Board1.do" method = "post" class = "myform1">
			 		<input type = "text" name = "title" class = "classB" style = "width: 78%; height: 44px; border: none;border-radius:10px; background-color:#e8f4ea; text-indent: 20px; font-size: 18px;" placeholder="제목을 입력해주세요.">
			 		<input type = "submit" value = "직업게시판 공지등록" class = "sub_btn1">
			 		 <textarea id="summernote1" name = "content"></textarea>
				 </form>
		 	</div>
		 	<%--정보공유게시판영역 --%>
		 	<div class = "Notice_Board_Content">
			 	<form action = "Admin_Write_Board2.do" method = "post" class = "myform2">
			 		<input type = "text" name = "title" class = "classB" style = "width: 78%; height: 44px; border: none;border-radius:10px; background-color:#e8f4ea; text-indent: 20px; font-size: 18px;" placeholder="제목을 입력해주세요.">
			 		<input type = "submit" value = "정보게시판 공지등록" class = "sub_btn2">
			 		 <textarea id="summernote2" name = "content"></textarea>
				 </form>
		 	</div>
		 	<div class = "Admin_Board_Content good">
		 		<table border = "1" style = "width: 100%;">
		 			<tr>
		 				<th style = "text-align: center; width:7%;">번호</th>
		 				<th style = "text-align: center; width:15%;">게시판</th>
		 				<th style = "text-align: center; width:60%;">제목</th>
		 				<th style = "text-align: center; width:18%;">작성일</th>
		 			</tr>
		 			<c:forEach items="${list}" var = "list">
		 			<tr>
		 				<td style = "text-align: center;width:7%;"><c:out value="${list.num}" /></td>
		 				<td style = "text-align: center;width:15%;"><c:out value="${list.board}" /></td>
		 				<td style = "width:60%;"><a href = "Admin_Notice_Modify.do?num=<c:out value="${list.num}" />"><c:out value="${list.title}" /></a></td>
		 				<td style = "text-align: center; width:18%;"><c:out value="${list.wtime}" /></td>
		 			</tr>
		 			</c:forEach>
		 		</table>
		 	</div>
		 	<div style = "width: 100%; height: auto; border: 1px solid black; display: none;" class = "div_div_div">
		 		 <table border = "1" style = "width: 100%;">
		 			<tr>
		 				<th style = "text-align: center; width:7%;">번호</th>
		 				<th style = "text-align: center; width:13%;">문의</th>
		 				<th style = "text-align: center; width:11%;">닉네임</th>
		 				<th style = "text-align: center; width:60%;">문의내용</th>
		 				<th style = "text-align: center; width:13%;">상태</th>
		 			</tr>
		 			<c:forEach items="${QNAlist}" var = "item">
		 			<tr>
		 				<td style = "text-align: center;width:7%;"><c:out value="${item.num}" /></td>
		 				<td style = "text-align: center;width:8%;"><c:out value="${item.QNARadio}" /></td>
		 				<td style = "text-align: center;width:11%;"><c:out value="${item.userNickName}" /></td>
		 				<td style = "text-align: left; width:60%;"><a href = "QNAContent.do?num=${item.num}"><c:out value="${item.content}" /></a></td>
		 				<c:if test = "${item.state eq '답변대기'}">
		 					<td style = "text-align: center; width:13%;"><span style = "color:red; font-weight: bold;"><c:out value="${item.state}" /></span></td>
		 				</c:if>
		 				<c:if test = "${item.state eq '답변완료'}">
		 					<td style = "text-align: center; width:13%;"><span style = "color:blue; font-weight: bold;"><c:out value="${item.state}" /></span></td>
		 				</c:if>
		 			</tr>
		 			</c:forEach>
		 		</table>
		 	</div>
		 	
		 	
		 	
		 	<div style = "width: 100%; height: auto;display:block;" class = "goodgood">
		 		<table border = "1" style = "width: 100%;">
		 			<tr>
		 				<th style = "text-align: center; width:7%;">번호</th>
		 				<th style = "text-align: center; width:13%;">문의</th>
		 				<th style = "text-align: center; width:11%;">닉네임</th>
		 				<th style = "text-align: center; width:60%;">문의내용</th>
		 			</tr>
		 			<tr>
		 				<td style = "text-align: center;width:7%;">${qnadto.num}</td>
		 				<td style = "text-align: center;width:8%;">${qnadto.QNARadio }</td>
		 				<td style = "text-align: center;width:11%;">${qnadto.userNickName }</td>
		 				<td style = "text-align: left; width:60%;">${qnadto.content }</td>
		 			</tr>
		 		</table>
		 		<div style = "margin-top : 20px;">
		 			<form action ="Admin_QNA_RE.do" method = "post" id="answerForm">
		 			<input type = "submit" value = "답변하기" onclick="confirmSubmission(event)" style="background-color: lightblue; color: white; padding: 10px 20px; border: none; border-radius: 4px; font-size: 16px; font-weight: bold; cursor: pointer;">
		 			<div style = "margin-top : 20px;">
		 				<textarea rows="15" cols="140" name = "content" placeholder="답변을 입력하세요."></textarea>
		 				<input type = "hidden" name = "num" value = "${qnadto.num }">
		 				<input type = "hidden" name = "userNickName" value = "${qnadto.userNickName }">
		 			</div>
		 			</form>
		 		</div>
		 	</div>
		 </div>
	</div>
	<script>
	function confirmSubmission(event) {
		event.preventDefault();
	    var confirmed = confirm("답변을 등록 하시겠습니까?");
	    if (confirmed) {
	      document.forms["answerForm"].submit();
	    }else{
	    	
	    }
	  }
	
	const FreeBoard_span = document.querySelector(".FreeBoard_span");
	FreeBoard_span.addEventListener("click", function(){
		document.querySelector(".Free_Board_Content").style.display = "block";
		document.querySelector(".Warrior_Board_Content").style.display = "none";
		document.querySelector(".Notice_Board_Content").style.display = "none";
		document.querySelector(".Admin_Board_Content").style.display = "none";
		document.querySelector(".goodgood").style.display = "none";
		document.querySelector(".div_div_div").style.display = "none";
	});
	document.querySelector(".WarriorBoard_span").addEventListener("click", function(){
		document.querySelector(".Warrior_Board_Content").style.display = "block";
		document.querySelector(".Free_Board_Content").style.display = "none";
		document.querySelector(".Notice_Board_Content").style.display = "none";
		document.querySelector(".Admin_Board_Content").style.display = "none";
		document.querySelector(".goodgood").style.display = "none";
		document.querySelector(".div_div_div").style.display = "none";
	})
	document.querySelector(".NoticeBoard_span").addEventListener("click", function(){
		document.querySelector(".Notice_Board_Content").style.display = "block";
		document.querySelector(".Warrior_Board_Content").style.display = "none";
		document.querySelector(".Free_Board_Content").style.display = "none";
		document.querySelector(".Admin_Board_Content").style.display = "none";
		document.querySelector(".goodgood").style.display = "none";
		document.querySelector(".div_div_div").style.display = "none";
	})
	document.querySelector(".AdminBoard_span").addEventListener("click", function(){
		document.querySelector(".Notice_Board_Content").style.display = "none";
		document.querySelector(".Warrior_Board_Content").style.display = "none";
		document.querySelector(".Free_Board_Content").style.display = "none";
		document.querySelector(".Admin_Board_Content").style.display = "block";
		document.querySelector(".div_div_div").style.display = "none";
		document.querySelector(".goodgood").style.display = "none";
	})
	document.querySelector(".zizizi").addEventListener("click", function(){
		document.querySelector(".Notice_Board_Content").style.display = "none";
		document.querySelector(".Warrior_Board_Content").style.display = "none";
		document.querySelector(".Free_Board_Content").style.display = "none";
		document.querySelector(".Admin_Board_Content").style.display = "none";
		document.querySelector(".div_div_div").style.display = "block";
		document.querySelector(".goodgood").style.display = "none";
	})
	const sub_btn = document.querySelector(".sub_btn");
	sub_btn.addEventListener("click", function(event){
		event.preventDefault();
		var confirm = window.confirm("자유게시판에 공지를 등록하시겠습니까?");
		if(confirm){
			 var myform = document.querySelector(".myform");
		      myform.submit(); // 각각의 form 요소에 대해 submit 동작 실행
		}else{
		}
	});
	const sub_btn1 = document.querySelector(".sub_btn1");
	sub_btn1.addEventListener("click", function(event){
		event.preventDefault();
		var confirm = window.confirm("직업게시판에 공지를 등록하시겠습니까?");
		if(confirm){
			 var myform1 = document.querySelector(".myform1");
		      myform1.submit(); // 각각의 form 요소에 대해 submit 동작 실행
		}else{
		}
	});
	const sub_btn2 = document.querySelector(".sub_btn2");
	sub_btn2.addEventListener("click", function(event){
		event.preventDefault();
		var confirm = window.confirm("정보공유게시판에 공지를 등록하시겠습니까?");
		if(confirm){
			 var myform2 = document.querySelector(".myform2");
		      myform2.submit(); // 각각의 form 요소에 대해 submit 동작 실행
		}else{
		}
	});
	
	$(document).ready(function() {
        $('#summernote').summernote({
          height: 536,
        minHeight: null,             // 최소 높이
        maxHeight: 536,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '공지사항 내용을 입력해주세요'   //placeholder 설정
          });
    });
	$(document).ready(function() {
        $('#summernote1').summernote({
          height: 536,
        minHeight: null,             // 최소 높이
        maxHeight: 536,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '공지사항 내용을 입력해주세요'   //placeholder 설정
          });
    });
	$(document).ready(function() {
        $('#summernote2').summernote({
          height: 536,
        minHeight: null,             // 최소 높이
        maxHeight: 536,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '공지사항 내용을 입력해주세요'   //placeholder 설정
          });
    });
	const header_d = document.querySelector(".header_d");
	let isContentVisible = false; // 초기 상태는 숨겨진 상태로 설정

	header_d.addEventListener("click", function() {
	  const header_c = document.querySelector(".header_c");
	  
	  if (isContentVisible) {
	    header_c.style.display = "none";
	    isContentVisible = false;
	  } else {
	    header_c.style.display = "block";
	    isContentVisible = true;
	  }
	});
	</script>
	</body>
</html>