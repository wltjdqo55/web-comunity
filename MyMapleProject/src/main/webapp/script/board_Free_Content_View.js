// 권한이 해제된 이용자가 글쓰기 및 댓글을 누르면 이용을 막음.

const subButtons = document.querySelectorAll('.sub_r');
subButtons.forEach(function(subButton) {
  subButton.addEventListener('click', function(event) {
    if ('${sessionScope.userInfo.power}' === '권한해제상태') {
      event.preventDefault(); // submit 동작 중단
      alert('관리자에 의해 권한이 해제된 이용자입니다. 고객센터에 문의해주세요.');
    }
  });
});

function checkUserPower(event) {
	if ('${sessionScope.userInfo.power}' === '권한해제상태') {
      event.preventDefault(); // 링크 이동 중단
      alert('관리자에 의해 권한이 해제된 이용자입니다. 고객센터에 문의해주세요.');
    
  }
}

// 댓글 창 로그인이 안되어 있으면 로그인창 띄우는 메소드
var emptyComment;

emptyComment = document.querySelector(".emptyComment");
if (emptyComment) {
  emptyComment.addEventListener("focus", handleFocusOnce1);
}

function handleFocusOnce1() {
  alert("로그인 후 이용해주세요.");

  var modalPage = document.querySelector(".modalPage");
  modalPage.style.display = "block";

  emptyComment.removeEventListener("focus", handleFocusOnce1);
}
	
var emptyContent = document.querySelector(".emptyContent");
emptyContent.addEventListener("focus", handleFocusOnce);
if (emptyContent) {
  emptyContent.addEventListener("focus", handleFocusOnce);
}
function handleFocusOnce() {
  alert("로그인 후 이용해주세요.");
  
  var modalPage = document.querySelector(".modalPage");
  modalPage.style.display = "block";
  -
  emptyContent.removeEventListener("focus", handleFocusOnce);

}

// 로그인 버튼 누르면 로그인 모달 창 띄움

//var modalPage1 = document.querySelector(".modalPagedd");
var showModel = document.querySelector("#showModel");

showModel.addEventListener("click", function(){
	   documnet.querySelector(".modalPage").style.display = "block";
});

function hideModal() {
	document.querySelector(".modalPage").style.display = "none";
}
// 새로고침

var sarogochim1 = document.querySelector(".sarogochim1");


sarogochim1.addEventListener("click", function(){
	location.reload();
});
// 댓글 버튼 누르면 위로 올라오는 메소드


// 댓글 삭제하는 메소드
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
	function WarriordeleteClass(event, bnum) {
	  var confirmResult = window.confirm("삭제하시겠습니까?");
	  if (confirmResult) {
	    event.preventDefault();
	    $.ajax({
	      url: "delete_WarriorReply_Comment.do",
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
	function NoticedeleteClass(event, bnum) {
	  var confirmResult = window.confirm("삭제하시겠습니까?");
	  if (confirmResult) {
	    event.preventDefault();
	    $.ajax({
	      url: "delete_NoticeReply_Comment.do",
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
// 추천, 비추천
const recommendT = document.querySelector(".recommendT");
const fuckrecommendT = document.querySelector(".fuckrecommendT");
recommendT.addEventListener("click", function(){
	alert("로그인 후 이용해주세요.");
});
fuckrecommendT.addEventListener("click", function(){
	alert("로그인 후 이용해주세요.");
});



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

const board_free_write_no = document.querySelector("#board_free_write_no");
board_free_write_no.addEventListener("click", function(){
	alert("글쓰기 권한이 없습니다. 로그인 후 이용해주세요.");
});


