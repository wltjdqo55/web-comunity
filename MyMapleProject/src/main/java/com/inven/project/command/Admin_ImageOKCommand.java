package com.inven.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.ImgFileDAO;
import com.inven.project.DTO.ImgFileDTO;

public class Admin_ImageOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImgFileDTO imgdto = new ImgFileDTO();
		ImgFileDAO imgdao = ImgFileDAO.getImgFileDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String[] img = imgdao.Selectimg();
		
		request.setAttribute("img", img);
		
	}

}
