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
import com.inven.project.DAO.ReplyDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.ReplyDTO;
public class Admin_Member_BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    MemberDAO Memberdao = MemberDAO.getMemberDAO();
		MemberDTO Memberdto = new MemberDTO();
		ReplyDAO replydao = ReplyDAO.getReplyDAO();
		ReplyDTO replydto = new ReplyDTO();
		FreeBoardDTO freeboarddto = new FreeBoardDTO();
		FreeBoardDAO freeboarddao = FreeBoardDAO.getFreeBoardDAO();
		
		
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userNickName = request.getParameter("userNickName");
		String MemberBoard = "0";
		String userId= request.getParameter("userId");
		String userPassword= request.getParameter("userPassword");
		String userName=request.getParameter("userName");
		String role = request.getParameter("role");
		int curPage = 0;
		int totalPage = 0;
		int memberCount = 0;
		int replyCount = 0;
		int FreeBoardCount = 0;
		int replytotalPage = 0;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		ArrayList<ReplyDTO> replylist = new ArrayList<ReplyDTO>();
		
		replyCount = replydao.AdminReply_User_Count(userNickName);
		memberCount = Memberdao.AdminMemberCount();
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		
		
			FreeBoardCount = freeboarddao.cntOfList_AdminUserNickNameList(userNickName);
			totalPage = dao.calTotalPage_AdminUserNickNameList(userNickName);
			list = dao.AdminUserNickNameList(userNickName, curPage);
			
			

			
			String power = Memberdao.Admin_Member_Power(userNickName);
			

		
			replylist = replydao.AdminUserComment(userNickName, curPage);
			replytotalPage = replydao.calTotalPage_AdminUserNickNameList(userNickName);
			
		request.setAttribute("power", power);	
		request.setAttribute("replytotalPage", replytotalPage);
		request.setAttribute("replylist", replylist);
		request.setAttribute("FreeBoardCount", FreeBoardCount);
		request.setAttribute("replyCount", replyCount);
		request.setAttribute("memberCount", memberCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("MemberBoard", MemberBoard);
		request.setAttribute("userNickName", userNickName);
		request.setAttribute("userName", userName);
		request.setAttribute("userId", userId);
		request.setAttribute("userPassword", userPassword);
		request.setAttribute("role", role);
	}

}
