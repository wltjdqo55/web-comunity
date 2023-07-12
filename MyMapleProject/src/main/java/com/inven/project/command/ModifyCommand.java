package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class ModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setUserName(request.getParameter("userName"));
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserPhoneNumber(request.getParameter("userPhoneNumber"));
		dto.setUserNickName(request.getParameter("userNickName"));
		dto.setUserId(request.getParameter("userId"));
		
		
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", dao.MemberModifyDAO(dto));
		
	}

}
