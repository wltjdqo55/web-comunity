package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DAO.ImgFileDAO;
import com.inven.project.DAO.NoticeBoardDAO;
import com.inven.project.DAO.WarriorBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.ImgFileDTO;
import com.inven.project.DTO.NoticeBoardDTO;
import com.inven.project.DTO.WarriorBoardDTO;

public class indexCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDTO dto = new FreeBoardDTO();
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
		WarriorBoardDAO daoo = WarriorBoardDAO.getWarriorBoardDAO();
		WarriorBoardDTO dtoo = new WarriorBoardDTO();
		NoticeBoardDAO daooo = NoticeBoardDAO.getWarriorBoardDAO();
		NoticeBoardDTO dtooo = new NoticeBoardDTO();
		ImgFileDTO imgdto = new ImgFileDTO();
		ImgFileDAO imgdao = ImgFileDAO.getImgFileDAO();
		
		
		// 인벤 자유게시판
		ArrayList<FreeBoardDTO> list = dao.IndexFreeBoardDAO();
		
		// 일벤 오늘의 화제
		ArrayList<FreeBoardDTO> goodlist = dao.IndexGoodFreeBoardDAO();
		
		// 직업 게시판
		ArrayList<WarriorBoardDTO> Warriorlist = daoo.IndexFreeBoardDAO();
		ArrayList<WarriorBoardDTO> list1 = daoo.IndexFreeBoardDAO1();
		ArrayList<WarriorBoardDTO> list2 = daoo.IndexFreeBoardDAO2();
		ArrayList<WarriorBoardDTO> list3 = daoo.IndexFreeBoardDAO3();
		ArrayList<WarriorBoardDTO> list4 = daoo.IndexFreeBoardDAO4();
		ArrayList<WarriorBoardDTO> list5 = daoo.IndexFreeBoardDAO5();
		
		//정보공유 게시판
		ArrayList<NoticeBoardDTO> NoticeList1 = daooo.IndexFreeBoardDAO1();
		ArrayList<NoticeBoardDTO> NoticeList2 = daooo.IndexFreeBoardDAO2();
		ArrayList<NoticeBoardDTO> NoticeList3 = daooo.IndexFreeBoardDAO3();
		
		//업로드 사진 가져오는 메소드
		
		String[] ImgList = imgdao.Selectimg();
		
		request.setAttribute("ImgList", ImgList);
		request.setAttribute("NoticeList1", NoticeList1);
		request.setAttribute("NoticeList2", NoticeList2);
		request.setAttribute("NoticeList3", NoticeList3);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("Warriorlist", Warriorlist);
		request.setAttribute("Freelist", list);
		request.setAttribute("goodlist", goodlist);
		
		
	}

}
