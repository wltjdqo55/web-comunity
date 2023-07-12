package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.NoticeReplyDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DTO.NoticeReplyDTO;
import com.inven.project.DTO.ReplyDTO;

public class Notice_board_Free_DabgleCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeReplyDAO dao = NoticeReplyDAO.getReplyDAO();
		NoticeReplyDTO dto = new NoticeReplyDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setReplyId(request.getParameter("userId"));
		dto.setReplyNickName(request.getParameter("userNickName"));
		dto.setReplyPassword(request.getParameter("userPassword"));
		dto.setReplytext(request.getParameter("userContent"));
		dto.setReplyName(request.getParameter("userName"));
//		dto.setBnum(Integer.parseInt(request.getParameter("num")));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setGroupNum(Integer.parseInt(request.getParameter("groupNum")));
		dto.setStepNum(Integer.parseInt(request.getParameter("stepNum")));
		
		dao.WriteInsert(dto);
		request.setAttribute("result", 0);
//		ArrayList<ReplyDTO> replylist = dao.ListreplyDAO(dto.getNum());
//		request.setAttribute("replylist", replylist);
		
	}

}
