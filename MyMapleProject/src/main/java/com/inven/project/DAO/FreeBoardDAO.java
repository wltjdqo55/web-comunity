package com.inven.project.DAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;

import com.inven.project.DTO.FreeBoardDTO;
import com.mysql.cj.jdbc.MysqlSQLXML;

public class FreeBoardDAO {
	private static FreeBoardDAO freeBoardDAO = new FreeBoardDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "FreeBoard";
	private DataSource dataSource;
	private int sizeOfPage = 20;
	
	
	private final String INSERT_FREE_BOARD_SQL = "insert into " + TABLE_NAME + " (category,userTitle, userName, userId, userPassword, userNickName,BoardContent, hit, recommend, img_file, pub_file1, pub_file2, img_file1) value(?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
	private final String SELECT_LIST_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " order by num desc LIMIT ?, ?";
	private final String INSA_LIST_FREE_BOARD_SQL  = "select * from " + TABLE_NAME + " where category = '인사' order by num desc LIMIT ?, ?";
	private final String JUNGBO_LIST_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " where category = '정보' order by num desc LIMIT ?, ?";
	private final String SMAIL_LIST_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " where category = '웃긴글' order by num desc LIMIT ?, ?";
	private final String SUDA_LIST_FREE_BOARD_SQL  = "select * from " + TABLE_NAME + " where category = '수다' order by num desc LIMIT ?, ?";
	private final String TUPYO_LIST_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " where category = '투표' order by num desc LIMIT ?, ?";
	private final String EVENT_LIST_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " where category = '이벤트' order by num desc LIMIT ?, ?";
	private final String CONTENT_VIEW_FREE_BOARD_SQL = "select * from "+ TABLE_NAME + " where num = ?";
	private final String HIT_BOARD_SQL = "update " + TABLE_NAME + " set hit=(hit+1) where num = ?";
	private final String SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME;
	private final String INSA_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '인사'";
	private final String JUNGBO_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '정보'";
	private final String SMAIL_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '웃긴글'";
	private final String SUDA_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '수다'";
	private final String TUPYO_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '투표'";
	private final String EVENT_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where category = '이벤트'";	
	private final String VOTE_UPDATE_BOARD_SQL = "update " + TABLE_NAME + " set Recommand = (Recommend + 1) where num = ?";
	private final String VOTEfuck_UPDATE_BOARD_SQL = "update " + TABLE_NAME + " set Recommand = (fuckRecommend + 1) where num = ?";
	private final String MODIFY_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " where num = ?";
	private final String DELETE_FREE_BOARD_SQL = "delete from " + TABLE_NAME + " where num = ?";
	private final String MY_WRITING_BOARD_SQL = "select * from " + TABLE_NAME + " where userId = ? order by num desc LIMIT ?, ?";
	private final String MY_COMMENT_BOARD_SQL = "SELECT * FROM FreeBoard WHERE num IN (SELECT Num FROM reply WHERE replyId = ?) ORDER BY num DESC LIMIT ?, ?";
	private final String BNUM_CHECK = "SELECT COUNT(*) FROM reply WHERE Num = ?";
	private final String UPDATE_COUNT = "update " + TABLE_NAME + " set comment = (comment+1) where num = ?";
	private final String MODIFYOK_FREE_BOARD_SQL = "update " + TABLE_NAME + " set category = ?, userTitle = ?, BoardContent = ?, img_file = ?, pub_file1 = ?, pub_file2 = ?,img_file1 =? where num = ?";
	private final String SEARCH_NICKNAME_BOARD_SQL = "select * from " + TABLE_NAME + " where userNickName = ? order by num desc LIMIT ?, ?";
	private final String INDEX_FREE_BOARD_SQL = "select * from " + TABLE_NAME + " order by num desc";
	private final String MYLIST_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where userId = ?";
	private final String SEARCH_USERNICKNAME_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where userNickName = ?";
	private final String MYCOMMENT_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where userId = ?";
	private final String NEXT_CONTENT_VIEW_FREE_BOARD_SQL = "select * from "+ TABLE_NAME + " where num = ?";
	private final String PRED_CONTENT_VIEW_FREE_BOARD_SQL = "select * from "+ TABLE_NAME + " where num = ?";
	private final String RECOMMEND = "update " + TABLE_NAME + " set recommend = (recommend+1) where num = ?";
	private final String FUCKRECOMMEND = "update " + TABLE_NAME + " set fuckrecommend = (fuckrecommend+1) where num = ?";
	private final String HIT_DEFAULT = "update " + TABLE_NAME + " set hit = (hit-1) where num = ?"; 
	private final String TEN_BOARD_SQL = "select * from " + TABLE_NAME + " where recommend>=? order by num desc LIMIT ?, ?";
	private final String TEN_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where recommend >= ?";
	private final String THIRTY_BOARD_SQL = "select * from " + TABLE_NAME + " where recommend>=? order by num desc LIMIT ?, ?";
	private final String THIRTY_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " where recommend >= ?";
	private final String MAX_NUM = "select MAX(num) from " + TABLE_NAME;
	private final String MIN_NUM = "select MIN(num) from " + TABLE_NAME;	
	private final String SEARCH_TITLE_NICKNAME = "SELECT * FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%') OR userNickName LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_TITLE = "SELECT * FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_NICKNAME = "SELECT * FROM " + TABLE_NAME + " WHERE userNickName LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%') OR userNickName LIKE ?";
	private final String SEARCHTITLE_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%')";
	private final String SEARCHNICKNAME_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userNickName LIKE CONCAT('%', ?, '%')";
	
