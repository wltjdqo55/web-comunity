package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.AdminDeleteDTO;
import com.inven.project.DTO.MemberDTO;

public class Admin_RequestCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = MemberDAO.getMemberDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ArrayList<AdminDeleteDTO> list = dao.Admin_Request();
		request.setAttribute("list", list);
		
			String userNickName = request.getParameter("userNickName");
			String adminNickName = request.getParameter("adminNickName");
			String reasons = request.getParameter("reasons");
			request.setAttribute("userNickName", userNickName);
			request.setAttribute("adminNickName", adminNickName);
			request.setAttribute("reasons", reasons);
		
		
	}
	
}
