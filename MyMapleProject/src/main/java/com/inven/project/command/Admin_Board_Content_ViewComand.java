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
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.ReplyDTO;

public class Admin_Board_Content_ViewComand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    ReplyDAO replydao = ReplyDAO.getReplyDAO();
	    ReplyDTO replydto = new ReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		dto = dao.Admin_Content_View(num);
		
		ArrayList<ReplyDTO> replylist = new ArrayList<ReplyDTO>();
		replylist = replydao.ListreplyDAO(Integer.parseInt(request.getParameter("num")));
		
		request.setAttribute("dto", dto);
		request.setAttribute("replylist", replylist);
		
		
	}

}
