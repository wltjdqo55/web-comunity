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
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;
import com.inven.project.DTO.QNADTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.ReportDTO;

public class Admin_QNADAO {
	private static Admin_QNADAO admin_QNADAO = new Admin_QNADAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "Admin_QNA";
	private DataSource dataSource;
	
	
	

	private Admin_QNADAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static Admin_QNADAO getAdmin_QNADAO() {
		return admin_QNADAO;
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
	public void updateQNA(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update QNA set State = ? where num = ?");
			pstmt.setString(1, "답변완료");
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void Insert(Admin_QNADTO dto) {
		updateQNA(dto.getBnum());
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into " + TABLE_NAME + "(bnum, userNickName, content) values(?,?,?)");
			pstmt.setInt(1, dto.getBnum());
			pstmt.setString(2, dto.getUserNickName());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public Admin_QNADTO SelectList(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin_QNADTO dto = new Admin_QNADTO();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where bnum = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setBnum(rs.getInt("bnum"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setWtime(rs.getString("wtime"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dto;
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
