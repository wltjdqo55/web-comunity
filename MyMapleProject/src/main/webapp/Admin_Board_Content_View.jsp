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

.container{width: 80%; height: auto;   margin-top:50px;margin : 0 auto; display: flex; margin-bottom: 100px;}
.container_left{width: 60%; height:auto; border : 1px solid black;}
.container_right{width: 40%; height:auto; border: 1px solid black;}

.center_title{height: 60px; width: 100%; display: flex; background-color: #DDD;}
.NickName_title{width:33%; text-align: left; font-size: 20px;}
.NickName_title div{margin : 15px;}
.wtime_title{width: 33%; text-align: center;font-size: 20px;}
.wtime_title div{margin: 15px;}
.right_title{width: 33%; text-align: right;font-size: 20px;}
.right_title div{margin:15px;}

.center_big{margin-top : 30px; padding:10px; font-size: 22px; width: 95%;}
.center_content_div{ width:100%;  margin-top: 10px; text-align: left; margin-left: 10px; line-height: 1.8; margin-bottom:100px; height: auto;}
.zkzk{text-align:center;max-width: 700px;max-height: 700px;width: auto;height: auto;}
.userCo{width:100%;vw; height: auto; border-top: 1px solid #DDD; border-bottom: 1px solid #DDD;}
.userKN{display:flex; height: 40px;}
.userKN_left{width:50%;;  text-align: left; margin-left: 15px;} 
.userKN_right{width:50%;;  text-align: right; margin-right: 15px;}
.userKN_right span{width:24px; height:14px; border: 1px solid gray; border-radius: 5px; padding:2px; cursor: pointer;}
.Dfds{margin-top: 8px; margin-bottom: 8px;}
.Dfdsd{margin-top: 10px; margin-bottom: 4px;}

.Rre_Co{text-align: right; color: gray; font-size: 14px; margin-right: 15px;}

.dfjfj{width:100%;; text-align:right;font-size: 13px; color: gray; margin: 10px; }
.dfjtj>span{margin-top: 10px; margin-right: 35px;}

.conta_b{width: 100%;; margin: 10px; background-color: #e3e4e6; height: auto; display:none;}
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
.userCoc{width:90%;; height: auto; border-top: 1px solid #DDD; border-bottom: 1px solid gray; background-color: #dfe3ee; }
.conta_a{width: 90%;; margin: 10px; background-color: #e3e4e6; height: auto;}
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
				<span><a href = "Admin_Board.do" style = "color:blue;">게시판관리</a></span>
				<span><a href = "Admin_Notice.do">공지/문의</a></span>
				<span><a href = "Admin_Image.do">이미지등록</a></span>
				<span><a href = "Admin_Report.do">신고</a></span>
			</div>
		</div>
	</div>
	<div class = "container">
		<div class = "container_left">
			<div class = "center_title">
				<div class = "NickName_title"><div>${dto.userNickName }</div></div>
				<div class = "wtime_title"><div>${dto.wtime }</div></div>
				<div class = "right_title"><div>조회: ${dto.hit } &nbsp;&nbsp;&nbsp;추천: ${dto.recommend }</div></div>
			</div>
			<div class = "center_big" style = "display: flex;">
				<div style = "width:77%;">
					<span>[${dto.category}]</span>
					<span class = "center_big_span">${dto.userTitle}</span>				
				</div>
				<div style = "width: 23%;">
					<span style ="float:right; font-size: 17px; font-weight: bold;">
						<a href = "Admin_board_free_delete.do?num=${dto.num}" onclick="return confirmDelete();" style="text-decoration: none; color: black;">게시글 삭제</a>
					</span>
				</div>
			</div>
			<div class = "center_content_div">
			<div style = "margin-top: 50px;margin-bottom:130px;">
					${dto.boardContent}
				</div>
			</div>
		</div>
		<div class = "container_right">
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
													
													<a href="#" onclick = "deleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
																							
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
													
													<a href="#" onclick = "deleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
																							
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
							<form action = "board_Free_Dabgle.do" method = "post">
							<div class = "dabgle_div">
								
								<input type = "hidden" value = "<c:out value="${replylist.stepNum}" />" name = "stepNum">
								<input type = "hidden" value = "<c:out value="${replylist.groupNum}" />" name = "groupNum">
							</div>
							</form>
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
											
											<a href="#" onclick = "deleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
																						
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
											
											<a href="#" onclick = "deleteClass(event, ${replylist.bnum})" style= "text-decoration: none; color: black;font-weight: bold;cursor: pointer;">✖</a>
																					
										</span>
										</div>
									</c:if>
								
								</div>
								<div class = "input_Co">
									<span><c:out value="${replylist.replytext}" /></span>
								</div>
							<form action = "board_Free_Dabgle.do" method = "post">
								<div class = "Rre_Co">
									<input type = "hidden" value = "<c:out value="${replylist.stepNum}" />" name = "stepNum">
									<input type = "hidden" value = "<c:out value="${replylist.groupNum}" />" name = "groupNum">
								</div>
							</form>
							</div>
							
							<div class = "dabgle_div">
								
						
							</div>
						
						</div>
						</c:if>
						</c:forEach>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function deleteClass(event, bnum) {
		  var confirmResult = window.confirm("삭제하시겠습니까?");
		  if (confirmResult) {
		    event.preventDefault();
		    $.ajax({
		      url: "delete_Reply_Comment.do",
		      type: "post",
		      data: {"bnum": bnum},
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
		  } else {
		    event.preventDefault();
		  }
		}
	function confirmDelete() {
	    return confirm("게시글을 삭제하시겠습니까?");
	  }
    </script>
</html>