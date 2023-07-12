package com.inven.project.command;

import java.awt.Window;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class WithdrawalOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setUserId(request.getParameter("userId"));
		int result = dao.MemberWithdrawalOKDAO(dto);
		
		if(result == -1) {
			request.setAttribute("EMG", "에러");
		}else {
			request.setAttribute("sugo", "성공");
		}
	}

}
