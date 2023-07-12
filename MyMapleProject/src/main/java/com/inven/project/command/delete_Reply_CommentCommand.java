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

public class delete_Reply_CommentCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyDAO dao = ReplyDAO.getReplyDAO();
		ReplyDTO dto = new ReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		dao.delete_Reply_DAO(bnum);
		request.setAttribute("result", 0);
	}

}
