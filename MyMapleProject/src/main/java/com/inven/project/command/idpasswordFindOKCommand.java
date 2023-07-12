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

public class idpasswordFindOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setUserName(request.getParameter("userName"));
		dto.setUserBirth(Integer.parseInt(request.getParameter("userBirth")));
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserPhoneNumber(request.getParameter("userPhoneNumber"));
		
		dto = dao.MemberidpasswordFind(dto);
		
		if(dto != null) {
			HttpSession session = request.getSession();
			request.setAttribute("next", "입력하신 정보가 일치합니다. 다음단계로 넘어갑니다.");
			session.setAttribute("Member", dto);
		}else {
			request.setAttribute("resultOMG", "입력하신 정보가 일치하지 않습니다.");
		}
		
		
	}

}
