package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.ReplyDTO;

public class My_comment_boardCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
		FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		MemberDTO dtoo = new MemberDTO();
		HttpSession session = request.getSession();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		dtoo = (MemberDTO)(session.getAttribute("userInfo"));
		
		dto.setUserId(dtoo.getUserId());  
		int totalPage = dao.calTotalPage_Mylist(dto);
		
		ArrayList<FreeBoardDTO> mylist = dao.board_Free_my_comment(dto, curPage);
		request.setAttribute("mylist", mylist);
		request.setAttribute("totalPage", totalPage);
		
		
		
	}

}
