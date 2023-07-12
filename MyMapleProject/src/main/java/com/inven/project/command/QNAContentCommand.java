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

public class QNAContentCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		QNADAO qnadao = QNADAO.getQnaDAO();
		QNADTO qnadto = new QNADTO();
		AdminNoticeDAO dao = AdminNoticeDAO.getAdminNoticeDAO();
		AdminNoticeDTO dto = new AdminNoticeDTO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		qnadto = qnadao.ListNum(num);
		ArrayList<AdminNoticeDTO> list = dao.Admin_Notice_List();
		ArrayList<QNADTO> QNAlist = qnadao.ListALLQNA();
		
		request.setAttribute("list", list);
		request.setAttribute("QNAlist", QNAlist);
		request.setAttribute("qnadto", qnadto);
		
	}

}
