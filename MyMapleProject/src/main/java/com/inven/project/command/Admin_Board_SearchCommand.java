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

public class Admin_Board_SearchCommand implements Command {

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
		
		int NoticeCount = daooo.AdminBoardCount();
		int WarriorCount = daoo.AdminBoardCount();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = 0;
		
		int boardCount = dao.AdminBoardCount();
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		int category = Integer.parseInt(request.getParameter("category"));
		String search = request.getParameter("search");
		search = search.replaceAll("\\s", "");
		String searchTime = "0";
		//제목 + 내용
		if(category==0) {
			list = dao.SearchTitleAndContent(search, curPage);
			totalPage = dao.calTotalPage_SearchTitleandBoardcategory(search);
			searchTime = "1";
		}
		// 게시판
		else if(category==1) {
			list = dao.Searchboardcategory(search, curPage);
			totalPage = dao.calTotalPage_Searchboardcategory(search);
			searchTime = "2";
		}
		//닉네임
		else if(category==2) {
			list = dao.SearchNickNameAdmin(search, curPage);
			totalPage = dao.calTotalPage_SearchNickNameAdmin(search);
			searchTime = "3";
		}
		request.setAttribute("NoticeCount", NoticeCount);
		request.setAttribute("WarriorCount", WarriorCount);
		request.setAttribute("search", search);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("searchTime", searchTime);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
		
		
		
		
	}

}
