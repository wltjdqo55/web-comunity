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

public class Board_Free_NickName_searchCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		String userNickName = request.getParameter("userNickName");
		int totalPage = dao.calTotalPage_searchUserNickName(userNickName);
		ArrayList<FreeBoardDTO> list = dao.SearchNickNameBOARD(userNickName, curPage); 
		
		
		
		
		
		request.setAttribute("mylist", list);
		request.setAttribute("totalPage", totalPage);
		
	}
	
}