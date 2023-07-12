/**
 * 
 */
document.querySelector('.answer_btn').addEventListener('click', addAnswer);

const attachment_img_goto = document.querySelector(".attachment_img_goto");
const attachment_file_goto = document.querySelector(".attachment_file_goto");
const Voting_goto = document.querySelector(".Voting_goto");
const attachment_img_div = document.querySelector(".attachment_img_div");
const attachment_file = document.querySelector(".attachment_file");
const Voting = document.querySelector(".Voting");

attachment_img_goto.addEventListener("click", function(){
	attachment_img_div.style.display = "block";
	attachment_file.style.display = "none";
	Voting.style.display = "none";
});
attachment_file_goto.addEventListener("click", function(){
	attachment_file.style.display = "block";
	attachment_img_div.style.display = "none";
	Voting.style.display = "none";
});
Voting_goto.addEventListener("click", function(){
	Voting.style.display = "block";
	attachment_file.style.display = "none";
	attachment_img_div.style.display = "none";
});


const editorType = document.querySelector("#editorType");
const textType = document.querySelector("#textType");

editorType.addEventListener('change', () => {
	document.querySelector(".text_on").style.display = "none";
	document.querySelector(".editor_on").style.display = "block";
});
textType.addEventListener('change', () => {
	document.querySelector(".text_on").style.display = "block";
	document.querySelector(".editor_on").style.display = "none";
});







//답변 추가 버튼 클릭 시 실행되는 함수
function addAnswer() {
  // 답변을 추가할 부모 요소
	var votingQuestionsDiv = document.querySelector('.voting_questions_div');

    // 기존 답변 input 요소의 개수
    var answerCount = votingQuestionsDiv.querySelectorAll('.Answer').length;

    // 새로운 답변 input 요소 생성
    var newAnswerInput = document.createElement('input');
    newAnswerInput.type = 'text';
    newAnswerInput.placeholder = (answerCount + 1) + '. 답변입력';
    newAnswerInput.name = 'Answer' + (answerCount + 1);
    newAnswerInput.id = 'Answer' + (answerCount + 1);
    newAnswerInput.classList.add('Answer');

    // 새로운 답변 input 요소를 voting_questions_div 클래스에 추가
    votingQuestionsDiv.appendChild(newAnswerInput);
  }

// 답변 추가 버튼 클릭 시 addAnswer 함수 실행
