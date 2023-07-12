package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.NoticeBoardDAO;
import com.inven.project.DAO.NoticeReplyDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.NoticeBoardDTO;
import com.inven.project.DTO.NoticeReplyDTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Admin_Board_Content_View2Comand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = NoticeBoardDAO.getWarriorBoardDAO();
		NoticeBoardDTO dto = new NoticeBoardDTO();
	    NoticeReplyDAO replydao = NoticeReplyDAO.getReplyDAO();
	    NoticeReplyDTO replydto = new NoticeReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		dto = dao.Admin_Content_View(num);
		
		ArrayList<NoticeReplyDTO> replylist = new ArrayList<NoticeReplyDTO>();
		replylist = replydao.ListreplyDAO(Integer.parseInt(request.getParameter("num")));
		
		request.setAttribute("dto", dto);
		request.setAttribute("replylist", replylist);
		
	}

}
