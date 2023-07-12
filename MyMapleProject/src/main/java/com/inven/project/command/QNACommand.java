package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inven.project.DAO.QNADAO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.QNADTO;

public class QNACommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QNADTO dto = new QNADTO();
		QNADAO dao = QNADAO.getQnaDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
//		MemberDTO dtoo = new MemberDTO();
//		
//		HttpSession session = request.getSession();
//		
//		dtoo = (MemberDTO)session.getAttribute("userInfo");
//		String userNickName = dtoo.getUserNickName();
		
		String userNickName = request.getParameter("userNickName");
	    ArrayList<QNADTO> list = dao.ListQNA(userNickName);
	    request.setAttribute("list", list);
		
	}

}
