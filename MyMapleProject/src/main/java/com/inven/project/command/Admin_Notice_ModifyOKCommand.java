package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.AdminNoticeDAO;
import com.inven.project.DTO.AdminNoticeDTO;

public class Admin_Notice_ModifyOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminNoticeDAO dao = AdminNoticeDAO.getAdminNoticeDAO();
		AdminNoticeDTO dto = new AdminNoticeDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dao.Admin_Notice_Update(dto);
		
	}

}
