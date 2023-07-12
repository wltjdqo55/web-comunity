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
.div-container1 {
      display: block;
    }
    .div-container2 {
      display: none;
    }
    .div-container2 th{text-align: center;}
    
    .AdminToSuper{margin-left: 20%; margin-top:10%; display: none; font-size: 25px;}
    .AdminToSuper textarea{height: 30px; width : 800px; font-size: 18px;}
    
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
<%-- 기본 값 --%>
<c:if test="${searchTime eq '0'}">
		<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0"  >이름+닉네임+ID</option>
						<option value="1" >ID</option>
						<option value="2"  >닉네임</option>
						<option value="3"  >USER</option>
						<option value="4"  >ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
			
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>Role</th>
				<th>권한</th>
				
			</tr>
			
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
      				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member.do?curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>			
</div>
	
	
</c:if>
<%-- 이름 + 닉네임 + 아이디 --%>
<c:if test="${searchTime eq '1'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" selected>이름+닉네임+ID</option>
						<option value="1" >ID</option>
						<option value="2"  >닉네임</option>
						<option value="3"  >USER</option>
						<option value="4"  >ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력" value="${search}">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>Role</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
    				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member_Search.do?curPage=${i}&category=0&search=${search}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>				
</div>
</c:if>
<%-- id로 검색 --%>
<c:if test="${searchTime eq '2'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >이름+닉네임+ID</option>
						<option value="1" selected >ID</option>
						<option value="2"  >닉네임</option>
						<option value="3"  >USER</option>
						<option value="4"  >ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력" value="${search}">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>Role</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
    				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member_Search.do?curPage=${i}&category=1&search=${search}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
</div>
</c:if>
<%-- NickName으로 검색 --%>
<c:if test="${searchTime eq '3'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >이름+닉네임+ID</option>
						<option value="1"  >ID</option>
						<option value="2"  selected>닉네임</option>
						<option value="3"  >USER</option>
						<option value="4"  >ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력" value="${search}">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>Role</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
    				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member_Search.do?curPage=${i}&category=2&search=${search}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
		
</div>
</c:if>
<%-- user검색 --%>
<c:if test="${searchTime eq '4'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >이름+닉네임+ID</option>
						<option value="1"  >ID</option>
						<option value="2" >닉네임</option>
						<option value="3"  selected>USER</option>
						<option value="4"  >ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력" value="${search}">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>생년월일</th>
				<th>Role</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
    				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member_Search.do?curPage=${i}&category=3&search=${search}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
		
</div>
</c:if>
<%-- admin검색 --%>
<c:if test="${searchTime eq '5'}">
	<div class = "container">
		<div class = "container_header">
			<div style = "float:left; width:70%; margin-left:80px; margin-top:15px;">
				<form action = "Admin_Member_Search.do" method = "post" id="myForm">
					<select name="category" id="category" title="검색선택" style = "height: 30px; border-radius:5px;">
						<option value="0" >이름+닉네임+ID</option>
						<option value="1"  >ID</option>
						<option value="2" >닉네임</option>
						<option value="3"  >USER</option>
						<option value="4"  selected>ADMIN</option>
					</select>
					<input type = "text" name = "search" class = "searchGood" id = "searchGood" style = "border-radius:5px; width:400px; height: 22px; text-indent: 7px;" placeholder="내용입력" value="${search}">
					<input type = "submit" value = "확인" style = "background-color:black; color:white; padding:4px 10px 4px 10px; cursor: pointer;">
				</form>							
			</div>
			<span style = "font-weight: bold; font-size: 24px;">회원수 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${memberCount}</span><span style = "font-weight: bold; font-size: 24px;"> 명</span>
		</div>
		<div style="">
		</div>
		<table>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>아이디</td>
				
				<td>전화번호</td>
				<td>이메일</td>
				<td>가입일</td>
				<td>생년월일</td>
				<td>Role</td>
				<td>권한</td>
			</tr>
			<c:forEach items="${list}" var="item">
			
			<tr>
				<td><c:out value="${item.num}" /></td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userNickName}" /></a>
				</td>
				<td>
					<a href = "Admin_Member_Board.do?role=${item.role}&userNickName=${item.userNickName}&userName=${item.userName}&userId=${item.userId}&userPassword=${item.userPassword}"><c:out value="${item.userId}" /></a>
				</td>
				
				<td><c:out value="${item.userPhoneNumber}" /></td>
				<td><c:out value="${item.userEmail}" /></td>
				<td><c:out value="${item.wtime}" /></td>
				<td>
					<c:set var="formattedBirth" value="${item.userBirth.toString().substring(0, 4)}-${item.userBirth.toString().substring(4, 6)}-${item.userBirth.toString().substring(6)}" />
    				<c:out value="${formattedBirth}" />
      			</td>
				<td><c:out value="${item.role}" /></td>
				<td><c:out value="${item.power}" /></td>
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
									<a href="Admin_Member_Search.do?curPage=${i}&category=4&search=${search}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
		
