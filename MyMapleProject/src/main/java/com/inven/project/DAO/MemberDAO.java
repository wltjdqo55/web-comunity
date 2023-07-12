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

import com.inven.project.DTO.AdminDeleteDTO;
import com.inven.project.DTO.FreeBoardDTO;
import com.inven.project.DTO.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/MyProject";
	private final String TABLE_NAME = "UserBoard";
	private DataSource dataSource;
	private int sizeOfPage = 15;
	
	private final String INSERT_MEMBER_SQL = "insert into " + TABLE_NAME + " (userId, userPassword, userNickName, userPhoneNumber, userEmail, isMailReceptionChecked, isPhoneReceptionChecked, userName, userBirth) value(?,?,?,?,?,?,?,?,?)"; 
	private final String LOGIN_MEMBER_SQL = "select * from " + TABLE_NAME + " where userId = ? and userPassword = ?";
	private final String MODIFY_MEMBER_SQL = "update " + TABLE_NAME + " set userName = ?, userEmail = ?, userPhoneNumber = ? where userId = ?";
	private final String PASSWORD_UPDATE_MEMBER_SQL = "update " + TABLE_NAME + " set userPassword = ? where userId = ?";
	private final String DELETE_MEMBER_SQL = "delete from " + TABLE_NAME + " where userId = ?";
	private final String USERID_CHECK_MEMBER_SQL = "select * from " + TABLE_NAME + " where userId = ?";
	private final String USERNICKNAME_CHECK_MEMBER_SQL = "select * from " + TABLE_NAME + " where userNickName = ?";
	private final String FIND_USER_IDPASSWORD_MEMBER_SQL = "select * from " + TABLE_NAME + " where userName = ? and userBirth = ? and userEmail = ? and userPhoneNumber = ?";
	private final String UPDATE_USER_PASSWORD_MEMBER_SQL = "update " + TABLE_NAME + " set userPassword = ? where userId = ?";
	
	// 관리자 SQL
	private final String ADMIN_MEMBER_COUNT_SQL = "select count(num) from " + TABLE_NAME;
	private final String ADMIN_LIST_MEMBER = "SELECT * FROM " + TABLE_NAME + " ORDER BY CASE WHEN role = 'super' THEN 0 WHEN role = 'admin' THEN 1 ELSE 2 END, num DESC LIMIT ?, ?";
	private final String SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME;
	
	private final String SEARCH_TITLE_NICKNAME = "SELECT * FROM " + TABLE_NAME + " WHERE userId LIKE CONCAT('%', ?, '%') or userNickName LIKE CONCAT('%', ?, '%') OR userName LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_TITLE = "SELECT * FROM " + TABLE_NAME + " WHERE userId LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_NICKNAME = "SELECT * FROM " + TABLE_NAME + " WHERE userNickName LIKE CONCAT('%', ?, '%') ORDER BY num DESC LIMIT ?, ?";
	private final String SEARCH_USER = "SELECT * FROM " + TABLE_NAME + " where role = ? order by num desc limit ?,?";
	private final String SEARCH_ADMIN = "SELECT * FROM " + TABLE_NAME + " where role = ? or role = ? order by num desc limit ?,?";
	
	
	
	private final String SEARCH_SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userId LIKE CONCAT('%', ?, '%') OR userNickName LIKE CONCAT('%', ?, '%') or userName LIKE CONCAT('%', ?, '%')";
	private final String SEARCH_2_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userId LIKE CONCAT('%', ?, '%')";
	private final String SEARCH_3_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE userNickName LIKE CONCAT('%', ?, '%')";
	private final String SEARCH_USER_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE role = ?";
	private final String SEARCH_ADMIN_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + TABLE_NAME + " WHERE role = ?";
	
	private final String TOADMIN_UPDATE = "update " + TABLE_NAME + " set role = ? where userNickName = ?";
	private final String TOUSER_UPDATE = "update " + TABLE_NAME + " set role = ? where userNickName = ?";
	private final String DeleteUserSupser = "delete from " + TABLE_NAME + " where userNickName = ?"; 
	
	private MemberDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	public static MemberDAO getMemberDAO() {
		return memberDAO;
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
	
	
	// 관리자 //
	public String Admin_Member_Power(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String power = null;
		try {
			pstmt = conn.prepareStatement("select * from " + TABLE_NAME + " where userNickName = ?");
			pstmt.setString(1, userNickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				power = rs.getString("power");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return power;
	}
	//슈퍼관리자가 삭제하는 로직
	public void AdminDeleteGOGO(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from AdminDelete where userNickName = ?");
			pstmt.setString(1, userNickName);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void Admin_SuperAdminDelete(String userNickName) {
		AdminDeleteGOGO(userNickName);
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(DeleteUserSupser);
			pstmt.setString(1, userNickName);
			pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	
	
	//오늘 방문자
	public int AdminTodayVisitor() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int todayvisitor = 0;
		try {
			pstmt = conn.prepareStatement("SELECT total_visitors FROM statistics WHERE date = CURDATE()");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				todayvisitor = rs.getInt("total_visitors");
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return todayvisitor;
	}
	// 토탈 방문자
	public int AdminTotalVisitor() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalvisitor = 0;
		try {
			pstmt = conn.prepareStatement("select * from statistics");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalvisitor = rs.getInt("total_visitors");
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return totalvisitor;
	}
	//방문수수 늘려주는 로직
	public void Admin_update_visitor() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update statistics set total_visitors = total_visitors + 1");
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	public ArrayList<AdminDeleteDTO> Admin_Request(){
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminDeleteDTO> list = new ArrayList<AdminDeleteDTO>();
		try {
			pstmt = conn.prepareStatement("select * from AdminDelete order by num desc");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminDeleteDTO dto = new AdminDeleteDTO();
				dto.setNum(rs.getInt("num"));
				dto.setReasons(rs.getString("reasons"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setAdminNickName(rs.getString("adminNickName"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	public void Admin_InsertDeleteReasons(String userNickName, String reasons, String adminNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into AdminDelete(userNickName, reasons, adminNickName) values(?,?,?)");
			pstmt.setString(1, userNickName);
			pstmt.setString(2, reasons);
			pstmt.setString(3, adminNickName);
			pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void AdminDeleteUserSuper(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(DeleteUserSupser);
			pstmt.setString(1, userNickName);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	
	
	public int Admin_ToAdmin_Update(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(TOADMIN_UPDATE);
			pstmt.setString(1, "admin");
			pstmt.setString(2, userNickName);
			pstmt.executeUpdate();
			result = 1;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
		return result;
	}
	public int Admin_ToUser_Update(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(TOUSER_UPDATE);
			pstmt.setString(1, "user");
			pstmt.setString(2, userNickName);
			pstmt.executeUpdate();
			result = 2;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
		return result;
	}
	
	
	public int AdminMemberCount() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count=0;
		try {
			pstmt = conn.prepareStatement(ADMIN_MEMBER_COUNT_SQL);
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
	public ArrayList<MemberDTO> Admin_list_Member(int curPage){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(ADMIN_LIST_MEMBER);
			pstmt.setInt(1, curPage*sizeOfPage);
			pstmt.setInt(2, sizeOfPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
				dto.setWtime(rs.getString("wtime"));
				dto.setUserBirth(rs.getInt("userBirth"));
				dto.setRole(rs.getString("role"));
				dto.setPower(rs.getString("power"));
				list.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return list;
	}
	//-----------------------------------------------------------------
	public int calTotalPage_1(String search) {
		int numberOfArticles = cntOfList1(search);
		
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
		return totalPage;
	}
	public int cntOfList1(String search) {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			pstmt = conn.prepareStatement(SEARCH_SELECT_COUNT_OF_LIST);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
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
	//-----------------------------------------------------------------
	//-----------------------------------------------------------------
		public int calTotalPage_2(String search) {
			int numberOfArticles = cntOfList2(search);
			
			int totalPage = numberOfArticles / sizeOfPage;
			if(numberOfArticles != 0)
				totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
			
			return totalPage;
		}
		public int cntOfList2(String search) {
			int cnt = 0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;		
			try {
				pstmt = conn.prepareStatement(SEARCH_2_COUNT_OF_LIST);
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
		//-----------------------------------------------------------------
		//-----------------------------------------------------------------
		public int calTotalPage_3(String search) {
			int numberOfArticles = cntOfList(search);
			
			int totalPage = numberOfArticles / sizeOfPage;
			if(numberOfArticles != 0)
				totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
			
			return totalPage;
		}
		public int cntOfList(String search) {
			int cnt = 0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;		
			try {
				pstmt = conn.prepareStatement(SEARCH_3_COUNT_OF_LIST);
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
		//-----------------------------------------------------------------
		//-----------------------------------------------------------------
		public int calTotalPage_User() {
			int numberOfArticles = cntOfList_User();
			
			int totalPage = numberOfArticles / sizeOfPage;
			if(numberOfArticles != 0)
				totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
			
			return totalPage;
		}
		public int cntOfList_User() {
			int cnt = 0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;		
			try {
				pstmt = conn.prepareStatement(SEARCH_USER_COUNT_OF_LIST);
				pstmt.setString(1, "user");
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
		//-----------------------------------------------------------------
		//-----------------------------------------------------------------
				public int calTotalPage_Admin() {
					int numberOfArticles = cntOfList_Admin();
					
					int totalPage = numberOfArticles / sizeOfPage;
					if(numberOfArticles != 0)
						totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
					
					return totalPage;
				}
				public int cntOfList_Admin() {
					int cnt = 0;
					Connection conn = getConnection();
					PreparedStatement pstmt = null;
					ResultSet rs = null;		
					try {
						pstmt = conn.prepareStatement(SEARCH_ADMIN_COUNT_OF_LIST);
						pstmt.setString(1, "admin");
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
				//-----------------------------------------------------------------
	public int calTotalPage() {
		int numberOfArticles = cntOfList();
		
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;
		
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
	// 이름 + 아이디 + 닉네임으로 검색
		public ArrayList<MemberDTO> SearchTitleAndNickName(String search, int curPage){
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();	
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(SEARCH_TITLE_NICKNAME);
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				pstmt.setString(3, search);
				pstmt.setInt(4, curPage*sizeOfPage);
				pstmt.setInt(5, sizeOfPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setWtime(rs.getString("wtime"));
					dto.setUserBirth(rs.getInt("userBirth"));
					dto.setRole(rs.getString("role"));
					dto.setPower(rs.getString("power"));
					list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn, rs);
			}
			return list;
		}
		// 아이디으로 검색
		public ArrayList<MemberDTO> SearchTitle(String search, int curPage){
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();	
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(SEARCH_TITLE);
				pstmt.setString(1, search);
				pstmt.setInt(2, curPage*sizeOfPage);
				pstmt.setInt(3, sizeOfPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setWtime(rs.getString("wtime"));
					dto.setUserBirth(rs.getInt("userBirth"));
					dto.setRole(rs.getString("role"));
					dto.setPower(rs.getString("power"));
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
		public ArrayList<MemberDTO> SearchNickName(String search, int curPage){
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();	
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(SEARCH_NICKNAME);
				pstmt.setString(1, search);
				pstmt.setInt(2, curPage*sizeOfPage);
				pstmt.setInt(3, sizeOfPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setWtime(rs.getString("wtime"));
					dto.setUserBirth(rs.getInt("userBirth"));
					dto.setRole(rs.getString("role"));
					dto.setPower(rs.getString("power"));
					list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn, rs);
			}
			return list;
		}
		// 유저인것
		public ArrayList<MemberDTO> SearchUSER(int curPage){
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();	
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(SEARCH_USER);
				pstmt.setString(1, "user");
				pstmt.setInt(2, curPage*sizeOfPage);
				pstmt.setInt(3, sizeOfPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setWtime(rs.getString("wtime"));
					dto.setUserBirth(rs.getInt("userBirth"));
					dto.setRole(rs.getString("role"));
					dto.setPower(rs.getString("power"));
					list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn, rs);
			}
			return list;
		}
		//관리자인것
		public ArrayList<MemberDTO> SearchADMIN(int curPage){
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();	
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(SEARCH_ADMIN);
				pstmt.setString(1, "admin");
				pstmt.setString(2, "super");
				pstmt.setInt(3, curPage*sizeOfPage);
				pstmt.setInt(4, sizeOfPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setNum(rs.getInt("num"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserNickName(rs.getString("userNickName"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setWtime(rs.getString("wtime"));
					dto.setUserBirth(rs.getInt("userBirth"));
					dto.setRole(rs.getString("role"));
					dto.setPower(rs.getString("power"));
					list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt, conn, rs);
			}
			return list;
		}
	
	
	
	
	
	
	
	
	
	// 회원 //

	
	
	public void MemberJoinDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(INSERT_MEMBER_SQL);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPassword());
			pstmt.setString(3, dto.getUserNickName());
			pstmt.setString(4, dto.getUserPhoneNumber());
			pstmt.setString(5, dto.getUserEmail());
			pstmt.setBoolean(6, dto.getIsMailReceptionChecked());
			pstmt.setBoolean(7, dto.getIsPhoneReceptionChecked());
			pstmt.setString(8, dto.getUserName());
			pstmt.setInt(9, dto.getUserBirth());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void Admin_Update_Power_Power(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set power = ? where userNickName = ?");
			pstmt.setString(1, "모든권한");
			pstmt.setString(2, userNickName);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void Admin_Update_User_Power(String userNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set power = ? where userNickName = ?");
			pstmt.setString(1, "권한해제상태");
			pstmt.setString(2, userNickName);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public void Admin_Update_Reply_Power(String replyNickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update " + TABLE_NAME + " set power = ? where userNickName = ?");
			pstmt.setString(1, "권한해제상태");
			pstmt.setString(2, replyNickName);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public MemberDTO MemberLoginDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(LOGIN_MEMBER_SQL);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPassword());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setIsMailReceptionChecked(rs.getBoolean("isMailReceptionChecked"));
				dto.setIsPhoneReceptionChecked(rs.getBoolean("isPhoneReceptionChecked"));
				dto.setUserName(rs.getString("userName"));
				dto.setRole(rs.getString("role"));
				dto.setPower(rs.getString("power"));
			}
			else {
				dto = null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dto;	
	}
	public MemberDTO MemberModifyDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(MODIFY_MEMBER_SQL);
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getUserEmail());
			pstmt.setString(3, dto.getUserPhoneNumber());
			pstmt.setString(4, dto.getUserId());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
		return dto;
	}
	public void MemberPasswordDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(PASSWORD_UPDATE_MEMBER_SQL);
			pstmt.setString(1, dto.getUserPassword());
			pstmt.setString(2, dto.getUserId());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
	}
	public int MemberWithdrawalOKDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(DELETE_MEMBER_SQL);
			pstmt.setString(1, dto.getUserId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn);
		}
		return result;
	}
	
	public int checkUserId(String id) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(USERID_CHECK_MEMBER_SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 0;
			}else {
				result = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return result;
	}
	public int checkUserNickName(String NickName) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(USERNICKNAME_CHECK_MEMBER_SQL);
			pstmt.setString(1, NickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 0;
			}else {
				result = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return result;
	}
	public MemberDTO MemberidpasswordFind(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(FIND_USER_IDPASSWORD_MEMBER_SQL);
			pstmt.setString(1, dto.getUserName());
			pstmt.setInt(2, dto.getUserBirth());
			pstmt.setString(3, dto.getUserEmail());
			pstmt.setString(4, dto.getUserPhoneNumber());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserNickName(rs.getString("userNickName"));
				dto.setUserPhoneNumber(rs.getString("userPhoneNumber"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setIsMailReceptionChecked(rs.getBoolean("isMailReceptionChecked"));
				dto.setIsPhoneReceptionChecked(rs.getBoolean("isPhoneReceptionChecked"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getInt("userBirth"));
			}else {
				dto = null;
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
		return dto;
	}
	public void MemberPasswordFindUpdate(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(UPDATE_USER_PASSWORD_MEMBER_SQL);
			pstmt.setString(1, dto.getUserPassword());
			pstmt.setString(2, dto.getUserId());
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
