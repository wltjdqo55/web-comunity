package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Warrior_onetwo_BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WarriorBoardDAO dao = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dto = new WarriorBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");		
		ArrayList<WarriorBoardDTO> list = new ArrayList<WarriorBoardDTO>();
		int totalPage = 0;
		int curPage = 0;
		
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		if(Integer.parseInt(request.getParameter("good"))==10) {
			list = dao.TenBoard(curPage);
			totalPage = dao.calTotalPage_Ten();
		}
		
		
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
	}

}
