package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.NoticeReplyDAO;
import com.inven.project.DAO.WarriorreplyDAO;
import com.inven.project.DTO.NoticeReplyDTO;
import com.inven.project.DTO.WarriorreplyDTO;

public class delete_NoticeReply_CommentCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeReplyDAO dao = NoticeReplyDAO.getReplyDAO();
		NoticeReplyDTO dto = new NoticeReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		dao.delete_Reply_DAO(bnum);
		request.setAttribute("result", 0);
		
	}

}
