package com.springbook.biz.impl.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.VO.BoardVO;
import com.springbook.biz.VO.MemberVO;
import com.springbook.biz.VO.NoteVO;
import com.springbook.biz.VO.QnaVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public void join(MemberVO vo) {
		dao.join(vo);
	}

	@Override
	public int idCheck(String idCheck) {
		int count = dao.idCheck(idCheck);
		return count;
	}

	@Override
	public void NickNameCheck(String NickNameCheck) {
		dao.NickNameCheck(NickNameCheck);
	}


	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO voo = dao.login(vo);
		return voo;
	}

	@Override
	public void modify(MemberVO vo) {
		dao.modify(vo);
	}

	@Override
	public void password(MemberVO vo) {
		dao.password(vo);
	}

	@Override
	public void WithdrawalOK(MemberVO vo) {
		dao.WithdrawalOK(vo);
	}

	@Override
	public List<BoardVO> FreeBoard() {
		List<BoardVO> list = dao.FreeBoard();
		return list;
	}

	@Override
	public int ReplyBoard(int num) {
		int count = dao.ReplyBoard(num);
		return count;
	}

	@Override
	public List<BoardVO> TodayBoard() {
		List<BoardVO> list = dao.TodayBoard();
		return list;
	}

	@Override
	public List<BoardVO> NoticeBoard() {
		List<BoardVO> list = dao.NoticeBoard();
		return list;
	}

	@Override
	public List<BoardVO> BugBoard() {
		List<BoardVO> list = dao.BugBoard();
		return list;
	}

	@Override
	public List<BoardVO> EventBoard() {
		List<BoardVO> list = dao.EventBoard();
		return list;
	}

	@Override
	public int NoticeReplyBoard(int num) {
		int count = dao.NoticeReplyBoard(num);
		return count;
	}

	@Override
	public List<BoardVO> AllBoard() {
		List<BoardVO> list = dao.AllBoard();
		return list;
	}

	@Override
	public List<BoardVO> WarriorBoard() {
		List<BoardVO> list = dao.WarriorBoard();
		return list;
	}

	@Override
	public List<BoardVO> WizardBoard() {
		List<BoardVO> list = dao.WizardBoard();
		return list;
	}

	@Override
	public List<BoardVO> ArcherBoard() {
		List<BoardVO> list = dao.ArcherBoard();
		return list;
	}

	@Override
	public List<BoardVO> BanditBoard() {
		List<BoardVO> list = dao.BanditBoard();
		return list;
	}

	@Override
	public List<BoardVO> PirateBoard() {
		List<BoardVO> list = dao.PirateBoard();
		return list;
	}

	@Override
	public int WarriorReplyBoard(int num) {
		int count = dao.WarriorReplyBoard(num);
		return count;
	}

	@Override
	public String idpasswordFind(MemberVO vo) {
		String member = dao.idpasswordFind(vo);
		return member;
	}

	@Override
	public void passwordOK(MemberVO vo) {
		dao.passwordOK(vo);
	}

	@Override
	public void note_write(NoteVO vo) {
		dao.note_write(vo);
	}

	@Override
	public List<NoteVO> sendNote(String userNickName) {
		List<NoteVO> list = dao.sendNote(userNickName);
		return list;
	}

	@Override
	public List<NoteVO> writeNote(String userNickName) {
		List<NoteVO> list = dao.writeNote(userNickName);
		return list;
	}

	@Override
	public NoteVO noteContentView(NoteVO vo) {
		NoteVO note = dao.noteContentView(vo);
		return note;
	}

	@Override
	public void deleteItems(String num) {
		dao.deleteItems(num);
	}

	@Override
	public List<MemberVO> QNA(MemberVO vo) {
		List<MemberVO> list = dao.QNA(vo);
		
		return list;
	}

	@Override
	public void QNA_Write(QnaVO vo) {
		dao.QNA_Write(vo);
	}

	@Override
	public QnaVO QNA_Content_View(QnaVO vo) {
		QnaVO qna = dao.QNA_Content_View(vo);
		return qna;
	}

}
