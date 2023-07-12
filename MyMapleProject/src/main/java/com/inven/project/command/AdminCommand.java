package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.MemberDAO;
import com.inven.project.DAO.NoteboxDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;
import com.inven.project.DTO.ReplyDTO;

public class AdminCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		NoteboxDAO Noteboxdao = NoteboxDAO.getNoteboxDAO();
		NoteboxDTO Noteboxdto = new NoteboxDTO();
		FreeBoardDAO FreeBoarddao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO FreeBoarddto = new FreeBoardDTO();
	    MemberDAO Memberdao = MemberDAO.getMemberDAO();
		MemberDTO Memberdto = new MemberDTO();
		ReplyDAO Replydao = ReplyDAO.getReplyDAO();
		ReplyDTO Replydto = new ReplyDTO();
		
		//회원수 가져오기
		int memberCount = Memberdao.AdminMemberCount();
		request.setAttribute("memberCount", memberCount);
		
		//게시글수 가져오기
		int boardCount = FreeBoarddao.AdminBoardCount();
		request.setAttribute("boardCount", boardCount);
		
		//우편함(보냄+받음)수 가져오기
		int NoteCount = Noteboxdao.AdminNoteCount();
		request.setAttribute("noteCount", NoteCount);
		
		//댓글수 가져오기
		int ReplyCount = Replydao.AdminReplyCount();
		request.setAttribute("replyCount", ReplyCount);
		
		//총 방문자 수 가져오기
		int totalvisitor = Memberdao.AdminTotalVisitor();
		request.setAttribute("totalvisitor", totalvisitor);
		
		//일일 방문자 수 가져오기
		int Todayvisitor = Memberdao.AdminTodayVisitor();
		
		
	}

}
