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

import com.inven.project.DTO.AdminNoticeDTO;
import com.inven.project.DTO.MemberDTO;
import com.inven.project.DTO.NoteboxDTO;
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.ReportDTO;

public class AdminNoticeDAO {
	private static AdminNoticeDAO adminNoticeDAO = new AdminNoticeDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "AdminNotice";
	private DataSource dataSource;
	
	
	//관리자//
	//모든 관리자 게시글 가져오기
	public ArrayList<AdminNoticeDTO> Admin_Notice_List(){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminNoticeDTO> list = new ArrayList<AdminNoticeDTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by num desc");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminNoticeDTO dto = new AdminNoticeDTO();
				dto.setBoard(rs.getString("board"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setNum(rs.getInt("num"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				dto.setWtime(rs.getString("wtime"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	//관리자가 게시글 등록
	public void Admin_Board_Insert(AdminNoticeDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into " + TABLE_NAME + "(board, title, content) values(?,?,?)");
			pstmt.setString(1, dto.getBoard());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	//수정하기
	public void Admin_Notice_Update(AdminNoticeDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set title=? , content=? where num = ?");
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	//조회수 증가
	public void Admin_Hit(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set hit = (hit+1) where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	//컨텐츠 뷰 가져오기 관리자
	public AdminNoticeDTO Admin_Content_View(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin_Hit(num);
		AdminNoticeDTO dto = new AdminNoticeDTO();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBoard(rs.getString("board"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setNum(rs.getInt("num"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				dto.setWtime(rs.getString("wtime"));
				dto.setCategory(rs.getString("category"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dto;
	}
	
	
	//자유게시판 공지사항 리스트 가져오기
	public ArrayList<AdminNoticeDTO> Admin_Board_List_Free() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		ArrayList<AdminNoticeDTO> list = new ArrayList<AdminNoticeDTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where board = ? order by wtime desc");
			pstmt.setString(1, "자유게시판");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminNoticeDTO dto = new AdminNoticeDTO();
				dto.setBoard(rs.getString("board"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setNum(rs.getInt("num"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				dto.setWtime(rs.getString("wtime"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//직업게시판 공지사항 리스트 가져오기
	public ArrayList<AdminNoticeDTO> Admin_Board_List_Warrior() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		ArrayList<AdminNoticeDTO> list = new ArrayList<AdminNoticeDTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where board = ? order by wtime desc");
			pstmt.setString(1, "직업게시판");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminNoticeDTO dto = new AdminNoticeDTO();
				dto.setBoard(rs.getString("board"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setNum(rs.getInt("num"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				dto.setWtime(rs.getString("wtime"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//정보공유게시판 공지사항 리스트 가져오기
	public ArrayList<AdminNoticeDTO> Admin_Board_List_Notice() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		ArrayList<AdminNoticeDTO> list = new ArrayList<AdminNoticeDTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where board = ? order by wtime desc");
			pstmt.setString(1, "정보게시판");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminNoticeDTO dto = new AdminNoticeDTO();
				dto.setBoard(rs.getString("board"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setNum(rs.getInt("num"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				dto.setWtime(rs.getString("wtime"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	private AdminNoticeDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static AdminNoticeDAO getAdminNoticeDAO() {
		return adminNoticeDAO;
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
