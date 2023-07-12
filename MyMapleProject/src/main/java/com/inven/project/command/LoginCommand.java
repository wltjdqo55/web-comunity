package com.inven.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class LoginCommand implements Command {

	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setUserId(request.getParameter("userID"));
		dto.setUserPassword(request.getParameter("userPassword"));
		
		dto = dao.MemberLoginDAO(dto);
		
		if (dto != null) {
			
	
				HttpSession session = request.getSession();
				request.setAttribute("clear", "로그인 되었습니다.");
				session.setAttribute("userInfo", dto);
				
		  }
		else {
			request.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
		}
		
		

	}
}