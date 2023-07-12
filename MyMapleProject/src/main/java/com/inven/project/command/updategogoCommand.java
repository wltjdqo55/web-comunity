package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.StatisticDTO;

public class updategogoCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StatisticDTO dto = new StatisticDTO();
		MemberDAO dao = MemberDAO.getMemberDAO();
		
		dao.Admin_update_visitor();
		
		request.setAttribute("result", 1);
	}

}
