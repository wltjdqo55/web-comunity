package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class JoinCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		dto.setUserName(request.getParameter("userName"));
		dto.setUserId(request.getParameter("userID"));
		dto.setUserNickName(request.getParameter("userNickname"));
		dto.setUserPassword(request.getParameter("userPassword"));
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserBirth(Integer.parseInt(request.getParameter("userBirth")));
		
		String first_phone = request.getParameter("first_phone");
		String center_phone = request.getParameter("center_phone");
		String last_phone = request.getParameter("last_phone");
		String userPhone = first_phone + center_phone + last_phone;
		dto.setUserPhoneNumber(userPhone);
		
		String[] mailReceptionValues = request.getParameterValues("mail_reception");
		String[] phoneReceptionValues = request.getParameterValues("phone_reception");
		
		boolean isMailReceptionChecked = mailReceptionValues != null && mailReceptionValues.length > 0;
		boolean isPhoneReceptionChecked = phoneReceptionValues != null && phoneReceptionValues.length > 0;
		dto.setIsMailReceptionChecked(isMailReceptionChecked);
		dto.setIsPhoneReceptionChecked(isPhoneReceptionChecked);
		
		dao.MemberJoinDAO(dto);
		
		
	}

}
