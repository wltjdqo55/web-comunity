package com.springbook.biz.impl.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.VO.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO vo) {
		
		mybatis.insert("BoardDAO.insertBoard", vo);
		
	}
	
	public List<BoardVO> listBoard(BoardVO vo){
		
		List<BoardVO> list = mybatis.selectList("BoardDAO.listBoard", vo);
		return list;
	}
	
	public BoardVO contentView(BoardVO vo) {
		BoardVO list = mybatis.selectOne("BoardDAO.contentView", vo);
		return list;
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	public List<BoardVO> searchBoard(BoardVO vo){
		List<BoardVO> list = mybatis.selectList("BoardDAO.searchBoard", vo);
		return list;
	}
	
	public void deleteItems(String num) {
		mybatis.delete("BoardDAO.deleteItems", num);
	}
	
	
	
}
