package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.QNADAO;
import com.inven.project.DTO.QNADTO;

public class QNA_WriteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QNADTO dto = new QNADTO();
		QNADAO dao = QNADAO.getQnaDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		dto.setContent(request.getParameter("content"));
		dto.setUserNickName(request.getParameter("userNickName"));
		String userNickName = request.getParameter("userNickName");
		int radio = Integer.parseInt(request.getParameter("QNARadio"));
		String QNARadio = null;
		if(radio == 1) {
			QNARadio = "게시판관련문의";
		}else if(radio == 2) {
			QNARadio = "회원관련문의";
		}else if(radio == 3) {
			QNARadio = "권한문의";
		}else if(radio == 4) {
			QNARadio = "기타";
		}
		
		dto.setQNARadio(QNARadio);
		dao.InsertQNA(dto);
		
		request.setAttribute("userNickName", userNickName);
	}

}
