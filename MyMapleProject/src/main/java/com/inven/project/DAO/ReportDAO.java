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
import com.inven.project.DTO.ReplyDTO;
import com.inven.project.DTO.ReportDTO;

public class ReportDAO {
	private static ReportDAO reportDAO = new ReportDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "Report";
	private DataSource dataSource;
	private int sizeOfPage = 10;
	
	private final String WRITE_NOTE_SQL = "insert into " + TABLE_NAME + " (userNickName, tosendNickName, title, content) value(?,?,?,?)";
	private final String LIST_WRITE_SQL = "select * from " + TABLE_NAME + " where userNickName = ? and (cases = ? or cases= ?) order by num desc LIMIT ?, ?";
	private final String SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME;
	private final String SELECT_WRITE_CONTENT_VIEW = "select * from " + TABLE_NAME + " where num = ?";
	private final String LIST_SEND_SQL = "select * from " + TABLE_NAME + " where tosendNickName = ? and (cases = ? or cases= ?) order by num desc LIMIT ?, ?";
	
	//관리자//
	
	private final String ADMIN_NOTE_COUNT_SQL = "select count(num) from " + TABLE_NAME;
	
	
	private ReportDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static ReportDAO getReportDAO() {
		return reportDAO;
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
	public void ReportInsertDAO(ReportDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into " + TABLE_NAME + "(title, userNickName, replyNickName, reportcontent, ReportRadio) values(?,?,?,?,?)");
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getUserNickName());
			pstmt.setString(3, dto.getReplyNickName());
			pstmt.setString(4, dto.getReportcontent());
			pstmt.setString(5, dto.getReportRadio());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public ArrayList<ReportDTO> Admin_Report_List_DAO(){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReportDTO> list = new ArrayList<ReportDTO>();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by State asc, num desc");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReportDTO dto = new ReportDTO();
				dto.setNum(rs.getInt("num"));
				dto.setReplyNickName(rs.getString("replyNickName"));
				dto.setReportcontent(rs.getString("reportcontent"));
				dto.setReportRadio(rs.getString("ReportRadio"));
				dto.setTitle(rs.getString("title"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setState(rs.getString("State"));
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
	public void Admin_Update_State(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set State = ? where num = ?");
			pstmt.setString(1, "처리완료");
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public int Admin_replyNickNameCount(String replyNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from " + TABLE_NAME + " where replyNickName = ?");
			pstmt.setString(1, replyNickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return count;
	}
	public ReportDTO Admin_Report_Content_DAO(int num) {
		Connection conn =getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReportDTO dto = new ReportDTO();
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setReplyNickName(rs.getString("replyNickName"));
				dto.setReportcontent(rs.getString("reportcontent"));
				dto.setReportRadio(rs.getString("ReportRadio"));
				dto.setTitle(rs.getString("title"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setWtime(rs.getString("wtime"));
				dto.setState(rs.getString("State"));
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
