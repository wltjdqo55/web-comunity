package com.inven.project.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.DAO.FreeBoardDAO;
import com.inven.project.DTO.FreeBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardmodifyOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardDAO dao = FreeBoardDAO.getFreeBoardDAO();
	    FreeBoardDTO dto = new FreeBoardDTO();
	    request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	    
	    
	    // Get the path to the upload directory.
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
	    
	    String Category;
	    Category = multi.getParameter("category");
	    if (Category != null) {
		    switch (Category) {
		    case "1":
		      Category = "분류";
		      break;
		    case "2":
		      Category = "수다";
		      break;
		    case "3":
		      Category = "이벤트";
		      break;
		    case "4":
		      Category = "웃긴글";
		      break;
		    case "5":
		      Category = "인사";
		      break;
		    case "6":
		      Category = "정보";
		      break;
		    case "7":
		      Category = "투표";
		      break;
		    default:
		      Category = "분류";
		      break;
		    }
	   }
	    dto.setCategory(Category);
	    dto.setBoardContent(multi.getParameter("BoardContent"));
	    dto.setUserTitle(multi.getParameter("userTitle"));
	    dto.setNum(Integer.parseInt(multi.getParameter("num")));
	    String img_file = null;
	    String pub1_file = null;
	    String pub2_file = null;
	    String img_file1 = null;
	    Enumeration<String> files = multi.getFileNames();

	    int i = 0;

	    while (files.hasMoreElements()) {
	    	String str = files.nextElement();
            file = multi.getFilesystemName(str);

	      switch (i) {
	        case 0:
	        	pub2_file = file;
	          break;
	        case 1:
	        	pub1_file = file;
	          break;
	        case 2:
	        	img_file = file;
	          break;
	        case 3:
	        	img_file1 = file;
	      }

	      i++;
	    }
	    dto.setImg_file(img_file);
	    dto.setPub_file1(pub1_file);
	    dto.setPub_file2(pub2_file);
	    dto.setImg_file1(img_file1);
	    
	    
//	    String fileName = multi.getParameter("img_file");
//	    FileInputStream fis = new FileInputStream("img_file");
//	    byte[] bytes = new byte[(int) fis.available()];
//	    fis.read(bytes);
//	    dto.setImg_file(bytes);
//	    
//	    String fileName1 = multi.getParameter("pub1_file");
//	    FileInputStream fis1 = new FileInputStream(fileName1);
//	    byte[] bytes1 = new byte[(int) fis1.available()];
//	    fis1.read(bytes1);
//	    dto.setImg_file(bytes1);
//	    
//	    String fileName2 = multi.getParameter("pub2_file");
//	    FileInputStream fis2 = new FileInputStream(fileName2);
//	    byte[] bytes2 = new byte[(int) fis2.available()];
//	    fis1.read(bytes2);
//	    dto.setImg_file(bytes2);
	    
	 
	    
	    dao.FreeBoardModify(dto);
	}
	

}
