package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DAO.WarriorreplyDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.WarriorBoardDTO;
import com.inven.project.DTO.WarriorreplyDTO;

public class Warrior_board_Free_content_viewCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WarriorBoardDAO dao = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dto = new WarriorBoardDTO();
	    WarriorreplyDAO replydao = WarriorreplyDAO.getReplyDAO();
	    WarriorreplyDTO replydto = new WarriorreplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ArrayList<WarriorBoardDTO> list = new ArrayList<WarriorBoardDTO>();
		ArrayList<WarriorreplyDTO> replylist = new ArrayList<WarriorreplyDTO>();
		//다음글
		
		//다음글도 이전글도 아닌 사용자가 클릭해서 넘어갈때
		
			dto.setNum(Integer.parseInt(request.getParameter("num")));
			dto.setComment(Integer.parseInt(request.getParameter("comment")));
			replylist = replydao.ListreplyDAO(Integer.parseInt(request.getParameter("num")));
			list = dao.FreeBoardContentview(dto);
		
		
		
		
		

		request.setAttribute("list", list);
		request.setAttribute("replylist", replylist);
		
	}

}
 