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
	<div class="container">
	<form action = "Img_Upload.do" method = "post" enctype="multipart/form-data" id = "myform">
		<div id="imageContainer" style="width: 68%; height: auto; margin: 0 auto; display: flex; align-items: center; justify-content: center;">
			<input type="file" id="imageInput" style="display: none;" onchange="previewImage(event)" name="img_file">
			<label for="imageInput" style="width: 100%; height: 100%;">
				<button type="button" onclick="document.getElementById('imageInput').click()" class = "custom-button">이미지 선택</button>
				<input type="submit" value="이미지 업로드" class = "custom-button" style = "margin:15px;" onclick = "gogoform(event)">
				<span onclick = "zxcvb(event)" style = "text-decoration: none; color: black; font-weight: bold; padding: 11px 22px; border-radius:7px; background-color: silver; cursor: pointer;">목록</span>
			</label>
		</div>
		<div id="modalContainer" style="display: none; width:68%; height: auto; margin: 0 auto;">
			<div id="modalContent" style = "margin-top: 10px;">
				<img id="modalImage" src="" style = "max-width: 80%; max-height: auto;">
			</div>
		</div>
	</form>
	</div>
	

<script>
function zxcvb(event){
	event.preventDefault();
	location.href = "Admin_ImageOK.do";
}


	function gogoform(event){
		event.preventDefault();
		var confirm = window.confirm("이미지를 등록하시겠습니까?");
		if(confirm){
			document.getElementById("myform").submit();
		}else{
			
		}
	}


	function previewImage(event) {
		var reader = new FileReader();
		var imageContainer = document.getElementById('imageContainer');
		var image = document.createElement('img'); // 새로운 이미지 요소 생성
		var modalImage = document.getElementById('modalImage');
		var modalContainer = document.getElementById('modalContainer');

		image.onload = function () {
			modalImage.src = image.src; // 모달 이미지 업데이트
			adjustImageContainer(); // 이미지 조정 함수 실행
		};

		reader.onload = function () {
			image.src = reader.result;
		};

		reader.readAsDataURL(event.target.files[0]);

		// 이미지 선택 시 모달 창 표시
		modalContainer.style.display = 'block';
	}

	function adjustImageContainer() {
		// 이미지 조정 로직은 이전과 동일합니다.
		var imageContainer = document.getElementById('imageContainer');
		var image = document.getElementById('preview');

		var containerWidth = imageContainer.offsetWidth;
		var containerHeight = imageContainer.offsetHeight;

		var imageWidth = image.naturalWidth;
		var imageHeight = image.naturalHeight;

		var widthRatio = containerWidth / imageWidth;
		var heightRatio = containerHeight / imageHeight;

		var scaleFactor = Math.min(widthRatio, heightRatio);

		var newWidth = imageWidth * scaleFactor;
		var newHeight = imageHeight * scaleFactor;

		image.style.width = newWidth + 'px';
		image.style.height = newHeight + 'px';

		var horizontalMargin = (containerWidth - newWidth) / 2;
		var verticalMargin = (containerHeight - newHeight) / 2;

		image.style.marginLeft = horizontalMargin + 'px';
		image.style.marginTop = verticalMargin + 'px';
	}

	function openModal() {
		var modalContainer = document.getElementById('modalContainer');
		modalContainer.style.display = 'block';
	}

	function closeModal() {
		var modalContainer = document.getElementById('modalContainer');
		modalContainer.style.display = 'none';
	}
</script>
</html>