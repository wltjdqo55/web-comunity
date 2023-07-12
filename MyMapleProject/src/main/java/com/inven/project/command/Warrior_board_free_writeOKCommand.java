package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Warrior_board_free_writeOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		WarriorBoardDAO dao = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dto = new WarriorBoardDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		
		dto = dao.board_Free_modifyDAO(dto);
		request.setAttribute("dto", dto);
		
	}

}
