package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.ReplyDTO;

public class Admin_deleteItemsMember_BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    ReplyDAO replydao = ReplyDAO.getReplyDAO();
		ReplyDTO replydto = new ReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String[] selectedItems = request.getParameterValues("selectedItems");
		
		if(Integer.parseInt(request.getParameter("good"))==1) {
			dao.Admin_deleteItemBoardDAO(selectedItems);
			
		}else if(Integer.parseInt(request.getParameter("good"))==2) {
			replydao.Admin_deleteItemBoardDAO(selectedItems);
		}
		request.setAttribute("result", 1);
		
		
	}

}
