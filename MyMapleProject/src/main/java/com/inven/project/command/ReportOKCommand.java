package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.ReportDAO;
import com.inven.project.DTO.ReportDTO;

public class ReportOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ReportDTO dto = new ReportDTO();
		ReportDAO dao = ReportDAO.getReportDAO();
		
		dto.setUserNickName(request.getParameter("userNickName"));
		dto.setReplyNickName(request.getParameter("replyNickName"));
		dto.setReportcontent(request.getParameter("reportcontent"));
		dto.setTitle(request.getParameter("title"));
		
		int radio = Integer.parseInt(request.getParameter("ReportRadio"));
		String reportRadio = null;
		if(radio == 1) {
			reportRadio = "욕설/비방";
		}else if(radio == 2) {
			reportRadio = "도배";
		}else if(radio == 3) {
			reportRadio = "홍보/상업성";
		}else if(radio == 4) {
			reportRadio = "음란성";
		}else if(radio == 5) {
			reportRadio = "불법촬영물";
		}else if(radio == 6) {
			reportRadio = "기타";
		}
		dto.setReportRadio(reportRadio);
		
		
		
		
		dao.ReportInsertDAO(dto);
		
		request.setAttribute("replyNickName", request.getParameter("replyNickName"));
	}

}
