package com.inven.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.RecommendationDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.RecommedationDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class Warrior_FreeBoard_recommendCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		WarriorBoardDAO daoo = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dtoo = new WarriorBoardDTO();
		RecommedationDTO dto = new RecommedationDTO();
		RecommendationDAO dao = RecommendationDAO.getRecommendationDAO();
		
		int comment = Integer.parseInt(request.getParameter("comment"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String userNickName = request.getParameter("userNickName");
		// 존재하면 result에 1이 들어오고 존재하지 않으면 0이 들어옴
		int result = dao.ChkUserNickName_bnum(userNickName, bnum);
		
		if(result == 1) {
			daoo.Hitgood(bnum);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 추천 또는 비추천한 게시글입니다.');");
			script.println("location.href = 'Warrior_board_Free_Content_View.do?num=" + bnum + "&comment=" + comment + "'");
			script.println("</script>");
			script.close();

			return;
		}else if(result == 0) {
			dao.Insert(bnum, userNickName);
			int commend = Integer.parseInt(request.getParameter("commend"));
			daoo.UpdateRecommend(bnum, commend);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Warrior_board_Free_Content_View.do?num=" + bnum + "&comment=" + comment + "'");
			script.println("</script>");
			script.close();
		}
		
	}

}
