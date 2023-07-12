package com.inven.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.AdminDeleteDTO;

public class DeleteUserAdminCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDeleteDTO dto = new AdminDeleteDTO();
		MemberDAO dao = MemberDAO.getMemberDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");
		String userNickName = request.getParameter("userNickName");
		String reasons = request.getParameter("reasons");
		String adminNickName = request.getParameter("adminNickName");
		dao.Admin_InsertDeleteReasons(userNickName, reasons, adminNickName);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('총 관리자에게 " + userNickName + " 님의 회원탈퇴 요청이 완료되었습니다.');");
		script.println("location.href = 'Admin_Member.do';");
		script.println("</script>");
		script.close();
		
	}

}
