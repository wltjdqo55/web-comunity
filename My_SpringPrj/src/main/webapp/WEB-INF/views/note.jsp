<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
	.container{width:650px; height: 450px; border:1px solid gray; margin-left: 10px; margin-top:10px; display: flex;}
	
	.container_left_box{border: 1px solid black; width: 150px; margin: 5px; background-color: #f2f2f2; border-radius: 10px;}
	.container_left_inner_box{border: 1px solid black; margin: 10px; background-color: white; height: 95%; border-radius: 10px;  }
	.left_header{height: 50px; border-bottom: 2px solid #DDD;}
	.left_header span{padding-top : 14px; padding-left: 25px;position: absolute; font-size: 18px; font-family: monospace; font-weight: bold;}
	.left_content_type{height: 45px; border-bottom: 1px solid #DDD;}
	.left_content_type span{position: absolute; padding-top: 13px; padding-left: 10px; font-size: 13px;}
	.left_content_type span a{text-decoration: none; color : black;}
	.left_content_type:hover{font-weight: bold;}
	.send_span{font-weight: bold;}
	
	
	.container_right_box{border: 1px solid black; width: 500px; margin: 5px;background-color: #f2f2f2; border-radius: 10px;}
	.container_right_inner_box{border: 1px solid black; margin: 10px; background-color: white; height: 95%; border-radius: 10px;}
	.right_header{height: 25px;}
	.right_header_span{position: absolute; margin-top:10px; font-size: 14px; margin-left: 10px;}
	.right_table_div{margin: 5px;}
	.deletetime{height: 30px; margin-top: 22px;}
	
	.checkTD{width: 21px; font-size: 12px;}
	.titleTD{width: 200px; font-size: 12px;}
	.tosendTD{width:80px;  font-size: 12px;}
	.wtimeTD{width: 120px; font-size: 12px;}
	.titleTD a{text-decoration: none; color: black;}
	.btn_delete{padding:3px 10px 3px 10px; margin-left: 10px;}
	.pageP{text-align: center; height: 30px; margin-top: 15px; font-size: 15px; color: black;}
	.pageP a{color: black; text-decoration: none;}
	.spanspans{border:1px solid #DDD; padding:5px 10px 5px 10px ; color: #7fcdff;}
	
	.zxs{color: #ff3f3f; font-weight: bold;}
</style>
</head>
<body>
<div class = "container">
	<div class = "container_left_box">
		<div class = "container_left_inner_box">
			<div class = "left_header">
				<span>쪽지함</span> 
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span writing_span"><a href = "note_writing">▶ 쪽지 보내기</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span send_span"><a href = "note">▶ 받은 쪽지함</a></span>
			</div>
			<div class = "left_content_type">
				<span class = "left_content_type_span write_span"><a href = "note_write">▶ 보낸 쪽지함</a></span>
			</div>
		</div>
	</div>
	<div class = "container_right_box">
		<div class = "container_right_inner_box">
			<div class = "right_header">
				<span class = "right_header_span"><span style = "font-size : 20px;">📬</span> ${sessionScope.userInfo.userNickName}님의 <span style ="color:#f37736;">받은 편지함</span>입니다.</span>
			</div>
			<div class = "deletetime">
				<button class = "btn_delete" onclick="deleteSelected()">삭제</button>
			</div>
			<div class = "right_table_div">
			<table border = "1">
				<tr>
					<td class = "checkTD"><input type="checkbox" id="check-all" onclick="checkAll()"></td>
					<td class = "titleTD">제목</td>
					<td class = "tosendTD">보낸사람</td>
					<td class = "wtimeTD">날짜</td>
				</tr>
				<c:forEach items = "${writestorage}" var = "list">
				<tr>
					<td class = "checkTD"><input type="checkbox" class="individual" onclick="updateCheckAll()" value = "${list.num}"></td>
					<td class = "titleTD"><a href = "note_content_view?num=<c:out value="${list.num}" />&userNickName=<c:out value="${list.userNickName}" />"><c:out value="${list.title}" /></a></td>
					<td class = "tosendTD"><c:out value="${list.userNickName}" /></td>
					<td class = "wtimeTD"><c:out value="${list.wtime}" /></td>
				</tr>
				</c:forEach>
			</table>
			
	<div class="pageP">
		1
		<%-- 
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
									<a href="note.do?curPage=${i}">${i+1}</a>
								</c:when>
							</c:choose> 		
						</c:forEach>
					  
					</div>				
			--%>
		</div>
	</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value='/static/js/member/note.js'/>"></script>

</body>
</html>