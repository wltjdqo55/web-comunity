<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{margin:0;padding:0;width:100%; height: auto;}
.header{width:100%;  margin-right:0; }
.header_header{width: 100%;}
.headerBar{width: 90%; height: 60px; text-align: right; margin-top:30px; margin-right: 30px;}
.headerBar a{text-decoration: none; color : black; font-size: 24px; font-weight: bold;  }
.headerBar span{margin-left:5%;margin-top:10%; }
.zxs{color: #ff3f3f; font-weight: bold;}
tr:hover{background-color:#e3e4e6;}
.container{width: 100%; height: auto;margin-top:15px;}
table{width:90%; margin : 0 auto; border-collapse: collapse;}
.container_header{height: 50px; width: 90%; margin-bottom: 30px;}
.pageP{width:90%; margin : 0 auto;  text-align: center; margin-top: 30px; }
.pageP a{color: black; text-decoration: none;}
.spanspans{border:1px solid #DDD; padding:5px 10px 5px 10px ; color: #7fcdff;}
 td {
    padding: 4px;
    border-bottom: 1px solid #ddd;
  }
  
  /* 짝수 행 스타일 */
  tr:nth-child(even) {
    background-color: #f9f9f9;
  }
  
  /* 마우스 호버 스타일 */
  tr:hover {
    background-color: #e6e6e6;
  }
 th {
    background-color: #f2f2f2;
    text-align: left;
    padding: 8px;
    
  }
 td:first-child, th:first-child{
    text-align: center;
  }
  
  /* 마지막 td 스타일 */
  td:last-child, th:last-child {
    text-align: center;
  }
td a{text-decoration: none; color: black;}

.userboardTable{table-layout: fixed;}

.TD5, .TD4 {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.TD1, .TD2, .TD3, .TD6 {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 1px;
  width:8%;
}
.TD5{width: 30%;}
.TD6{text-align: center; }
.TD11{width:5%;text-align: center;}
.TD22{width:8%;text-align: center;}
.TD33{width:70%;overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;}
.TD44{width:20%;text-align: center;}
    .div-container2 th{text-align: center;}
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
			<span><a href = "Admin.do">통계</a></span>
			<span><a href = "Admin_Member.do" style = "color:blue;">회원관리</a></span>
			<span><a href = "Admin_Board.do">게시판관리</a></span>
			<span><a href = "Admin_Notice.do">공지/문의</a></span>
			<span><a href = "Admin_Image.do">이미지등록</a></span>
			<span><a href = "Admin_Report.do">신고</a></span>
		</div>
	</div>
</div>

<%-- 유저 게시판 --%>
<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<span style = "font-weight: bold; font-size: 19px;">닉네임 :</span> <span style = "color:blue;font-weight: bold; font-size:19px;">${userNickName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style = "font-weight: bold; font-size: 19px;">아이디 :</span> <span style = "color:blue;font-weight: bold; font-size:19px;">${userId}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style = "font-weight: bold; font-size: 19px;">이름 :</span> <span style = "color:blue;font-weight: bold; font-size:19px;">${userName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style = "font-weight: bold; font-size: 19px;">비밀번호 :</span> <span style = "color:blue;font-weight: bold; font-size:19px;">${userPassword}</span>
				<c:if test = "${sessionScope.userInfo.role eq 'super'}">
					<c:if test = "${role eq 'user'}">
					<input type = "button" onclick = "UpdateAdmin(1, '${userNickName}')" style = "padding:10px; margin-left:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "관리자 등록" >
					</c:if>
				</c:if>
				<c:if test = "${sessionScope.userInfo.role eq 'super'}">
					<c:if test = "${role eq 'admin'}">
					<input type = "button" onclick = "UpdateAdmin(2, '${userNickName}')" style = "padding:10px; margin-left:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "관리자 등록해제" >
					</c:if>
					
				</c:if>
			</div>
			
				<input type = "radio" name = "optiongo" id="radio1" onclick="navigateToLink('Admin_Member_Board.do?role=${role}&userNickName=${userNickName}&userName=${userName}&userId=${userId}&userPassword=${userPassword}')">
				<span style = "font-weight: bold; font-size: 24px;">총 게시글 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${FreeBoardCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
				<br>
				<input type = "radio" name = "optiongo" id="radio2" checked>
				<span style = "font-weight: bold; font-size: 24px;">총 댓글 : </span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${replyCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
				
		</div>
		
		
		<%------- 댓글 테이블 --%>
		<div id="div2" class="div-container div-container2">
			<table class = "userboardTable">
				<tr>
					<th class = "TD11">번호</th>
					<th class = "TD22">게시판</th>
					<th class = "TD33">내용</th>
					<th class = "TD44">작성일</th>
					<th style = "width:5%; cursor: pointer;" onclick="deleteSelected()">삭제</th>
				</tr>
				<c:forEach items="${replylist}" var="item">
				
				<tr>
					<td class = "TD11"><c:out value="${item.num}" /></td>
					<td class = "TD22">
						<a href = "#"><c:out value="${item.boardcategory}" /></a>
					</td>
					<td class = "TD33">
						<a href = "#"><c:out value="${item.replytext}" /></a>
					</td>
					<td class = "TD44"><c:out value="${item.wtime}" /></td>
					<td class = "checkTD"><input type="checkbox" class="individual" onclick="updateCheckAll()" value = "${item.bnum}"></td>
				</tr>
				
				</c:forEach>
			</table>
				<button onclick="predButton()" style="padding:5px 10px 5px 10px;display:inline-block;float:left; margin-left:80px; margin-top:10px;">이전</button>
					
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
									<a href="Admin_Member_ReplyComment.do?role=${role}&curPage=${i}&good=2&userNickName=${userNickName}&userName=${userName}&userId=${userId}&userPassword=${userPassword}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>		
		</div>
		
		
		
</div>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    
    document.getElementById("category").addEventListener("change", function() {
        var selectedValue = this.value;
        
        if (selectedValue === "3" || selectedValue === "4") {
          document.getElementById("myForm").submit();
        }
      });
    function predButton(){
    	window.history.back();
    }
    function navigateToLink(link) {
  	  if (document.getElementById("radio1").checked) {
  	    window.location.href = link;
  	  }
  	}
    //삭제 버튼 누르면 체크박스 값들 에이작스로 보내기 위한 메소드
    function deleteSelected() {
  	  var checkboxes = document.getElementsByClassName('individual');
  	  var selectedItem = [];

  	  // 체크된 항목들을 확인하고 선택된 항목들을 배열에 추가
  	  
  	  for (var i = 0; i < checkboxes.length; i++) {
  	    if (checkboxes[i].checked) {
  	      "'"+selectedItem.push(checkboxes[i].value)+"'";
  	    }
  	  }

  	  if (selectedItem.length === 0) {
  	    alert("삭제할 항목을 선택해주세요.");
  	    return;
  	  }
  	  
  	var selectedItems = selectedItem;
  	
  	  $.ajax({
  	    url: "Admin_deleteItemsMember_Board.do",
  	    traditional: true,
  	    type: "post",
  	    data: {
  	    	"selectedItems" : selectedItems,
  	    	"good": 2
  	    	
  	    },
  	    dataType: "text",
  	    success: function(result) {
  	      // 삭제 성공 시 처리할 내용
  	      alert("선택된 항목이 삭제되었습니다.");
  	      location.reload(); // 페이지 새로고침
  	    },
  	    error: function() {
  	      alert("서버 요청 실패");
  	    }
  	  });
  	} 
 // 관리자 해제 or 관리자 등록
    function UpdateAdmin(value, userNickName) {
		  if (value === 1) {
		    var confirmation = window.confirm(userNickName + " 님을 관리자로 등록하시겠습니까?");
		  } else if (value === 2) {
		    var confirmation = window.confirm(userNickName + " 님을 관리자에서 등록해제하시겠습니까?");
		  } else {
		    return false;
		  }
		
		  if (confirmation) {
			  if(value===1){
				    $.ajax({
				      url: "Admin_Update_Member.do",
				      type: "post",
				      data: {
				        "goto": 1,
				        "userNickName": userNickName
				      },
				      dataType: "text",
				      success: function(result) {
				        if (result == 1) {
				          alert(userNickName + " 님이 관리자로 등록되었습니다.");
				          window.location.href = "Admin_Member.do";
				        } 
				      },
				      error: function() {
				        alert("서버 요청 실패");
				      }
				    });
			  }else if(value===2){
				  $.ajax({
				      url: "Admin_Update_Member.do",
				      type: "post",
				      data: {
				        "goto": 2,
				        "userNickName": userNickName
				      },
				      dataType: "text",
				      success: function(result) {
				       if (result == 2) {
				          alert(userNickName + " 님이 관리자에서 등록해제되었습니다.");
				          window.location.href = "Admin_Member.do";
				        }
				      },
				      error: function() {
				        alert("서버 요청 실패");
				      }
				    });
			  }
		  }
}
      
</script>





</body>
</html>