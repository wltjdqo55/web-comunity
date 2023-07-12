package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Warrior1BoardFreeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WarriorBoardDAO dao = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dto = new WarriorBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String IZ = null;
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		//전사
		if(Integer.parseInt(request.getParameter("good"))==1) {
			ArrayList<WarriorBoardDTO> list = dao.FreeBoardSudaBoard(curPage);
			int totalPage = dao.calTotalPage_SUDA();
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			IZ = "1";
			request.setAttribute("IZ", IZ);
		}
		//마법사
		if(Integer.parseInt(request.getParameter("good"))==2) {
			ArrayList<WarriorBoardDTO> list = dao.FreeBoardTupyoBoard(curPage);
			int totalPage = dao.calTotalPage_TUPYO();
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			IZ = "2";
			request.setAttribute("IZ", IZ);
		}
		//궁수
		if(Integer.parseInt(request.getParameter("good"))==3) {
			ArrayList<WarriorBoardDTO> list = dao.FreeBoardInsaBoard(curPage);
			int totalPage = dao.calTotalPage_INSA();
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			IZ = "3";
			request.setAttribute("IZ", IZ);
		}
		//도적
		if(Integer.parseInt(request.getParameter("good"))==4) {
			ArrayList<WarriorBoardDTO> list = dao.FreeBoardSmailBoard(curPage);
			int totalPage = dao.calTotalPage_SMAIL();
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			IZ = "4";
			request.setAttribute("IZ", IZ);
		}
		//해적
		if(Integer.parseInt(request.getParameter("good"))==5) {
			ArrayList<WarriorBoardDTO> list = dao.FreeBoardEventBoard(curPage);
			int totalPage = dao.calTotalPage_EVENT();
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			IZ = "5";
			request.setAttribute("IZ", IZ);
		}
		
	}

}