</div>
</c:if>
<%-- 유저 게시판 --%>
<c:if test = "${MemberBoard eq '0'}">
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
						<input type = "button" onclick = "DeleteUserSuperAdmin('${userNickName}')" style = "padding:10px; margin-left:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "회원탈퇴시키기" >
					</c:if>
				</c:if>
				<c:if test = "${sessionScope.userInfo.role eq 'super'}">
					<c:if test = "${role eq 'admin'}">
						<input type = "button" onclick = "UpdateAdmin(2, '${userNickName}')" style = "padding:10px; margin-left:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "관리자 등록해제" >
					</c:if>
				</c:if>
				<c:if test = "${sessionScope.userInfo.role eq 'admin'}">
					<input type = "button" onclick = "DeleteUserAdmin('${userNickName}')" style = "padding:10px; margin-left:30px; background-color: black; color: white; cursor: pointer; border-radius: 10px; font-size: 14px;border:none; font-weight: bold;" value = "회원탈퇴요청" >
				</c:if>
			</div>
			
				<input type = "radio" name = "optiongo" onclick="showDiv('div1')" id="radio1" checked>
				<span style = "font-weight: bold; font-size: 24px;">총 게시글 :</span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${FreeBoardCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
				<br>
				<input type = "radio"  name = "optiongo" id="radio2" onclick="navigateToLink('Admin_Member_ReplyComment.do?role=${role}&userNickName=${userNickName}&userName=${userName}&userId=${userId}&userPassword=${userPassword}')">
				<span style = "font-weight: bold; font-size: 24px;">총 댓글 : </span><span style = "color:blue;font-weight: bold; font-size:24px;"> ${replyCount}</span><span style = "font-weight: bold; font-size: 24px;"> 개</span>
				<%-- 권한 해제 --%>
				<c:if test = "${power eq '모든권한'}">
					<span style = "float:right;  padding: 2.5px; background-color:black; color:white; cursor: pointer;border-radius: 7px;" onclick = "userNickNameC('${userNickName}')">권한해제</span>
				</c:if>
				<c:if test = "${power eq '권한해제상태'}">
					<span style = "float:right;  padding: 2.5px; background-color:black; color:white; cursor: pointer;border-radius: 7px;" onclick = "powerNickNameC('${userNickName}')">권한부여</span>
				</c:if>
		</div>
		<%------- 글 테이블 --%>
		<div class = "AdminToSuper">
			<form action = "DeleteUserAdmin.do" method = "post">
				<div style = "font-weight: bold; margin:15px;">삭제사유 &nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "탈퇴요청" style = "padding:8px 12px 8px 12px; background-color:black; color:white; font-weight: bold; border:none; cursor: pointer;" class = "subi"></div>
				<textarea class = "DeleteReasons" name = "reasons"></textarea>
				<input type = "hidden" value = "${userNickName }" name = "userNickName">
				<input type = "hidden" value = "${sessionScope.userInfo.userNickName}" name = "adminNickName">
			</form>
		</div>
		<div id="div1" class="div-container div-container1">
			<table class = "userboardTable">
				<tr>
					<th class = "TD1">번호</th>
					<th class = "TD2">게시판</th>
					<th class = "TD3">카테고리</th>
					<th class = "TD4">제목</th>
					<th class = "TD5">내용</th>
					<th class = "TD6">조회수</th>
					<th class = "TD7">작성일</th>
					<th style = "width:5%; cursor: pointer;" onclick="deleteSelected()">삭제</th>
				</tr>
				<c:forEach items="${list}" var="item">
				
				<tr>
					<td class = "TD1"><c:out value="${item.num}" /></td>
					<td class = "TD2">
						<a href = "#"><c:out value="${item.boardcategory}" /></a>
					</td>
					<td class = "TD3">
						<a href = "#"><c:out value="${item.category}" /></a>
					</td>
					<td class = "TD4">
						<a href = "#"><c:out value="${item.userTitle}" /></a>
					</td>
					<td class = "TD5"><c:out value="${item.boardContent}" /></td>
					<td class = "TD6"><c:out value="${item.hit}" /></td>
					<td class = "TD7"><c:out value="${item.wtime}" /></td>
					<td class = "checkTD"><input type="checkbox" class="individual" onclick="updateCheckAll()" value = "${item.num}"></td>
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
									<a href="Admin_Member_Search.do?role=${role}&curPage=${i}&good=1&userNickName=${userNickName}&userName=${userName}&userId=${userId}&userPassword=${userPassword}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>	
			
			
					</div>
	
		
		
		
</div>

</c:if>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

function userNickNameC(userNickName){
	var confirm = window.confirm(userNickName + " 님에 대한 글쓰기 및 댓글쓰기 권한을 해제하시겠습니까?");
	if(confirm){
		$.ajax({
		    url: "User_Revocation.do",
		    type: "POST",
		    data: {
		      "userNickName" : userNickName , 
		      "good" : 1
		    },
		    dataType: "text",
		    success: function(result) {
		      if (result == 1) {
		        alert(userNickName + " 님의 모든 권한이 해제되었습니다.");
		      } else {
		        alert("오류");
		      }
		    },
		    error: function() {
		      alert("서버 요청 오류");
		    }
		  });
	}else{
		
	}
}
function powerNickNameC(userNickName){
	var confirm = window.confirm(userNickName + " 님에 대한 글쓰기 및 댓글쓰기 권한을 다시 부여하시겠습니까?");
	if(confirm){
		$.ajax({
		    url: "Power_Revocation.do",
		    type: "POST",
		    data: {
		      "userNickName" : userNickName
		    },
		    dataType: "text",
		    success: function(result) {
		      if (result == 1) {
		        alert(userNickName + " 님의 모든 권한이 부여되었습니다.");
		      } else {
		        alert("오류");
		      }
		    },
		    error: function() {
		      alert("서버 요청 오류");
		    }
		  });
	}else{
		
	}
}
    document.getElementById("category").addEventListener("change", function() {
        var selectedValue = this.value;
        
        if (selectedValue === "3" || selectedValue === "4") {
          document.getElementById("myForm").submit();
        }
      });
    function predButton(){
    	window.history.back();
    }
    
    function showDiv() {
        var divs = document.getElementsByClassName("div-container");
      
        if (document.getElementById("radio1").checked) {
          divs[0].style.display = "block";
          divs[1].style.display = "none";
        } else if (document.getElementById("radio2").checked) {
          divs[0].style.display = "none";
          divs[1].style.display = "block";
        }
        
        // 선택한 라디오 버튼의 ID를 로컬 스토리지에 저장
        var selectedOption = document.querySelector('input[name="optiongo"]:checked').id;
        localStorage.setItem('selectedOption', selectedOption);
      }
      
      window.onload = function() {
        // 이전에 선택한 라디오 버튼이 있는지 확인
        var selectedOption = localStorage.getItem('selectedOption');
        if (selectedOption) {
          // 이전에 선택한 라디오 버튼이 있다면 해당 버튼을 체크
          document.getElementById(selectedOption).checked = true;
          // 첫 페이지 로드 시에도 div를 보여줌
          showDiv();
        }
      }
      function navigateToLink(link) {
    	  if (document.getElementById("radio2").checked) {
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
    	    	"good": 1
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
  	function DeleteUserSuperAdmin(userNickName){
  		var confirm = window.confirm("슈퍼관리자의 권한으로 즉시 회원탈퇴 처리하시겠습니까?");
  		if(confirm){
  			$.ajax({
			      url: "DeleteUserUpserAdmin.do",
			      type: "post",
			      data: {"userNickName": userNickName},
			      dataType: "text",
			      success: function(result) {
			        if (result == 1) {
			          alert(userNickName + " 님의 회원탈퇴가 완료되었습니다.");
			          window.location.href = "Admin_Member.do";
			        } 
			      },
			      error: function() {
			        alert("서버 요청 실패");
			      }
			    });
  			
  			
  		}else{
  			return false;
  		}
  	}
  	function DeleteUserAdmin(userNickName){
  		document.querySelector(".div-container").style.display = "none";
  		document.querySelector(".AdminToSuper").style.display = "block";
  	}
  	var DeleteReasons = document.querySelector(".DeleteReasons");
  	var subi = document.querySelector(".subi");
  	
      
</script>





</body>
</html>