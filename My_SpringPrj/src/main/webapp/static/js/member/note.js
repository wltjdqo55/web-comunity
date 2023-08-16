
	//체크박스 전체선택 메소드
  function checkAll() {
	  const checkAllButton = document.getElementById('check-all');
    const individualButtons = document.getElementsByClassName('individual');

    for (let i = 0; i < individualButtons.length; i++) {
      individualButtons[i].checked = checkAllButton.checked;
    }
  }

  function updateCheckAll() {
	  const checkAllButton = document.getElementById('check-all');
	  const individualButtons = document.getElementsByClassName('individual');

    let allChecked = true;
    for (let i = 0; i < individualButtons.length; i++) {
      if (!individualButtons[i].checked) {
        allChecked = false;
        break;
      }
    }

    checkAllButton.checked = allChecked;
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
	    url: "deleteItemsNote",
	    traditional: true,
	    type: "post",
	    data: {"selectedItems" : selectedItems},
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
