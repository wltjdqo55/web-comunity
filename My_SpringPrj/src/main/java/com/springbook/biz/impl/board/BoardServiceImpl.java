package com.springbook.biz.impl.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.VO.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public List<BoardVO> listBoard(BoardVO vo) {
		List<BoardVO> list = dao.listBoard(vo);
		return list;
	}

	@Override
	public BoardVO contentView(BoardVO vo) {
		
		BoardVO list = dao.contentView(vo);
		return list;
	}

	@Override
	public void updateBoard(BoardVO vo) {
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		dao.deleteBoard(vo);
	}

	@Override
	public List<BoardVO> searchBoard(BoardVO vo) {
		List<BoardVO> list = dao.searchBoard(vo);
		return list;
	}

	@Override
	public void deleteItems(String num) {
		dao.deleteItems(num);
	}


}
