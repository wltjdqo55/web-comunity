package com.springbook.biz.impl.board;

import java.util.List;

import com.springbook.biz.VO.BoardVO;

public interface BoardService {
	
	void insertBoard(BoardVO vo);
	
	List<BoardVO> listBoard(BoardVO vo);
	
	BoardVO contentView(BoardVO vo);
	
	void updateBoard(BoardVO vo);
	
	void deleteBoard(BoardVO vo);
	
	List<BoardVO> searchBoard(BoardVO vo);
	
	// AJAX 삭제 //
	
	void deleteItems(String num);
}
