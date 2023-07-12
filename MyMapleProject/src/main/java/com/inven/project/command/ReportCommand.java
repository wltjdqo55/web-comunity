package com.inven.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String userNickName = request.getParameter("userNickName");
		String replyNickName = request.getParameter("replyNickName");
		
		request.setAttribute("title", title);
		request.setAttribute("userNickName", userNickName);
		request.setAttribute("replyNickName", replyNickName);
		
		
	}

}
