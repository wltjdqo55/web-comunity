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

import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;
import com.inven.project.DTO.QNADTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.ReportDTO;

public class QNADAO {
	private static QNADAO qnaDAO = new QNADAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "QNA";
	private DataSource dataSource;
	
	
	

	private QNADAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static QNADAO getQnaDAO() {
		return qnaDAO;
	}
	// 문의 등록
	
	public void InsertQNA(QNADTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into " + TABLE_NAME + "(userNickName, QNARadio, content) values(?,?,?)");
			pstmt.setString(1, dto.getUserNickName());
			pstmt.setString(2, dto.getQNARadio());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	// 리스트 해당 닉네임만 가져오기
	public ArrayList<QNADTO> ListQNA(String userNickName){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QNADTO> list = new ArrayList<QNADTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where userNickName = ? order by num desc");
			pstmt.setString(1, userNickName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QNADTO dto = new QNADTO();
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setQNARadio(rs.getString("QNARadio"));
				dto.setState(rs.getString("State"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setWtime(rs.getString("wtime"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	// 모든 리스트 가져오기
	public ArrayList<QNADTO> ListALLQNA(){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QNADTO> list = new ArrayList<QNADTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by State asc, num desc");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QNADTO dto = new QNADTO();
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setQNARadio(rs.getString("QNARadio"));
				dto.setState(rs.getString("State"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setWtime(rs.getString("wtime"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//넘의 값 dto 가져오기
	public QNADTO ListNum(int num){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QNADTO dto = new QNADTO();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setQNARadio(rs.getString("QNARadio"));
				dto.setState(rs.getString("State"));
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
	
	
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
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
