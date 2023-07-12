package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class Power_RevocationCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = MemberDAO.getMemberDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
			String userNickName = request.getParameter("userNickName");
			dao.Admin_Update_Power_Power(userNickName);
			request.setAttribute("result", 1);
		
	
		
	}

}
