package com.inven.project.command;

import java.io.IOException;
import java.io.PrintWriter;
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

public class Notice_NextPred_board_Free_Content_ViewCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = NoticeBoardDAO.getWarriorBoardDAO();
		NoticeBoardDTO dto = new NoticeBoardDTO();
	    NoticeReplyDAO replydao = NoticeReplyDAO.getReplyDAO();
	    NoticeReplyDTO replydto = new NoticeReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ArrayList<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();
		ArrayList<NoticeReplyDTO> replylist = new ArrayList<NoticeReplyDTO>();
		//이전글
		if(Integer.parseInt(request.getParameter("next"))==0){
			int nextNum = Integer.parseInt(request.getParameter("num"));
			nextNum = nextNum+1;
			String comment = request.getParameter("comment");
			list = dao.NextContentView(nextNum, comment);
			if(list.isEmpty()) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이전 게시물이 존재하지 않습니다.');");
				script.println("location.href = 'Notice.do';");
				script.println("</script>");
				script.close();
			}
			replylist = replydao.ListreplyDAO(nextNum);
		}
		//다음글
		if(Integer.parseInt(request.getParameter("next"))==1){
			int predNum = Integer.parseInt(request.getParameter("num"));
			predNum = predNum-1;
			String comment = request.getParameter("comment");
			list = dao.PredContentView(predNum, comment);
			if(list.isEmpty()) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('다음 게시물이 존재하지 않습니다.');");
				script.println("location.href = 'Notice.do';");
				script.println("</script>");
				script.close();
			}
			replylist = replydao.ListreplyDAO(predNum);
		}
		request.setAttribute("list", list);
		request.setAttribute("replylist", replylist);
		
	}

}
