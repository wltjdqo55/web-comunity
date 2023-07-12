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

.container{width: 80%; height: 80vh;   margin-top:40px;margin : 0 auto; margin-top: 100px;}
.custom-button {
		padding: 10px 20px;
		font-size: 16px;
		background-color: #4CAF50;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	.custom-button:hover {
		background-color: #45a049;
	}

	.custom-button:focus {
		outline: none;
	}
	 .max-size-image {
        max-width: 100%; /* 최대 가로 크기 설정 */
        max-height: 100%; /* 최대 세로 크기 설정 */
        width: 100%; /* 가로 크기 자동 조정 */
        height: auto; /* 세로 크기 자동 조정 */
    }
	.delete-button {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: transparent;
        border: none;
        color: red;
        font-weight: bold;
        font-size: 16px;
        cursor: pointer;
    }
	/* 모달 스타일 */
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
				<span><a href = "Admin_Member.do">회원관리</a></span>
				<span><a href = "Admin_Board.do">게시판관리</a></span>
				<span><a href = "Admin_Notice.do">공지/문의</a></span>
				<span><a href = "Admin_Image.do" style = "color:blue;">이미지등록</a></span>
				<span><a href = "Admin_Report.do">신고</a></span>
			</div>
		</div>
	</div>
	<div class="container" style = "margin-bottom: 500px;">
		<c:forEach items = "${img}" var = "img">
			<div style = "width: 70%; margin: 0 auto; position: relative; margin-top:30px; ">
				<img src = "fileFolder/${img}" class = "max-size-image">			
				 <button class="delete-button" onclick="deleteImage(event, '${img}')">x</button>
			</div>
		</c:forEach>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script>
function deleteImage(event, img) {
    event.stopPropagation();
    var confirmed = window.confirm("이미지를 삭제하시겠습니까?");
    if (confirmed) {
        $.ajax({
            url: "deleteIMG.do",
            type: "POST",
            data: {
            	"img" : img	
            }, 
            dataType: "text",
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
        // 확인이 취소된 경우에 대한 처리
    }
}



</script>
</body>
</html>