package com.springbook.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.impl.board.BoardService;

@Controller
public class BoardController {

	// 회원
	@Autowired
	private BoardService boardService;

	//통합검색
	@RequestMapping("/IntegratedSearch")
	public String IntegratedSearch() {
		return "IntegratedSearch";
	}
	
}



















