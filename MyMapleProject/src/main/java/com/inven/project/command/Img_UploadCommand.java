package com.inven.project.command;

import java.io.IOException;
import java.util.Enumeration;
import java.io.InputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.ImgFileDAO;
import com.inven.project.DTO.ImgFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.List;
public class Img_UploadCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImgFileDTO dto = new ImgFileDTO();
		ImgFileDAO dao = ImgFileDAO.getImgFileDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ServletContext context = request.getServletContext();
	    String path = context.getRealPath("fileFolder");
	    
	    int size = 1024 * 1024 * 15; //15M - 최대 사이즈
	    String file = "";
	    String oriFile = "";
	    MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	    
	    try{
	        
	        String name = multi.getParameter("name");
	        System.out.println("이름 " + name);
	        
	        Enumeration<String> files = multi.getFileNames();		// 폼 요소 중 input 태그 속성이 file로 된 파라미터의 이름들을 반환
	        													// upload 된 파일이 없으면 비어있는 Enumeration을 반환
	        while(files.hasMoreElements())
	        {
	            String str = files.nextElement();
	            file = multi.getFilesystemName(str);			// 사용자가 지정해서 서버에 실제로 업로드된 파일명 반환
	            													// 파일명이 중복되는 경우 변경된 파일명 반환
	            oriFile = multi.getOriginalFileName(str);		// 사용자가 업로드한 실제 파일명을 반환.
	            													// 이때의 파일명은 파일 중복을 고려한 파일명 변경 전의 이름을 말한다.
	            System.out.println("저장된 경로 " + path + " 저장된 이름 " + file + " 원본이름 " + oriFile);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	    String img_file = null;
	    Enumeration<String> files = multi.getFileNames();
	    while (files.hasMoreElements()) {
	    	
	    	String str = files.nextElement();
	    	file = multi.getFilesystemName(str);
	    	
	    }
        img_file = file;
        
        dao.Insert_Img(img_file);
        
		
	}

}
