package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inven.project.DAO.NoteboxDAO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;

public class noteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoteboxDAO dao = NoteboxDAO.getNoteboxDAO();
		NoteboxDTO dto = new NoteboxDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MemberDTO dtoo = new MemberDTO();
		
		HttpSession session = request.getSession();
		
		dtoo = (MemberDTO)session.getAttribute("userInfo");
		String userNickName = dtoo.getUserNickName();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = dao.calTotalPage();
		
		ArrayList<NoteboxDTO> list = dao.sendStorageDAO(userNickName, curPage);
		
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("writestorage", list);
		
	}
       

}
