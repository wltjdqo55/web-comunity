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

public class onetwo_BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");		
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		int totalPage = 0;
		int curPage = 0;
		
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		if(Integer.parseInt(request.getParameter("good"))==10) {
			list = dao.TenBoard(curPage);
			totalPage = dao.calTotalPage_Ten();
		}
		if(Integer.parseInt(request.getParameter("good"))==30) {
			list = dao.ThirtyBoard(curPage);
			totalPage = dao.calTotalPage_Thirty();
		}
		
		
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
		
		
	}

}
