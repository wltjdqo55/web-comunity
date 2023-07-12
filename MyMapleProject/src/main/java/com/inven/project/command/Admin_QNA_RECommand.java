package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.Admin_QNADAO;
import com.inven.project.DTO.Admin_QNADTO;

public class Admin_QNA_RECommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin_QNADTO dto = new Admin_QNADTO();
		Admin_QNADAO dao = Admin_QNADAO.getAdmin_QNADAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setBnum(Integer.parseInt(request.getParameter("num")));
		dto.setContent(request.getParameter("content"));
		dto.setUserNickName(request.getParameter("userNickName"));
		
		dao.Insert(dto);
	}

}
