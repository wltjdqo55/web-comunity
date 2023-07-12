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
import com.inven.project.DTO.NoticeReplyDTO;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

public class NoticeReplyDAO {
	private static NoticeReplyDAO replyDAO = new NoticeReplyDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "Noticereply";
	private DataSource dataSource;
	
	private final String REPLY_WRITE_BOARD_SQL = "insert into Noticereply(num, replytext, replyNickName, replyId, replyPassword, replyName, groupNum) values(?,?,?,?,?,?,?)";
	private final String REPLY_LIST_BOARD_SQL = "select * from " + TABLE_NAME + " where num = ? order by groupNum asc, stepNum asc";
	private final String GROUPNUM_UPDATE_BOARD_SQL = "select MAX(bnum) from " + TABLE_NAME;
	private final String REPLY_INSERT_BOARD_SQL = "insert into Noticereply(num, replytext, replyNickName, replyId, replyPassword, replyName, groupNum,stepNum) values(?,?,?,?,?,?,?,?)";
//	private final String UPDATE_STEPNUM = "update " + TABLE_NAME + " set stepNum = (stepNum+1) where groupNum = ? stepNum>=?";
	private final String DELETE_REPLY_BOARD_SQL = "delete from " + TABLE_NAME + " where bnum = ?";
	
	//관리자 //
	private final String ADMIN_REPLY_COUNT_SQL = "select count(bnum) from " + TABLE_NAME;
	private final String AdminReply_User_Count = "select count(*) from " + TABLE_NAME + " where replyNickName = ?";
	private final String ADMIN_COMMENT_LIST_BOARD_SQL = "select * from " + TABLE_NAME + " where replyNickName = ? ORDER BY bnum DESC LIMIT ?, ?";
	private final String ADMIN_USERNICKNAME_COUNT = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE replyNickName = ?";
	
	private NoticeReplyDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static NoticeReplyDAO getReplyDAO() {
		return replyDAO;
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
	public void Admin_deleteItemBoardDAO(String[] selectedItems) {
	    Connection conn = getConnection();
	    PreparedStatement pstmt = null;

	    try {
	        StringBuilder sql = new StringBuilder("DELETE FROM reply WHERE bnum IN (");
	        for (int i = 0; i < selectedItems.length; i++) {
	            sql.append("?");
	            if (i < selectedItems.length - 1) {
	                sql.append(", ");
	            }
	        }
	        sql.append(")");

	        pstmt = conn.prepareStatement(sql.toString());

	        // 인덱스를 활용하여 PreparedStatement에 선택된 항목 값을 설정합니다.
	        for (int i = 0; i < selectedItems.length; i++) {
	            pstmt.setString(i + 1, selectedItems[i]);
	        }

	        pstmt.executeUpdate(); // SQL 문 실행하여 레코드 삭제

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt, conn);
	    }
	}
	public int cntOfList_AdminUserNickNameList(String userNickName) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(ADMIN_USERNICKNAME_COUNT);
			pstmt.setString(1, userNickName);
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
	public int calTotalPage_AdminUserNickNameList(String userNickName) {
		int numberOfArticles_TUPYO = cntOfList_AdminUserNickNameList(userNickName);
		
		int totalPage = numberOfArticles_TUPYO / 15;
		if(numberOfArticles_TUPYO != 0)
			totalPage = numberOfArticles_TUPYO % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public ArrayList<NoticeReplyDTO> AdminUserComment(String userNickName, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<NoticeReplyDTO> list = new ArrayList<NoticeReplyDTO>();
		try {
			pstmt = conn.prepareStatement(ADMIN_COMMENT_LIST_BOARD_SQL);
			pstmt.setString(1, userNickName);
			pstmt.setInt(2, curPage*15);
			pstmt.setInt(3, 15);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeReplyDTO dto = new NoticeReplyDTO();
				dto.setBoardcategory(rs.getString("boardcategory"));
				dto.setBnum(rs.getInt("bnum"));
				dto.setNum(rs.getInt("num"));
				dto.setReplyName(rs.getString("replyName"));
				dto.setReplytext(rs.getString("replytext"));
				dto.setReplyId(rs.getString("replyId"));
				dto.setReplyNickName(rs.getString("replyNickName"));
				dto.setReplyPassword(rs.getString("replyPassword"));
				dto.setWtime(rs.getString("wtime"));
				dto.setGroupNum(rs.getInt("groupNum"));
				dto.setStepNum(rs.getInt("stepNum"));
				list.add(dto);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public int AdminReplyCount() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(ADMIN_REPLY_COUNT_SQL);
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
	public int AdminReply_User_Count(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = conn.prepareStatement(AdminReply_User_Count);
			pstmt.setString(1, userNickName);
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
	
	
	
	
	//댓글//
	public void delete_Reply_DAO(int bnum) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(DELETE_REPLY_BOARD_SQL);
			pstmt.setInt(1, bnum);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public int GroupNum() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(GROUPNUM_UPDATE_BOARD_SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("MAX(bnum)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return result + 1;
	}
	
	public void WriteReply(NoticeReplyDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = GroupNum();
		try {
			pstmt = conn.prepareStatement(REPLY_WRITE_BOARD_SQL);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getReplytext());
			pstmt.setString(3, dto.getReplyNickName());
			pstmt.setString(4, dto.getReplyId());
			pstmt.setString(5, dto.getReplyPassword());
			pstmt.setString(6, dto.getReplyName());
			pstmt.setInt(7, result);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public ArrayList<NoticeReplyDTO> ListreplyDAO(int num){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<NoticeReplyDTO> list = new ArrayList<NoticeReplyDTO>();
		try {
			pstmt = conn.prepareStatement(REPLY_LIST_BOARD_SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeReplyDTO dto = new NoticeReplyDTO();
				
				dto.setBnum(rs.getInt("bnum"));
				dto.setNum(rs.getInt("num"));
				dto.setReplyName(rs.getString("replyName"));
				dto.setReplytext(rs.getString("replytext"));
				dto.setReplyId(rs.getString("replyId"));
				dto.setReplyNickName(rs.getString("replyNickName"));
				dto.setReplyPassword(rs.getString("replyPassword"));
				dto.setWtime(rs.getString("wtime"));
				dto.setGroupNum(rs.getInt("groupNum"));
				dto.setStepNum(rs.getInt("stepNum"));
//				dto.setNum(rs.getInt("num"));
				list.add(dto);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public void WriteInsert(NoticeReplyDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
//		updateStepNum(dto);
		try {
			pstmt = conn.prepareStatement(REPLY_INSERT_BOARD_SQL);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getReplytext());
			pstmt.setString(3, dto.getReplyNickName());
			pstmt.setString(4, dto.getReplyId());
			pstmt.setString(5, dto.getReplyPassword());
			pstmt.setString(6, dto.getReplyName());
			pstmt.setInt(7, dto.getGroupNum());
			pstmt.setInt(8, dto.getStepNum()+1);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
		
	}
//	public void updateStepNum(NoticeReplyDTO dto) {
//		Connection conn = getConnection();
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(UPDATE_STEPNUM);
//			pstmt.setInt(1, dto.getGroupNum());
//			pstmt.setInt(2, dto.getStepNum()+1);
//			
//			pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt, conn);
//		}
//	}
	
	
	
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
