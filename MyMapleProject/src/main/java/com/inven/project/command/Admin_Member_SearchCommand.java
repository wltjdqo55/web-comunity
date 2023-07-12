package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.MemberDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;

public class Admin_Member_SearchCommand implements Command {

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
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		request.getParameter("category");
		int category = Integer.parseInt(request.getParameter("category"));
		String search = request.getParameter("search");
		search = search.replaceAll("\\s", "");
		String searchTime = null;
		
		
		if(category==0) {
			list = Memberdao.SearchTitleAndNickName(search, curPage);
			totalPage = Memberdao.calTotalPage_1(search);
			searchTime = "1";
		}else if(category==1) {
			list = Memberdao.SearchTitle(search, curPage);
			totalPage = Memberdao.calTotalPage_2(search);
			searchTime = "2";
		}else if(category==2) {
			list = Memberdao.SearchNickName(search, curPage);
			totalPage = Memberdao.calTotalPage_3(search);
			searchTime = "3";
		}else if(category==3) {
			list = Memberdao.SearchUSER(curPage);
			totalPage = Memberdao.calTotalPage_User();
			searchTime = "4";
		}else if(category==4) {
			list = Memberdao.SearchADMIN(curPage);
			totalPage = Memberdao.calTotalPage_Admin();
			searchTime = "5";
		}
		request.setAttribute("search", search);
		request.setAttribute("searchTime", searchTime);
		request.setAttribute("memberCount", memberCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
	}

}
