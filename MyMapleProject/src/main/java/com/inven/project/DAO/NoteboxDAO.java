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

public class NoteboxDAO {
	private static NoteboxDAO noteboxDAO = new NoteboxDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "notebox";
	private DataSource dataSource;
	private int sizeOfPage = 10;
	
	private final String WRITE_NOTE_SQL = "insert into " + TABLE_NAME + " (userNickName, tosendNickName, title, content) value(?,?,?,?)";
	private final String LIST_WRITE_SQL = "select * from " + TABLE_NAME + " where userNickName = ? and (cases = ? or cases= ?) order by num desc LIMIT ?, ?";
	private final String SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME;
	private final String SELECT_WRITE_CONTENT_VIEW = "select * from " + TABLE_NAME + " where num = ?";
	private final String LIST_SEND_SQL = "select * from " + TABLE_NAME + " where tosendNickName = ? and (cases = ? or cases= ?) order by num desc LIMIT ?, ?";
	
	//관리자//
	
	private final String ADMIN_NOTE_COUNT_SQL = "select count(num) from " + TABLE_NAME;
	
	
	private NoteboxDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static NoteboxDAO getNoteboxDAO() {
		return noteboxDAO;
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
	//관리자//
	public int AdminNoteCount() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(ADMIN_NOTE_COUNT_SQL);
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
	
	
	
	//우편함//
	public void deleteItemNoteDAO(String[] selectedItems) {
		  Connection conn = getConnection();
		  PreparedStatement pstmt = null;
		  
		  try {
		    StringBuilder sql = new StringBuilder("update notebox set cases = ? WHERE num IN (");
		    for (int i = 0; i < selectedItems.length; i++) {
		      sql.append("?");
		      if (i < selectedItems.length - 1) {
		        sql.append(", ");
		      }
		    }
		    sql.append(")");
		    
		    pstmt = conn.prepareStatement(sql.toString());
		    pstmt.setInt(1, 2);
		    
		    // 인덱스를 활용하여 PreparedStatement에 선택된 항목 값을 설정합니다.
		    for (int i = 0; i < selectedItems.length; i++) {
		      pstmt.setString(i + 2, selectedItems[i]);
		    }
		    
		    pstmt.executeUpdate(); // SQL 문 실행하여 레코드 삭제
		    
		  } catch (SQLException e) {
		    e.printStackTrace();
		  } finally {
		    close(pstmt, conn);
		  }
		}
	public void deleteItemDAO(String[] selectedItems) {
		  Connection conn = getConnection();
		  PreparedStatement pstmt = null;
		  
		  try {
		    StringBuilder sql = new StringBuilder("update notebox set cases = ? WHERE num IN (");
		    for (int i = 0; i < selectedItems.length; i++) {
		      sql.append("?");
		      if (i < selectedItems.length - 1) {
		        sql.append(", ");
		      }
		    }
		    sql.append(")");
		    
		    pstmt = conn.prepareStatement(sql.toString());
		    pstmt.setInt(1, 3);
		    
		    // 인덱스를 활용하여 PreparedStatement에 선택된 항목 값을 설정합니다.
		    for (int i = 0; i < selectedItems.length; i++) {
		      pstmt.setString(i + 2, selectedItems[i]);
		    }
		    
		    pstmt.executeUpdate(); // SQL 문 실행하여 레코드 삭제
		    
		  } catch (SQLException e) {
		    e.printStackTrace();
		  } finally {
		    close(pstmt, conn);
		  }
		}
	public void writeNoteDAO(NoteboxDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(WRITE_NOTE_SQL);
			pstmt.setString(1, dto.getUserNickName());
			pstmt.setString(2, dto.getTosendNickName());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public int cntOfList() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SELECT_COUNT_OF_LIST);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn, rs);
		}		
		return cnt;
	}
	public int calTotalPage() {
		int numberOfArticles = cntOfList();
		
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public ArrayList<NoteboxDTO> writeStorageDAO(String userNickName, int curPage){
		ArrayList<NoteboxDTO> list = new ArrayList<NoteboxDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(LIST_WRITE_SQL);
			pstmt.setString(1, userNickName);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, 2);
			pstmt.setInt(4, curPage*sizeOfPage);
			pstmt.setInt(5, sizeOfPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoteboxDTO dto = new NoteboxDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setTosendNickName(rs.getString("tosendNickName"));
				dto.setWtime(rs.getString("wtime"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<NoteboxDTO> sendStorageDAO(String userNickName, int curPage){
		ArrayList<NoteboxDTO> list = new ArrayList<NoteboxDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(LIST_SEND_SQL);
			pstmt.setString(1, userNickName);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, 3);
			pstmt.setInt(4, curPage*sizeOfPage);
			pstmt.setInt(5, sizeOfPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoteboxDTO dto = new NoteboxDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setTosendNickName(rs.getString("tosendNickName"));
				dto.setWtime(rs.getString("wtime"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public NoteboxDTO writeContentView(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoteboxDTO dto = new NoteboxDTO();
		try {
			pstmt = conn.prepareStatement(SELECT_WRITE_CONTENT_VIEW);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setTosendNickName(rs.getString("tosendNickName"));
				dto.setWtime(rs.getString("wtime"));
				dto.setContent(rs.getString("content"));
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
