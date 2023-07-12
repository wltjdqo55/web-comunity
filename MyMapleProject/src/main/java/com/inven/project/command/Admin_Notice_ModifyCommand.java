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

public class Admin_Notice_ModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminNoticeDAO dao = AdminNoticeDAO.getAdminNoticeDAO();
		AdminNoticeDTO dto = new AdminNoticeDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		QNADAO qnadao = QNADAO.getQnaDAO();
		QNADTO qnadto = new QNADTO();
		int num = Integer.parseInt(request.getParameter("num"));
		dto = dao.Admin_Content_View(num);
		ArrayList<AdminNoticeDTO> list = dao.Admin_Notice_List();
		
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		
		ArrayList<QNADTO> QNAlist = qnadao.ListALLQNA();
		request.setAttribute("QNAlist", QNAlist);
		
		
	}

}
