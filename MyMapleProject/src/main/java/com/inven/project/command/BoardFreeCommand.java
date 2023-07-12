package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.AdminNoticeDAO;
import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DTO.AdminNoticeDTO;
import com.inven.project.DTO.FreeBoardDTO;

public class BoardFreeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		AdminNoticeDTO dtoo = new AdminNoticeDTO();
		AdminNoticeDAO daoo = AdminNoticeDAO.getAdminNoticeDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<FreeBoardDTO> list = dao.FreeBoardListBoard(curPage);
		int totalPage = dao.calTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		ArrayList<AdminNoticeDTO> AdminNoticelist = daoo.Admin_Board_List_Free();
		request.setAttribute("AdminNoticelist", AdminNoticelist);
		
	}

}
