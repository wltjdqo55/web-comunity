<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
table{width:90%; margin : 0 auto; border-collapse: collapse;table-layout: fixed;
}
.container_header{height: 50px; width: 90%; margin-bottom: 30px; display: flex;}
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

.TD1{width: 10%; text-align: center;}
.TD2{width: 8%;text-align: center;}
.TD3{width: 7%;text-align: center;}
.TD4 {text-overflow:ellipsis; overflow:hidden; white-space: nowrap;width: 43%;}
.TD5{width: 6%;text-align: center;}
.TD6{width: 6%;text-align: center;}
.TD7{width: 15%;text-align: center;}
</style>
<body>
<div class = "header" style = "width: 100%; display: flex;">
	<div class = "header_header">
		<div class = "headerBar">
			<span><a href = "index.do">HOME</a></span>
			<c:if test = "${sessionScope.userInfo.role eq 'super'}">
				<span><a href = "Admin_Request.do">관리자요청</a></span>
			</c:if>
			<span><a href = "Admin.do">통계</a></span>
			<span><a href = "Admin_Member.do" >회원관리</a></span>
			<span><a href = "Admin_Board.do" style = "color:blue;">게시판관리</a></span>
			<span><a href = "Admin_Notice.do">공지/문의</a></span>
			<span><a href = "Admin_Image.do">이미지등록</a></span>
			<span><a href = "Admin_Report.do">신고</a></span>
		</div>
	</div>
</div>

<c:if test = "${searchTime eq '0'}">

<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:45%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Board_Search2.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0"  >제목 + 내용</option>
						<option value="1" >게시판</option>
						<option value="2"  >닉네임</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>			
			</div>
			<div style = "width:30%;">
				<input type = "radio" name = "rad" id = "radio1" onclick="navigateToLink1('Admin_Board.do')">&nbsp; 자유게시판 : ${boardCount} 개<br>
				<input type = "radio" name = "rad" id = "radio2" onclick="navigateToLink('Admin_Board1.do')">&nbsp; 직업게시판 : ${WarriorCount} 개<br>
				<input type = "radio" name = "rad" id = "radio3" checked>&nbsp; 정보공유게시판 : ${NoticeCount} 개				
			</div>
			<div style = "width:25%; float: right;">
				<span style = "font-weight: bold; font-size: 24px;">총 게시글 수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${boardCount+WarriorCount+NoticeCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>			
			</div>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th class = "TD1"><a href = "Admin_Board_Boardcategory.do" style = "text-decoration: none; color: black;">게시판</a></th>
				<th class = "TD2">카테고리</th>
				<th class = "TD3">닉네임</th>
				<th class = "TD4">제목</th>
				<th class = "TD5"><a href = "Admin_Board_Hit.do" style = "text-decoration: none; color: black;">조회수</a></th>
				<th class = "TD6"><a href = "Admin_Board_Recommend.do" style = "text-decoration: none; color: black;">추천수</a></th>
				<th class = "TD7"><a href = "Admin_Board_Wtime.do" style = "text-decoration: none; color: black;">작성일</a></th>
			</tr>
			
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td class = "TD1"><c:out value="${item.boardcategory}" /></td>
				<td class = "TD2">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.category}" /></a>
				</td>
				<td class = "TD3">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td class = "TD4">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}">
					<c:out value="${item.userTitle}" />
					<c:if test="${item.comment ne 0}">
						<span style = "color:red; font-weight: bold;">[<c:out value="${item.comment}" />]</span>
					</c:if>
					<c:choose>
					    <c:when test="${not empty item.img_file || not empty item.img_file1 || not empty item.pub_file1 || not empty item.pub_file2}">
					        <span class = "zcmv"><img src="https://emoticon.emoticbox.com/dist/png/tab/123456789" class = "imgem"></span>
					    </c:when>
					</c:choose>
					</a>
				</td>
				<td class = "TD5">
					<c:out value="${item.hit}" />
				</td>
				<td class = "TD6">
					<c:out value="${item.recommend}" />
				</td>
				<td class = "TD7"><c:out value="${item.wtime}" /></td>
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
									<a href="Admin_Board2.do?curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>		
		

</div>
</c:if>

