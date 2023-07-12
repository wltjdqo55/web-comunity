package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.NoteboxDAO;
import com.inven.project.DTO.NoteboxDTO;

public class deleteItemsCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoteboxDAO dao = NoteboxDAO.getNoteboxDAO();
		NoteboxDTO dto = new NoteboxDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String[] selectedItems = request.getParameterValues("selectedItems");
		dao.deleteItemDAO(selectedItems);
		request.setAttribute("result", 1);
	}

}
