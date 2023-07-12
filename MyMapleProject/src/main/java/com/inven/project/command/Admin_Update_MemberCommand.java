package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.MemberDTO;

public class Admin_Update_MemberCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
	    MemberDAO Memberdao = MemberDAO.getMemberDAO();
		MemberDTO Memberdto = new MemberDTO();
		
		String userNickName = request.getParameter("userNickName");
		int result = 1 ; 
		// 관리자로 등록
		if(Integer.parseInt(request.getParameter("goto"))== 1) {
			result = Memberdao.Admin_ToAdmin_Update(userNickName);
			
		}
		// 관리자 등록해제
		else if(Integer.parseInt(request.getParameter("goto"))== 2) {
			result = Memberdao.Admin_ToUser_Update(userNickName);
		}
		
		request.setAttribute("result", result);
		
		
	}

}
