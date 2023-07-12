package com.inven.project.DAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;

import com.inven.project.DTO.Admin_QNADTO;
import com.inven.project.DTO.ImgFileDTO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;
import com.inven.project.DTO.QNADTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.ReportDTO;

public class ImgFileDAO {
	private static ImgFileDAO imgFileDAO = new ImgFileDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "ImgFile";
	private DataSource dataSource;
	
	
	

	private ImgFileDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static ImgFileDAO getImgFileDAO() {
		return imgFileDAO;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void delete(String img) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from " + TABLE_NAME + " where img_file = ?");
			pstmt.setString(1, img);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public String[] Selectimg() {
	    Connection conn = getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<String> imgFiles = new ArrayList<>();

	    try {
	        pstmt = conn.prepareStatement("SELECT img_file FROM " + TABLE_NAME);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            String imgFile = rs.getString("img_file");
	            imgFiles.add(imgFile);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt, conn, rs);
	    }

	    // ArrayList를 String 배열로 변환하여 반환
	    return imgFiles.toArray(new String[0]);
	}
	public void Insert_Img(String image_File) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into " + TABLE_NAME + "(img_file) values(?)");
			pstmt.setString(1, image_File);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	public void close(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(PreparedStatement pstmt, Connection conn , ResultSet rs) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
