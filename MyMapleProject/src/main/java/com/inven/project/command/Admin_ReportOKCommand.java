package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.ReportDAO;
import com.inven.project.DTO.ReportDTO;

public class Admin_ReportOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportDTO dto = new ReportDTO();
		ReportDAO dao = ReportDAO.getReportDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int count = dao.Admin_replyNickNameCount(request.getParameter("replyNickName"));
		dto = dao.Admin_Report_Content_DAO(num);
		request.setAttribute("dto", dto);
		request.setAttribute("count", count);
	}

}
