package com.springbook.biz.impl.member;

import java.util.List;

import com.springbook.biz.VO.BoardVO;
import com.springbook.biz.VO.MemberVO;
import com.springbook.biz.VO.NoteVO;
import com.springbook.biz.VO.QnaVO;

public interface MemberService {
	
	//회원가입
	void join(MemberVO vo);
	
	//아이디 중복체크
	int idCheck(String idCheck);
	
	//닉네임 중복체크
	void NickNameCheck(String NickNameCheck);
	
	//아이디 비밀번호 찾기
	String idpasswordFind(MemberVO vo);
	
	//비밀번호 변경
	void passwordOK(MemberVO vo);
	
	//로그인체크
	MemberVO login(MemberVO vo);
	
	//회원정보수정
	void modify(MemberVO vo);
	
	//비밀번호변경
	void password(MemberVO vo);
	
	//회원탈퇴
	void WithdrawalOK(MemberVO vo);
	
	//메인화면 자유게시판 글 가져오기
	List<BoardVO> FreeBoard();
	
	//메인화면 오늘의 화제 글 가져오기
	List<BoardVO> TodayBoard();
	
	//자유게시판 댓글 가져오기
	int ReplyBoard(int num);
	
	//메인화면 공지/소식 글 가져오기
	List<BoardVO> NoticeBoard();
	List<BoardVO> BugBoard();
	List<BoardVO> EventBoard();
	
	//공지/소식 게시판 댓글 가져오기
	int NoticeReplyBoard(int num);
	
	//메인화면 직업게시판 글 가져오기
	List<BoardVO> AllBoard();
	List<BoardVO> WarriorBoard();
	List<BoardVO> WizardBoard();
	List<BoardVO> ArcherBoard();
	List<BoardVO> BanditBoard();
	List<BoardVO> PirateBoard();
	
	//직업게시판 댓글 가져오기
	int WarriorReplyBoard(int num);
	
	//쪽지 글 쓰기
	void note_write(NoteVO vo);
	
	//받은 쪽지 리스트 가져오기
	List<NoteVO> sendNote(String userNickName);
	
	//보낸 쪽지 리스트 가져오기
	List<NoteVO> writeNote(String userNickName);
	
	//쪽지 컨텐츠 뷰 가져오기
	NoteVO noteContentView(NoteVO vo);
	
	//쪽지 일괄 삭제
	void deleteItems(String num);
	
	//고객센터 이동
	List<MemberVO> QNA(MemberVO vo);
	
	//고객센터 문의하기
	void QNA_Write(QnaVO vo);
	
	//고객센터 컨텐츠 뷰
	QnaVO QNA_Content_View(QnaVO vo);
}








































