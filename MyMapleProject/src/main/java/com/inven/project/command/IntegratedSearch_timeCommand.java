package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;

public class IntegratedSearch_timeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDTO dto = new FreeBoardDTO();
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("searchContent");
		search = search.replaceAll("\\s", "");
		
		
		ArrayList<FreeBoardDTO> list = dao.InteGratedSearch_time(search);
		
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		
	}

}