<c:if test="${searchTime eq '1'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:45%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Board_Search2.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" selected>제목 + 내용</option>
						<option value="1" >게시판</option>
						<option value="2"  >닉네임</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<div style = "width:30%;">
			<input type = "radio" name = "rad" id = "radio1" onclick="navigateToLink1('Admin_Board.do')">&nbsp; 자유게시판 : ${boardCount} 개<br>
				<input type = "radio" name = "rad" id = "radio2" onclick="navigateToLink('Admin_Board1.do')">&nbsp; 직업게시판 : ${WarriorCount} 개<br>
				<input type = "radio" name = "rad" id = "radio3" checked>&nbsp; 정보공유게시판 : ${NoticeCount} 개		
			</div>
			<div style = "width:25%; float: right;">
			<span style = "font-weight: bold; font-size: 24px;">총 게시글 수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${boardCount+WarriorCount+NoticeCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
			</div>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th class = "TD1"><a href = "Admin_Board_Boardcategory.do" style = "text-decoration: none; color: black;">게시판</a></th>
				<th class = "TD2">카테고리</th>
				<th class = "TD3">닉네임</th>
				<th class = "TD4">제목</th>
				<th class = "TD5"><a href = "Admin_Board_Hit.do" style = "text-decoration: none; color: black;">조회수</a></th>
				<th class = "TD6"><a href = "Admin_Board_Recommend.do" style = "text-decoration: none; color: black;">추천수</a></th>
				<th class = "TD7"><a href = "Admin_Board_Wtime.do" style = "text-decoration: none; color: black;">작성일</a></th>
			</tr>
			
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td class = "TD1"><c:out value="${item.boardcategory}" /></td>
				<td class = "TD2">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.category}" /></a>
				</td>
				<td class = "TD3">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td class = "TD4">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userTitle}" />
					<c:if test="${item.comment ne 0}">
						<span style = "color:red; font-weight: bold;">[<c:out value="${item.comment}" />]</span>
					</c:if>
					<c:choose>
					    <c:when test="${not empty item.img_file || not empty item.img_file1 || not empty item.pub_file1 || not empty item.pub_file2}">
					        <span class = "zcmv"><img src="https://emoticon.emoticbox.com/dist/png/tab/123456789" class = "imgem"></span>
					    </c:when>
					</c:choose>
					
					</a>
				</td>
				<td class = "TD5">
					<c:out value="${item.hit}" />
				</td>
				<td class = "TD6">
					<c:out value="${item.recommend}" />
				</td>
				<td class = "TD7"><c:out value="${item.wtime}" /></td>
			</tr>
			
			</c:forEach>
			
		</table>
		<table>
		
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
									<a href="Admin_Board_Search2.do?category=0&search=${search}&curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>		
					
</div>

</c:if>

<c:if test="${searchTime eq '2'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:45%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Board_Search2.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >제목 + 내용</option>
						<option value="1" selected>게시판</option>
						<option value="2"  >닉네임</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<div style = "width:30%;">
				<input type = "radio" name = "rad" id = "radio1" onclick="navigateToLink1('Admin_Board.do')">&nbsp; 자유게시판 : ${boardCount} 개<br>
				<input type = "radio" name = "rad" id = "radio2" onclick="navigateToLink('Admin_Board1.do')">&nbsp; 직업게시판 : ${WarriorCount} 개<br>
				<input type = "radio" name = "rad" id = "radio3" checked>&nbsp; 정보공유게시판 : ${NoticeCount} 개		
			</div>
			<div style = "width:25%; float: right;">
			<span style = "font-weight: bold; font-size: 24px;">총 게시글 수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${boardCount+WarriorCount+NoticeCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
			</div>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th class = "TD1"><a href = "Admin_Board_Boardcategory.do" style = "text-decoration: none; color: black;">게시판</a></th>
				<th class = "TD2">카테고리</th>
				<th class = "TD3">닉네임</th>
				<th class = "TD4">제목</th>
				<th class = "TD5"><a href = "Admin_Board_Hit.do" style = "text-decoration: none; color: black;">조회수</a></th>
				<th class = "TD6"><a href = "Admin_Board_Recommend.do" style = "text-decoration: none; color: black;">추천수</a></th>
				<th class = "TD7"><a href = "Admin_Board_Wtime.do" style = "text-decoration: none; color: black;">작성일</a></th>
			</tr>
			
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td class = "TD1"><c:out value="${item.boardcategory}" /></td>
				<td class = "TD2">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.category}" /></a>
				</td>
				<td class = "TD3">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td class = "TD4">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userTitle}" />
					<c:if test="${item.comment ne 0}">
						<span style = "color:red; font-weight: bold;">[<c:out value="${item.comment}" />]</span>
					</c:if>
					<c:choose>
					    <c:when test="${not empty item.img_file || not empty item.img_file1 || not empty item.pub_file1 || not empty item.pub_file2}">
					        <span class = "zcmv"><img src="https://emoticon.emoticbox.com/dist/png/tab/123456789" class = "imgem"></span>
					    </c:when>
					</c:choose>
					</a>
				</td>
				<td class = "TD5">
					<c:out value="${item.hit}" />
				</td>
				<td class = "TD6">
					<c:out value="${item.recommend}" />
				</td>
				<td class = "TD7"><c:out value="${item.wtime}" /></td>
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
									<a href="Admin_Board_Search2.do?category=1&search=${search}&curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
