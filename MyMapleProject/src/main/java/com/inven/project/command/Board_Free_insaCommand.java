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

public class Board_Free_insaCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<FreeBoardDTO> list = dao.FreeBoardInsaBoard(curPage);
		int totalPage = dao.calTotalPage_INSA();
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
