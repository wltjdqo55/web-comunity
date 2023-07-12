package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.ReportDAO;
import com.inven.project.DTO.ReportDTO;

public class Admin_ReportCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReportDTO dto = new ReportDTO();
		ReportDAO dao = ReportDAO.getReportDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ArrayList<ReportDTO> list = dao.Admin_Report_List_DAO();
		
		request.setAttribute("list", list);
		
		
	}

}