	//관리자//
	private final String ADMIN_BOARD_COUNT_SQL = "select count(num) from " + TABLE_NAME;
	private final String ADMIN_USERNICKNAME_LIST = "SELECT * FROM " + TABLE_NAME + " WHERE userNickName = ? ORDER BY num DESC LIMIT ?, ?";
	private final String ADMIN_USERNICKNAME_COUNT = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userNickName = ?";
	
	private final String SEARCH_boardcategory = "SELECT * FROM " + TABLE_NAME + " WHERE boardcategory LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCHBOARDCATEGORY_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE boardcategory LIKE CONCAT('%', ?, '%')";
	private final String SEARCH_TITLE_BOARDCATEGORY = "SELECT * FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%') OR boardcontent LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_BOARDCATEGORY_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userTitle LIKE CONCAT('%', ?, '%') OR boardcategory LIKE CONCAT('%', ?, '%')";
	
	//통합검색
	private final String InteGratedSearch_SQL = "SELECT \r\n"
			+ "	'FreeBoard' AS free,\r\n"
			+ "    num,\r\n"
			+ "    userTitle,\r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent,\r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM FreeBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
			+ "\r\n"
			+ "UNION\r\n"
			+ "\r\n"
			+ "SELECT \r\n"
			+ "    'WarriorBoard' AS warrior,\r\n"
			+ "    num,\r\n"
			+ "    userTitle,\r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent,\r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM WarriorBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
			+ "\r\n"
			+ "UNION\r\n"
			+ "\r\n"
			+ "SELECT \r\n"
			+ "    'NoticeBoard' AS notice,\r\n"
			+ "    num,\r\n"
			+ "    userTitle, \r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent, \r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM NoticeBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%') ORDER BY LENGTH(userTitle) - LENGTH(REPLACE(userTitle, ? , '')) DESC;;";
	private final String InteGratedSearch_time_SQL = "SELECT \r\n"
			+ "	'FreeBoard' AS free,\r\n"
			+ "    num,\r\n"
			+ "    userTitle,\r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent,\r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM FreeBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
			+ "\r\n"
			+ "UNION\r\n"
			+ "\r\n"
			+ "SELECT \r\n"
			+ "    'WarriorBoard' AS warrior,\r\n"
			+ "    num,\r\n"
			+ "    userTitle,\r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent,\r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM WarriorBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
			+ "\r\n"
			+ "UNION\r\n"
			+ "\r\n"
			+ "SELECT \r\n"
			+ "    'NoticeBoard' AS notice,\r\n"
			+ "    num,\r\n"
			+ "    userTitle, \r\n"
			+ "    category, \r\n"
			+ "    userNickName,\r\n"
			+ "    BoardContent, \r\n"
			+ "    wtime, \r\n"
			+ "    boardcategory \r\n"
			+ "FROM NoticeBoard WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%') order by wtime desc";
	private final String InteGratedSearch_Accuracy_SQL = "SELECT \r\n"
		    + "'FreeBoard' AS free,\r\n"
		    + "    num,\r\n"
		    + "    userTitle,\r\n"
		    + "    category, \r\n"
		    + "    userNickName,\r\n"
		    + "    BoardContent,\r\n"
		    + "    wtime, \r\n"
		    + "    boardcategory \r\n"
		    + "FROM (\r\n"
		    + "    SELECT \r\n"
		    + "        num,\r\n"
		    + "        userTitle,\r\n"
		    + "        category, \r\n"
		    + "        userNickName,\r\n"
		    + "        BoardContent,\r\n"
		    + "        wtime, \r\n"
		    + "        boardcategory, \r\n"
		    + "        LENGTH(userTitle) - LENGTH(REPLACE(userTitle, ?, '')) + LENGTH(BoardContent) - LENGTH(REPLACE(BoardContent, ?, '')) AS matchCount \r\n"
		    + "    FROM FreeBoard\r\n"
		    + "    WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
		    + "    UNION\r\n"
		    + "    SELECT \r\n"
		    + "        num,\r\n"
		    + "        userTitle,\r\n"
		    + "        category, \r\n"
		    + "        userNickName,\r\n"
		    + "        BoardContent,\r\n"
		    + "        wtime, \r\n"
		    + "        boardcategory, \r\n"
		    + "        LENGTH(userTitle) - LENGTH(REPLACE(userTitle, ?, '')) + LENGTH(BoardContent) - LENGTH(REPLACE(BoardContent, ?, '')) AS matchCount \r\n"
		    + "    FROM WarriorBoard\r\n"
		    + "    WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
		    + "    UNION\r\n"
		    + "    SELECT \r\n"
		    + "        num,\r\n"
		    + "        userTitle, \r\n"
		    + "        category, \r\n"
		    + "        userNickName,\r\n"
		    + "        BoardContent, \r\n"
		    + "        wtime, \r\n"
		    + "        boardcategory, \r\n"
		    + "        LENGTH(userTitle) - LENGTH(REPLACE(userTitle, ?, '')) + LENGTH(BoardContent) - LENGTH(REPLACE(BoardContent, ?, '')) AS matchCount \r\n"
		    + "    FROM NoticeBoard\r\n"
		    + "    WHERE userTitle LIKE CONCAT('%', ?, '%') OR BoardContent LIKE CONCAT('%', ?, '%')\r\n"
		    + ") AS results\r\n"
		    + "ORDER BY matchCount DESC";
	private FreeBoardDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static FreeBoardDAO getFreeBoardDAO() {
		return freeBoardDAO;
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
	//통합 검색
	public ArrayList<FreeBoardDTO> InteGratedSearch(String search){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(InteGratedSearch_SQL);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setString(5, search);
			pstmt.setString(6, search);
			pstmt.setString(7, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setBoardcategory(rs.getString("boardcategory"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setCategory(rs.getString("category"));
				dto.setNum(rs.getInt("num"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserTitle(rs.getString("userTitle"));
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
	public ArrayList<FreeBoardDTO> InteGratedSearch_time(String search){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(InteGratedSearch_time_SQL);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setString(5, search);
			pstmt.setString(6, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setBoardcategory(rs.getString("boardcategory"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setCategory(rs.getString("category"));
				dto.setNum(rs.getInt("num"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserTitle(rs.getString("userTitle"));
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
	public ArrayList<FreeBoardDTO> InteGratedSearch_Accuracy(String search){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(InteGratedSearch_Accuracy_SQL);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setString(5, search);
			pstmt.setString(6, search);
			pstmt.setString(7, search);
			pstmt.setString(8, search);
			pstmt.setString(9, search);
			pstmt.setString(10, search);
			pstmt.setString(11, search);
			pstmt.setString(12, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setBoardcategory(rs.getString("boardcategory"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setCategory(rs.getString("category"));
				dto.setNum(rs.getInt("num"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserTitle(rs.getString("userTitle"));
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
	
	
	
	
	
	
	
	// 관리자 //
	//컨텐츠 뷰 가져오는 메소드
	public FreeBoardDTO Admin_Content_View(int num) {
		FreeBoardDTO dto = new FreeBoardDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dto;
	}
	
	
	//관리자페이지 게시판 기준으로 정렬하는 메소드
	public ArrayList<FreeBoardDTO> Admin_Boardcategory_List(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by boardcategory desc LIMIT ?, ?");
			pstmt.setInt(1, curPage*15);
			pstmt.setInt(2, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	//관리자페이지 날짜 기준으로 정렬하는 메소드
	public ArrayList<FreeBoardDTO> Admin_Wtime_List(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by wtime desc LIMIT ?, ?");
			pstmt.setInt(1, curPage*15);
			pstmt.setInt(2, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//관리자페이지 추천 기준으로 정렬하는 메소드
	public ArrayList<FreeBoardDTO> Admin_Recommend_List(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by recommend desc LIMIT ?, ?");
			pstmt.setInt(1, curPage*15);
			pstmt.setInt(2, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	//관리페이지 조회수 기준으로 정렬하는 메소드
	public ArrayList<FreeBoardDTO> Admin_Hit_List(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by hit desc LIMIT ?, ?");
			pstmt.setInt(1, curPage*15);
			pstmt.setInt(2, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	//관리자페이지에서 닉네임으로 찾는 메소드
	public ArrayList<FreeBoardDTO> SearchNickNameAdmin(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_NICKNAME);
			pstmt.setString(1, search);
			pstmt.setInt(2, curPage*15);
			pstmt.setInt(3, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//제목 + 내용으로 찾는 메소드
	public ArrayList<FreeBoardDTO> SearchTitleAndContent(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_TITLE_BOARDCATEGORY);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setInt(3, curPage*15);
			pstmt.setInt(4, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	//게시판으로 찾는 메소드
	public ArrayList<FreeBoardDTO> Searchboardcategory(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_boardcategory);
			pstmt.setString(1, search);
			pstmt.setInt(2, curPage*15);
			pstmt.setInt(3, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	
	//관리자페이지에서 게시판 가져오는 메소드
	public ArrayList<FreeBoardDTO> Admin_FreeBoardListBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " order by num desc limit ?,?");
			pstmt.setInt(1, curPage*15);
			pstmt.setInt(2, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	public void Admin_deleteItemBoardDAO(String[] selectedItems) {
	    Connection conn = getConnection();
	    PreparedStatement pstmt = null;

	    try {
	        StringBuilder sql = new StringBuilder("DELETE FROM FreeBoard WHERE num IN (");
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
	
	
	public int AdminBoardCount() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(ADMIN_BOARD_COUNT_SQL);
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
		
		int totalPage = numberOfArticles_TUPYO / sizeOfPage;
		if(numberOfArticles_TUPYO != 0)
			totalPage = numberOfArticles_TUPYO % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public ArrayList<FreeBoardDTO> AdminUserNickNameList(String userNickName, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(ADMIN_USERNICKNAME_LIST);
			pstmt.setString(1, userNickName);
			pstmt.setInt(2, curPage*15);
			pstmt.setInt(3, 15);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setBoardcategory(rs.getString("boardcategory"));
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	
	
	
	
	// 제목 + 닉네임으로 검색
	public ArrayList<FreeBoardDTO> SearchTitleAndNickName(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_TITLE_NICKNAME);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setInt(3, curPage*sizeOfPage);
			pstmt.setInt(4, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	// 제목으로 검색
	public ArrayList<FreeBoardDTO> SearchTitle(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_TITLE);
			pstmt.setString(1, search);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	// 닉네임으로 검색
	public ArrayList<FreeBoardDTO> SearchNickName(String search, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(SEARCH_NICKNAME);
			pstmt.setString(1, search);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	
	
	
	
	
	// 조회수 1줄여주는 메소드
	public void Hitgood(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(HIT_DEFAULT);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	// commend가 1이면 추천 0이면 비추천
	public void UpdateRecommend(int num, int commend) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		Hitgood(num);	// 자동으로 조회수가 1 증가하기 때문에 임의로 1줄여주는 로직
		if(commend==1) {
			try {
				pstmt = conn.prepareStatement(RECOMMEND);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn);
			}
		}else if(commend==0){
			try {
				pstmt = conn.prepareStatement(FUCKRECOMMEND);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn);
			}
		}
		
	}
	
	
	public ArrayList<FreeBoardDTO> NextContentView(int nextNum, String Comment) throws IOException{
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		FreeBoardDTO dto = new FreeBoardDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HitBoard(nextNum);
		
		try {
			while(true) {
				
				pstmt = conn.prepareStatement(NEXT_CONTENT_VIEW_FREE_BOARD_SQL);
				pstmt.setInt(1, nextNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto.setComment(Integer.parseInt(Comment));
					dto.setNum(rs.getInt("num"));
					dto.setCategory(rs.getString("category"));
					dto.setUserTitle(rs.getString("userTitle"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setBoardContent(rs.getString("BoardContent"));
					dto.setHit(rs.getInt("hit"));
					dto.setRecommend(rs.getInt("recommend"));
					dto.setImg_file(rs.getString("img_file"));
					dto.setPub_file1(rs.getString("pub_file1"));
					dto.setPub_file2(rs.getString("pub_file2"));
					dto.setWtime(rs.getString("wtime"));
					dto.setImg_file1(rs.getString("img_file1"));
					list.add(dto);
					break;
				}else {
					nextNum = nextNum+1;
					if(nextNum>=MAX_NUM()) {
						return new ArrayList<>();
						
					}
						
						
					}
				}
			}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public int MAX_NUM() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;
		try {
			pstmt = conn.prepareStatement(MAX_NUM);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 maxNum = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return maxNum;
	}
	public int MIN_NUM() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int minNum = 0;
		try {
			pstmt = conn.prepareStatement(MIN_NUM);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 minNum = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return minNum;
	}
	public ArrayList<FreeBoardDTO> PredContentView(int predNum, String Comment){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		FreeBoardDTO dto = new FreeBoardDTO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HitBoard(predNum);
		
			try {
				while(true) {
				pstmt = conn.prepareStatement(PRED_CONTENT_VIEW_FREE_BOARD_SQL);
				pstmt.setInt(1, predNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto.setComment(Integer.parseInt(Comment));
					dto.setNum(rs.getInt("num"));
					dto.setCategory(rs.getString("category"));
					dto.setUserTitle(rs.getString("userTitle"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setBoardContent(rs.getString("BoardContent"));
					dto.setHit(rs.getInt("hit"));
					dto.setRecommend(rs.getInt("recommend"));
					dto.setImg_file(rs.getString("img_file"));
					dto.setPub_file1(rs.getString("pub_file1"));
					dto.setPub_file2(rs.getString("pub_file2"));
					dto.setWtime(rs.getString("wtime"));
					dto.setImg_file1(rs.getString("img_file1"));
					list.add(dto);
					break;
				}else {
					predNum = predNum-1;
					if(predNum<= MIN_NUM()) {
					  return new ArrayList<>();
					}
				}
			
		}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> IndexGoodFreeBoardDAO(){
	    Connection conn = getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
	    try {
	        pstmt = conn.prepareStatement(INDEX_FREE_BOARD_SQL);
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	            FreeBoardDTO dto = new FreeBoardDTO();
	            int Count = BNUMChk(rs.getInt("num"));
	            dto.setComment(Count);
	            dto.setNum(rs.getInt("num"));
	            dto.setCategory(rs.getString("category"));
	            dto.setUserTitle(rs.getString("userTitle"));
	            dto.setUserName(rs.getString("userName"));
	            dto.setUserId(rs.getString("userId"));
	            dto.setUserPassword(rs.getString("userPassword"));
	            dto.setUserNickName(rs.getString("userNickName"));
	            dto.setBoardContent(rs.getString("BoardContent"));
	            dto.setHit(rs.getInt("hit"));
	            dto.setRecommend(rs.getInt("recommend"));
	            dto.setImg_file(rs.getString("img_file"));
	            dto.setPub_file1(rs.getString("pub_file1"));
	            dto.setPub_file2(rs.getString("pub_file2"));
	            dto.setWtime(rs.getString("wtime"));
	            dto.setImg_file1(rs.getString("img_file1"));
	            list.add(dto);
	        }
	    }catch(SQLException e) {
	        e.printStackTrace();
	    }finally {
	        close(pstmt, conn, rs);
	    }
	    
	    // 댓글 개수를 기준으로 내림차순 정렬
	    list.sort(Comparator.comparingInt(FreeBoardDTO::getComment).reversed());
	    
	    // 14개만 유지
	    if (list.size() > 14) {
	        list.subList(14, list.size()).clear();
	    }
	    
	    return list;
	}
	public ArrayList<FreeBoardDTO> IndexFreeBoardDAO(){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(INDEX_FREE_BOARD_SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> SearchNickNameBOARD(String userNickName, int curPage){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(SEARCH_NICKNAME_BOARD_SQL);
			pstmt.setString(1, userNickName);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	public void countUpdate(int count, int bnum) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(UPDATE_COUNT);
			pstmt.setInt(1, bnum);
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void FreeBoardModify(FreeBoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(MODIFYOK_FREE_BOARD_SQL);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getUserTitle());
			pstmt.setString(3, dto.getBoardContent());
			pstmt.setString(4, dto.getImg_file());
			pstmt.setString(5, dto.getPub_file1());
			pstmt.setString(6, dto.getPub_file2());
			pstmt.setString(7, dto.getImg_file1());
			pstmt.setInt(8, dto.getNum());
			pstmt.executeUpdate();
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	
	public ArrayList<FreeBoardDTO> board_Free_my_comment(FreeBoardDTO dto, int curPage) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(MY_COMMENT_BOARD_SQL);
			pstmt.setString(1, dto.getUserId());
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dtoo = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dtoo.setComment(Count);
				dtoo.setNum(rs.getInt("num"));
				dtoo.setCategory(rs.getString("category"));
				dtoo.setUserTitle(rs.getString("userTitle"));
				dtoo.setUserName(rs.getString("userName"));
				dtoo.setUserId(rs.getString("userId"));
				dtoo.setUserPassword(rs.getString("userPassword"));
				dtoo.setUserNickName(rs.getString("userNickName"));
				dtoo.setBoardContent(rs.getString("BoardContent"));
				dtoo.setHit(rs.getInt("hit"));
				dtoo.setRecommend(rs.getInt("recommend"));
				dtoo.setImg_file(rs.getString("img_file"));
				dtoo.setPub_file1(rs.getString("pub_file1"));
				dtoo.setPub_file2(rs.getString("pub_file2"));
				dtoo.setWtime(rs.getString("wtime"));
				dtoo.setImg_file1(rs.getString("img_file1"));
				list.add(dtoo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	
	public ArrayList<FreeBoardDTO> board_Free_my_writing(FreeBoardDTO dto, int curPage) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		try {
			pstmt = conn.prepareStatement(MY_WRITING_BOARD_SQL);
			pstmt.setString(1, dto.getUserId());
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dtoo = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dtoo.setComment(Count);
				dtoo.setNum(rs.getInt("num"));
				dtoo.setCategory(rs.getString("category"));
				dtoo.setUserTitle(rs.getString("userTitle"));
				dtoo.setUserName(rs.getString("userName"));
				dtoo.setUserId(rs.getString("userId"));
				dtoo.setUserPassword(rs.getString("userPassword"));
				dtoo.setUserNickName(rs.getString("userNickName"));
				dtoo.setBoardContent(rs.getString("BoardContent"));
				dtoo.setHit(rs.getInt("hit"));
				dtoo.setRecommend(rs.getInt("recommend"));
				dtoo.setImg_file(rs.getString("img_file"));
				dtoo.setPub_file1(rs.getString("pub_file1"));
				dtoo.setPub_file2(rs.getString("pub_file2"));
				dtoo.setWtime(rs.getString("wtime"));
				dtoo.setImg_file1(rs.getString("img_file1"));
				list.add(dtoo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public FreeBoardDTO board_Free_modifyDAO(FreeBoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FreeBoardDTO dtoo = new FreeBoardDTO();
		try {
			pstmt = conn.prepareStatement(MODIFY_FREE_BOARD_SQL);
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtoo.setNum(rs.getInt("num"));
				dtoo.setUserName(rs.getString("userName"));
				dtoo.setBoardContent(rs.getString("BoardContent"));
				dtoo.setCategory(rs.getString("category"));
				dtoo.setUserTitle(rs.getString("usertitle"));
				dtoo.setUserNickName(rs.getString("userNickName"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dtoo;
		
	}
	
	public void FreeBoardDeleteDAO(FreeBoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(DELETE_FREE_BOARD_SQL);
			pstmt.setInt(1, dto.getNum());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	
	
	
	public void VoteRecommend(int BNUM) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(VOTE_UPDATE_BOARD_SQL);
			pstmt.setInt(1, BNUM);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void VotefuckRecommend(int BNUM) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(VOTEfuck_UPDATE_BOARD_SQL);
			pstmt.setInt(1, BNUM);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	
	
	public void FreeBoardListWrite(FreeBoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(INSERT_FREE_BOARD_SQL);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getUserTitle());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserId());
			pstmt.setString(5, dto.getUserPassword());
			pstmt.setString(6, dto.getUserNickName());
			pstmt.setString(7, dto.getBoardContent());
			pstmt.setInt(8, dto.getHit());
			pstmt.setInt(9, dto.getRecommend());
			pstmt.setString(10, dto.getImg_file());
			pstmt.setString(11, dto.getPub_file1());
			pstmt.setString(12, dto.getPub_file2());
			pstmt.setString(13, dto.getImg_file1());
			
			pstmt.executeUpdate();
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public int cntOfListAdmin(int curPage) {
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
	public int calTotalPageAdmin(int curPage) {
		int numberOfArticles = cntOfListAdmin(curPage);
		
		int totalPage = numberOfArticles / 15;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
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
	public int cntOfList_SUDA() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SUDA_SELECT_COUNT_OF_LIST);
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
	public int calTotalPage_SUDA() {
		int numberOfArticles_SUDA = cntOfList_SUDA();
		
		int totalPage = numberOfArticles_SUDA / sizeOfPage;
		if(numberOfArticles_SUDA != 0)
			totalPage = numberOfArticles_SUDA % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_searchUserNickName(String userNickName) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCH_USERNICKNAME_SELECT_COUNT_OF_LIST);
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
	public int calTotalPage_searchUserNickName(String userNickName) {
		int numberOfArticles_searchUserNickName = cntOfList_searchUserNickName(userNickName);
		
		int totalPage = numberOfArticles_searchUserNickName / sizeOfPage;
		if(numberOfArticles_searchUserNickName != 0)
			totalPage = numberOfArticles_searchUserNickName % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	public int cntOfList_TUPYO() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(TUPYO_SELECT_COUNT_OF_LIST);
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
	public int calTotalPage_TUPYO() {
		int numberOfArticles_TUPYO = cntOfList_TUPYO();
		
		int totalPage = numberOfArticles_TUPYO / sizeOfPage;
		if(numberOfArticles_TUPYO != 0)
			totalPage = numberOfArticles_TUPYO % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	public int calTotalPage_Thirty() {
		int numberOfArticles_Thirty = cntOfList_Thirty();
		
		int totalPage = numberOfArticles_Thirty / sizeOfPage;
		if(numberOfArticles_Thirty != 0)
			totalPage = numberOfArticles_Thirty % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_Thirty() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(THIRTY_SELECT_COUNT_OF_LIST);
			pstmt.setInt(1, 30);
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
	public int calTotalPage_Ten() {
		int numberOfArticles_Ten = cntOfList_Ten();
		
		int totalPage = numberOfArticles_Ten / sizeOfPage;
		if(numberOfArticles_Ten != 0)
			totalPage = numberOfArticles_Ten % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_Ten() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(TEN_SELECT_COUNT_OF_LIST);
			pstmt.setInt(1, 10);
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
	public int cntOfList_EVENT() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(EVENT_SELECT_COUNT_OF_LIST);
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
	public int calTotalPage_EVENT() {
		int numberOfArticles_EVENT = cntOfList_EVENT();
		
		int totalPage = numberOfArticles_EVENT / sizeOfPage;
		if(numberOfArticles_EVENT != 0)
			totalPage = numberOfArticles_EVENT % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_SMAIL() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SMAIL_SELECT_COUNT_OF_LIST);
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
	public int calTotalPage_SMAIL() {
		int numberOfArticles_SMAIL = cntOfList_SMAIL();
		
		int totalPage = numberOfArticles_SMAIL / sizeOfPage;
		if(numberOfArticles_SMAIL != 0)
			totalPage = numberOfArticles_SMAIL % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_SearchTitleandBoardcategory(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCH_BOARDCATEGORY_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
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
	public int calTotalPage_SearchTitleandBoardcategory(String search) {
		int numberOfArticles_Search = cntOfList_SearchTitleandBoardcategory(search);
		
		int totalPage = numberOfArticles_Search / 15;
		if(numberOfArticles_Search != 0)
			totalPage = numberOfArticles_Search % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	
	public int cntOfList_Search(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCH_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
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
	public int calTotalPage_Search(String search) {
		int numberOfArticles_Search = cntOfList_Search(search);
		
		int totalPage = numberOfArticles_Search / sizeOfPage;
		if(numberOfArticles_Search != 0)
			totalPage = numberOfArticles_Search % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	public int cntOfList_Searchboardcategory(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCHBOARDCATEGORY_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
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
	public int calTotalPage_Searchboardcategory(String search) {
		int numberOfArticles_SearchTitle = cntOfList_Searchboardcategory(search);
		
		int totalPage = numberOfArticles_SearchTitle / 15;
		if(numberOfArticles_SearchTitle != 0)
			totalPage = numberOfArticles_SearchTitle % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_SearchTitle(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCHTITLE_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
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
	public int calTotalPage_SearchTitle(String search) {
		int numberOfArticles_SearchTitle = cntOfList_SearchTitle(search);
		
		int totalPage = numberOfArticles_SearchTitle / 15;
		if(numberOfArticles_SearchTitle != 0)
			totalPage = numberOfArticles_SearchTitle % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_SearchNickNameAdmin(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCHNICKNAME_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
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
	public int calTotalPage_SearchNickNameAdmin(String search) {
		int numberOfArticles_SearchNickName = cntOfList_SearchNickNameAdmin(search);
		
		int totalPage = numberOfArticles_SearchNickName / 15;
		if(numberOfArticles_SearchNickName != 0)
			totalPage = numberOfArticles_SearchNickName % 15 == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_SearchNickName(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCHNICKNAME_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
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
	public int calTotalPage_SearchNickName(String search) {
		int numberOfArticles_SearchNickName = cntOfList_SearchNickName(search);
		
		int totalPage = numberOfArticles_SearchNickName / sizeOfPage;
		if(numberOfArticles_SearchNickName != 0)
			totalPage = numberOfArticles_SearchNickName % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	public int cntOfList_JUNGBO() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(JUNGBO_SELECT_COUNT_OF_LIST);
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
	
	public int calTotalPage_JUNGBO() {
		int numberOfArticles_JUNGBO = cntOfList_JUNGBO();
		
		int totalPage = numberOfArticles_JUNGBO / sizeOfPage;
		if(numberOfArticles_JUNGBO != 0)
			totalPage = numberOfArticles_JUNGBO % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int calTotalPage_MyComment(FreeBoardDTO dto) {
		int numberOfArticles_MyComment = cntOfList_MyComment(dto);
		
		int totalPage = numberOfArticles_MyComment / sizeOfPage;
		if(numberOfArticles_MyComment != 0)
			totalPage = numberOfArticles_MyComment % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_MyComment(FreeBoardDTO dto) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(MYCOMMENT_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, dto.getUserId());
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
	public int calTotalPage_Mylist(FreeBoardDTO dto) {
		int numberOfArticles_Mylist = cntOfList_Mylist(dto);
		
		int totalPage = numberOfArticles_Mylist / sizeOfPage;
		if(numberOfArticles_Mylist != 0)
			totalPage = numberOfArticles_Mylist % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList_Mylist(FreeBoardDTO dto) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(MYLIST_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, dto.getUserId());
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
	public int cntOfList_INSA() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(INSA_SELECT_COUNT_OF_LIST);
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
	
	public int calTotalPage_INSA() {
		int numberOfArticles_INSA = cntOfList_INSA();
		
		int totalPage = numberOfArticles_INSA / sizeOfPage;
		if(numberOfArticles_INSA != 0)
			totalPage = numberOfArticles_INSA % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	
	public int BNUMChk(int number) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0 ;
		try {
			pstmt = conn.prepareStatement(BNUM_CHECK);
			pstmt.setInt(1, number);
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
	public ArrayList<FreeBoardDTO> FreeBoardListBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(SELECT_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				dto.setBoardcategory(rs.getString("boardcategory"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardEventBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(EVENT_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardInsaBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(INSA_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardJungboBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(JUNGBO_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardSmailBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(SMAIL_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardSudaBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(SUDA_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	
	public ArrayList<FreeBoardDTO> ThirtyBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(THIRTY_BOARD_SQL);
			pstmt.setInt(1, 30);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> TenBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(TEN_BOARD_SQL);
			pstmt.setInt(1, 10);
			pstmt.setInt(2, curPage*sizeOfPage);
			pstmt.setInt(3, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public ArrayList<FreeBoardDTO> FreeBoardTupyoBoard(int curPage){
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(TUPYO_LIST_FREE_BOARD_SQL);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				int Count = BNUMChk(rs.getInt("num"));
				dto.setComment(Count);
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public void HitBoard(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(HIT_BOARD_SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	public ArrayList<FreeBoardDTO> FreeBoardContentview(FreeBoardDTO dto) {
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HitBoard(dto.getNum());
		
		
		try {
			pstmt = conn.prepareStatement(CONTENT_VIEW_FREE_BOARD_SQL);
			pstmt.setInt(1, dto.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setComment(dto.getComment());
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setUserTitle(rs.getString("userTitle"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setBoardContent(rs.getString("BoardContent"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setImg_file(rs.getString("img_file"));
				dto.setPub_file1(rs.getString("pub_file1"));
				dto.setPub_file2(rs.getString("pub_file2"));
				dto.setWtime(rs.getString("wtime"));
				dto.setFuckrecommend(rs.getInt("fuckrecommend"));
				dto.setImg_file1(rs.getString("img_file1"));
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
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
