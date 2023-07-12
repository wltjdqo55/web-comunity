package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;

public class search_Board_FreeCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = 0;
		
		
		
		
		
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		request.getParameter("category");
		int category = Integer.parseInt(request.getParameter("category"));
		String search = request.getParameter("search");
		search = search.replaceAll("\\s", "");
		if(category==0) {
			list = dao.SearchTitleAndNickName(search, curPage);
			totalPage = dao.calTotalPage_Search(search);
		}else if(category==1) {
			list = dao.SearchTitle(search, curPage);
			totalPage = dao.calTotalPage_SearchTitle(search);
		}else if(category==2) {
			list = dao.SearchNickName(search, curPage);
			totalPage = dao.calTotalPage_SearchNickName(search);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
