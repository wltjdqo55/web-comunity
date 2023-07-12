package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.Admin_QNADAO;
import com.inven.project.DAO.QNADAO;
import com.inven.project.DTO.Admin_QNADTO;
import com.inven.project.DTO.QNADTO;

public class QNA_RE_GOODCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin_QNADTO dto = new Admin_QNADTO();
		Admin_QNADAO dao = Admin_QNADAO.getAdmin_QNADAO();
		QNADTO dtoo = new QNADTO();
		QNADAO daoo = QNADAO.getQnaDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto = dao.SelectList(num);
		dtoo = daoo.ListNum(num);
		
		request.setAttribute("admindto", dto);
		request.setAttribute("userdto", dtoo);
	}

}
