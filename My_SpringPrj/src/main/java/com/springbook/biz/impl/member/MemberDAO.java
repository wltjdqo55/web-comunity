package com.springbook.biz.impl.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.VO.BoardVO;
import com.springbook.biz.VO.MemberVO;
import com.springbook.biz.VO.NoteVO;
import com.springbook.biz.VO.QnaVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입
	public void join(MemberVO vo) {
		mybatis.insert("MemberDAO.join", vo);
	}
	
	//아이디 비밀번호 찾기
	public String idpasswordFind(MemberVO vo) {
		String member = mybatis.selectOne("MemberDAO.idpasswordFind", vo);
		return member;
	}
	
	//비밀번호 변경
	public void passwordOK(MemberVO vo) {
		mybatis.update("MemberDAO.passwordOK", vo);
	}
	
	//아이디 중복체크
	public int idCheck(String idCheck) {
		int count = mybatis.selectOne("MemberDAO.idCheck", idCheck);
		return count;
	}
	
	//닉네임 중복체크
	public void NickNameCheck(String NickNameCheck) {
		mybatis.selectOne("MemberDAO.NickNameCheck", NickNameCheck);
	}
	
	//로그인체크
	public MemberVO login(MemberVO vo) {
		MemberVO voo = mybatis.selectOne("MemberDAO.login", vo);
		return voo;
	}
	
	//회원정보수정
	public void modify(MemberVO vo) {
		mybatis.update("MemberDAO.modify", vo);
	}
	
	//비밀번호변경
	public void password(MemberVO vo) {
		mybatis.update("MemberDAO.password", vo);
	}
	
	//회원탈퇴
	public void WithdrawalOK(MemberVO vo) {
		mybatis.delete("MemberDAO.WithdrawalOK", vo);
	}
	
	//메인화면 자유게시판 글 가져오기
	public List<BoardVO> FreeBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.FreeBoard");
		return list;
	}
	
	//메인화면 게시판 댓글 가져오기
	public int ReplyBoard(int num) {
		int count = mybatis.selectOne("MemberDAO.ReplyBoard", num);
		return count;
	}
	
	//메인화면 오늘의 화제 글 가져오기
	public List<BoardVO> TodayBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.TodayBoard");
		return list;
	}
	
	//메인화면 공지/소식/버그제보 글 가져오기
	public List<BoardVO> NoticeBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.NoticeBoard");
		return list;
	}
	public List<BoardVO> BugBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.BugBoard");
		return list;
	}
	public List<BoardVO> EventBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.EventBoard");
		return list;
	}
	
	//메인화면 공지/소식게시판 댓글 가져오기
	public int NoticeReplyBoard(int num) {
		int count = mybatis.selectOne("MemberDAO.NoticeReplyBoard", num);
		return count;
	}
	
	//메인화면 직업게시판 글 가져오기
	public List<BoardVO> AllBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.AllBoard");
		return list;
	}
	public List<BoardVO> WarriorBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.WarriorBoard");
		return list;
	}
	public List<BoardVO> WizardBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.WizardBoard");
		return list;
	}
	public List<BoardVO> ArcherBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.ArcherBoard");
		return list;
	}
	public List<BoardVO> BanditBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.BanditBoard");
		return list;
	}
	public List<BoardVO> PirateBoard(){
		List<BoardVO> list = mybatis.selectList("MemberDAO.PirateBoard");
		return list;
	}

	//메인화면 공지/소식게시판 댓글 가져오기
	public int WarriorReplyBoard(int num) {
		int count = mybatis.selectOne("MemberDAO.WarriorReplyBoard", num);
		return count;
	}
	
	//쪽지 글 쓰기
	public void note_write(NoteVO vo) {
		mybatis.insert("MemberDAO.NoteWrite", vo);
	}

	//받은 쪽지 리스트 가져오기
	public List<NoteVO> sendNote(String userNickName){
		List<NoteVO> list = mybatis.selectList("MemberDAO.SendNote", userNickName);
		return list;
	}
	
	//보낸 쪽지 리스트 가져오기
	public List<NoteVO> writeNote(String userNickName){
		List<NoteVO> list = mybatis.selectList("MemberDAO.WriteNote", userNickName);
		return list;
	}
	
	//쪽지 컨텐츠 뷰 이동
	public NoteVO noteContentView(NoteVO vo) {
		NoteVO note = mybatis.selectOne("MemberDAO.NoteContentView", vo);
		return note;
	}

	//쪽지 일괄 삭제
	public void deleteItems(String num) {
		mybatis.delete("MemberDAO.DeleteItems", Integer.parseInt(num));
	}

	//고객센터 페이지 이동
	public List<MemberVO> QNA(MemberVO vo){
		List<MemberVO> list = mybatis.selectList("MemberDAO.SelectQNA", vo);
		return list;
	}
	
	//고객센터 문의하기
	public void QNA_Write(QnaVO vo) {
		mybatis.insert("MemberDAO.InsertQNA", vo);
	}

	//고객센터 컨텐츠 뷰
	public QnaVO QNA_Content_View(QnaVO vo) {
		QnaVO qna = mybatis.selectOne("MemberDAO.QNA_Content_View", vo);
		return qna;
	}


}
