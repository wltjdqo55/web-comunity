package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.NoticeBoardDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.NoticeBoardDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Admin2_BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WarriorBoardDAO daoo = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dtoo = new WarriorBoardDTO();
		NoticeBoardDAO daooo = NoticeBoardDAO.getWarriorBoardDAO();
		NoticeBoardDTO dtooo = new NoticeBoardDTO();
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String SearchTime = "0";
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<NoticeBoardDTO> list = daooo.Admin_FreeBoardListBoard(curPage);
		int totalPage = daooo.calTotalPageAdmin(curPage);
		int boardCount = dao.AdminBoardCount();
//		ArrayList<WarriorBoardDTO> Warriorlist = daoo.FreeBoardListBoard(curPage);
		
		int NoticeCount = daooo.AdminBoardCount();
		int WarriorCount = daoo.AdminBoardCount();
		
		request.setAttribute("NoticeCount", NoticeCount);
		request.setAttribute("WarriorCount", WarriorCount);
//		request.setAttribute("Warriorlist", Warriorlist);
		request.setAttribute("searchTime", SearchTime);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
	}

}
