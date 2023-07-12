package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;

public class Admin_MemberCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
	    MemberDAO Memberdao = MemberDAO.getMemberDAO();
		MemberDTO Memberdto = new MemberDTO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = Memberdao.calTotalPage();
		int memberCount = Memberdao.AdminMemberCount();
		
		String searchTime = "0";
		ArrayList<MemberDTO> list = Memberdao.Admin_list_Member(curPage);
		
		request.setAttribute("memberCount", memberCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("searchTime", searchTime);
		
	}

}
