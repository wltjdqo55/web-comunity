package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.AdminNoticeDAO;
import com.inven.project.DTO.AdminNoticeDTO;

public class Notice_Content_ViewCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		AdminNoticeDTO dto = new AdminNoticeDTO();
		AdminNoticeDAO dao = AdminNoticeDAO.getAdminNoticeDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto = dao.Admin_Content_View(num);
		
		request.setAttribute("dto", dto);
		
		
	}

}