</div>

</c:if>

<c:if test="${searchTime eq '3'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:45%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Board_Search2.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >제목 + 내용</option>
						<option value="1" >게시판</option>
						<option value="2" selected>닉네임</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<div style = "width:30%;">
				<input type = "radio" name = "rad" id = "radio1" onclick="navigateToLink1('Admin_Board.do')">&nbsp; 자유게시판 : ${boardCount} 개<br>
				<input type = "radio" name = "rad" id = "radio2" onclick="navigateToLink('Admin_Board1.do')">&nbsp; 직업게시판 : ${WarriorCount} 개<br>
				<input type = "radio" name = "rad" id = "radio3" checked>&nbsp; 정보공유게시판 : ${NoticeCount} 개	
			</div>
			<div style = "width:25%; float: right;">
			<span style = "font-weight: bold; font-size: 24px;">총 게시글 수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${boardCount+WarriorCount+NoticeCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
			</div>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th class = "TD1"><a href = "Admin_Board_Boardcategory.do" style = "text-decoration: none; color: black;">게시판</a></th>
				<th class = "TD2">카테고리</th>
				<th class = "TD3">닉네임</th>
				<th class = "TD4">제목</th>
				<th class = "TD5"><a href = "Admin_Board_Hit.do" style = "text-decoration: none; color: black;">조회수</a></th>
				<th class = "TD6"><a href = "Admin_Board_Recommend.do" style = "text-decoration: none; color: black;">추천수</a></th>
				<th class = "TD7"><a href = "Admin_Board_Wtime.do" style = "text-decoration: none; color: black;">작성일</a></th>
			</tr>
			
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td class = "TD1"><c:out value="${item.boardcategory}" /></td>
				<td class = "TD2">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.category}" /></a>
				</td>
				<td class = "TD3">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td class = "TD4">
					<a href = "Admin_Board_Content_View2.do?num=${item.num}"><c:out value="${item.userTitle}" />
					<c:if test="${item.comment ne 0}">
						<span style = "color:red; font-weight: bold;">[<c:out value="${item.comment}" />]</span>
					</c:if>
					<c:choose>
					    <c:when test="${not empty item.img_file || not empty item.img_file1 || not empty item.pub_file1 || not empty item.pub_file2}">
					        <span class = "zcmv"><img src="https://emoticon.emoticbox.com/dist/png/tab/123456789" class = "imgem"></span>
					    </c:when>
					</c:choose>
					</a>
				</td>
				<td class = "TD5">
					<c:out value="${item.hit}" />
				</td>
				<td class = "TD6">
					<c:out value="${item.recommend}" />
				</td>
				<td class = "TD7"><c:out value="${item.wtime}" /></td>
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
									<a href="Admin_Board_Search2.do?category=2&search=${search}&curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
</div>

</c:if>



</body>
<script>
function navigateToLink1(link) {
	  if (document.getElementById("radio1").checked) {
	    window.location.href = link;
	  }
}
function navigateToLink(link) {
	  if (document.getElementById("radio2").checked) {
	    window.location.href = link;
	  }
	}
document.getElementById("category").addEventListener("change", function() {
	  var selectedValue = this.value;
	  
	  if (selectedValue === "3" || selectedValue === "4") {
	    document.getElementById("myForm").submit();
	  }
	});
window.addEventListener("load", function() {
	  var savedSearch = localStorage.getItem("searchText");
	  if (savedSearch) {
	    document.getElementById("searchGood").value = savedSearch;
	  }
	});

	// 폼 제출 시 검색어를 저장
	document.getElementById("myForm").addEventListener("submit", function() {
	  var searchText = document.getElementById("searchGood").value;
	  localStorage.setItem("searchText", searchText);
	});
</script>
</html>