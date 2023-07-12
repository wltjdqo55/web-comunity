package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.AdminNoticeDAO;
import com.inven.project.DAO.QNADAO;
import com.inven.project.DTO.AdminNoticeDTO;
import com.inven.project.DTO.QNADTO;

public class Admin_Write_Board2Command implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminNoticeDTO dto = new AdminNoticeDTO();
		AdminNoticeDAO dao = AdminNoticeDAO.getAdminNoticeDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		QNADAO qnadao = QNADAO.getQnaDAO();
		QNADTO qnadto = new QNADTO();
		ArrayList<QNADTO> QNAlist = qnadao.ListALLQNA();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		ArrayList<AdminNoticeDTO> list = dao.Admin_Notice_List();
		request.setAttribute("list", list);
		request.setAttribute("QNAlist", QNAlist);
		dto.setBoard("정보게시판");
		dao.Admin_Board_Insert(dto);
	}
	
}
