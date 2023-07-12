package com.inven.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inven.project.command.*;

@WebServlet("*.do")
public class FrontContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FrontContoller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		String commandName = request.getServletPath();
		String viewPage = null;
		Command command = null;
		PrintWriter out = null;
		boolean flag = false;
		
		if(commandName.equals("/join.do")) {
			flag = true;
			viewPage = "join.jsp";
		}else if(commandName.equals("/JoinOK.do")) {
			command = new JoinCommand();
			command.excute(request, response);
			flag = true;
			viewPage = "index.do";
		}else if(commandName.equals("/index.do")) {
			command = new indexCommand();
			command.excute(request, response);
			flag = true;
			viewPage = "index.jsp";
		}else if(commandName.equals("/login.do")) {
			command = new LoginCommand();
			command.excute(request, response);
			flag = true;
			viewPage = "index.do";
		}else if(commandName.equals("/Logout.do")) {
			request.getSession().invalidate();
			flag = true;
			viewPage = "index.do";
		}else if(commandName.equals("/info.do")) {
			flag = true;
			viewPage = "info.jsp";
		}else if(commandName.equals("/modify.do")) {
			command = new ModifyCommand();
			command.excute(request, response);
			flag = true;
			viewPage = "info.jsp";
		}else if(commandName.equals("/passwordOK.do")) {
			command = new PasswordOKCommand();
			command.excute(request, response);
			flag = true;
			viewPage = "info.jsp";
		}else if(commandName.equals("/WithdrawalOK.do")) {
			command = new WithdrawalOKCommand();
			command.excute(request, response);
			request.getSession().invalidate();
			flag = true;
			viewPage = "index.do";
		}else if(commandName.equals("/idCheck.do")) {
			command = new IDCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
//			viewPage = "join.jsp";
		}else if(commandName.equals("/NickNameChk.do")) {
			command = new NickNameCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("resultE") + "");
		}else if(commandName.equals("/idpasswordFind.do")) {
			viewPage = "idpasswordFindOK.jsp";
			flag = true;
		}else if(commandName.equals("/idpasswordFindOK.do")) {
			command = new idpasswordFindOKCommand();
			command.excute(request, response);
			viewPage = "idpasswordFindOK.jsp";
			flag = true;
		}else if(commandName.equals("/FindpasswordOK.do")) {
			command = new FindpasswordOKCommand();
			command.excute(request, response);
			viewPage = "idpasswordFindOK.jsp";
			flag = true;
		}
		
//		---------------------------------------------- 게시판
		
		else if(commandName.equals("/Vote.do")) {
			command = new VoteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//메인 게시판 목록
		else if(commandName.equals("/board_Free.do")) {
			command = new BoardFreeCommand();
			command.excute(request, response);
			viewPage = "board_Free.jsp";
			flag = true;
		}else if(commandName.equals("/Warrior.do")) {
			command = (Command) new WarriorBoardFreeCommand();
			command.excute(request, response);
			viewPage = "WarriorBoard.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior1.do")) {
			command = (Command) new Warrior1BoardFreeCommand();
			command.excute(request, response);
			viewPage = "WarriorBoard.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice.do")) {
			command = (Command) new NoticeBoardFreeCommand();
			command.excute(request, response);
			viewPage = "NoticeBoard.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice1.do")) {
			command = (Command) new Notice1BoardFreeCommand();
			command.excute(request, response);
			viewPage = "NoticeBoard.jsp";
			flag = true;
		}
		//글쓰기
		else if(commandName.equals("/BoardwriteOK.do")) {
			command = new BoardwriteOKCommand();
			command.excute(request, response);
			viewPage = "board_Free.do";
//			flag = true;
			flag = false;
			response.sendRedirect(viewPage);
		}
		else if(commandName.equals("/board_free_write.do")) {
			viewPage = "board_Free_write.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_board_free_write.do")) {
			viewPage = "Warrior_board_Free_write.jsp";
			flag = true;
		}else if(commandName.equals("/Warrior_BoardwriteOK.do")) {
			command = new Warrior_BoardwriteOKCommand();
			command.excute(request, response);
//			viewPage = "Warrior.do";
			response.sendRedirect("Warrior.do");
//			flag = true;
			flag = false;
		}
		else if(commandName.equals("/Notice_board_free_write.do")) {
			viewPage = "Notice_board_Free_write.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_BoardwriteOK.do")) {
			command = new Notice_BoardwriteOKCommand();
			command.excute(request, response);
//			viewPage = "Notice.do";
//			flag = true;
			flag = false;
			response.sendRedirect("Notice.do");
		}
		//수정
		else if(commandName.equals("/board_free_writeOK.do")) {
			command = new board_free_writeOKCommand();
			command.excute(request, response);
			viewPage = "board_Free_modify.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_board_free_writeOK.do")) {
			command = new Warrior_board_free_writeOKCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_modify.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_board_free_writeOK.do")) {
			command = new Notice_board_free_writeOKCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_modify.jsp";
			flag = true;
		}
		else if(commandName.equals("/BoardmodifyOK.do")){
			command = new BoardmodifyOKCommand();
			command.excute(request, response);
//			viewPage = "board_Free.do";
//			flag = true;
			flag = false;
			response.sendRedirect("board_Free.do");
		}
		else if(commandName.equals("/Warrior_BoardmodifyOK.do")){
			command = new Warrior_BoardmodifyOKCommand();
			command.excute(request, response);
//			viewPage = "Warrior.do";
//			flag = true;
			flag = false;
			response.sendRedirect("Warrior.do");
		}
		else if(commandName.equals("/Notice_BoardmodifyOK.do")){
			command = new Notice_BoardmodifyOKCommand();
			command.excute(request, response);
//			viewPage = "Notice.do";
//			flag = true;
			flag = false;
			response.sendRedirect("Notice.do");
		}
		
		// 컨텐츠 뷰
		
		else if(commandName.equals("/board_Free_Content_View.do")) {
			command = new board_Free_content_viewCommand();
			command.excute(request, response);
			viewPage = "board_Free_Content_View.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_board_Free_Content_View.do")) {
			command = new Warrior_board_Free_content_viewCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_Content_View.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_board_Free_Content_View.do")) {
			command = new Notice_board_Free_content_viewCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_Content_View.jsp";
			flag = true;
		}
		//게시판 글 삭제
		
		else if(commandName.equals("/board_free_delete.do")) {
			command = new board_free_deleteCommand();
			command.excute(request, response);
			viewPage = "board_Free.do";
			flag = true;
		}
		else if(commandName.equals("/Warrior_board_free_delete.do")) {
			command = new Warrior_board_free_deleteCommand();
			command.excute(request, response);
			viewPage = "Warrior.do";
			flag = true;
		}
		else if(commandName.equals("/Notice_board_free_delete.do")) {
			command = new Notice_board_free_deleteCommand();
			command.excute(request, response);
			viewPage = "Notice.do";
			flag = true;
		}
		
		//내글 , 내 댓글
		
		else if(commandName.equals("/My_writing_board.do")) {
			command = new My_writing_boardCommand();
			command.excute(request, response);
			viewPage = "board_Free_my_writing.jsp";
			flag = true;
		}else if(commandName.equals("/My_comment_board.do")) {
			command = new My_comment_boardCommand();
			command.excute(request, response);
			viewPage = "board_Free_my_comment.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_My_writing_board.do")) {
			command = new Warrior_My_writing_boardCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_my_writing.jsp";
			flag = true;
		}else if(commandName.equals("/Warrior_My_comment_board.do")) {
			command = new Warrior_My_comment_boardCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_my_comment.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_My_writing_board.do")) {
			command = new Notice_My_writing_boardCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_my_writing.jsp";
			flag = true;
		}else if(commandName.equals("/Notice_My_comment_board.do")) {
			command = new Notice_My_comment_boardCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_my_comment.jsp";
			flag = true;
		}
		
		
		//
		else if(commandName.equals("/board_Free_suda.do")) {
			command = (Command) new Board_Free_sudaCommand();
			command.excute(request, response);
			viewPage = "board_Free_Suda.jsp";
			flag = true;
		}else if(commandName.equals("/board_Free_tupyo.do")) {
			command = (Command) new Board_Free_tupyoCommand();
			command.excute(request, response);
			viewPage = "board_Free_Tupyo.jsp";
			flag = true;
		}else if(commandName.equals("/board_Free_insa.do")) {
			command = (Command) new Board_Free_insaCommand();
			command.excute(request, response);
			viewPage = "board_Free_Insa.jsp";
			flag = true;
		}else if(commandName.equals("/board_Free_smail.do")) {
			command = (Command) new Board_Free_smileCommand();
			command.excute(request, response);
			viewPage = "board_Free_Smail.jsp";
			flag = true;
		}else if(commandName.equals("/board_Free_event.do")) {
			command = (Command) new Board_Free_eventCommand();
			command.excute(request, response);
			viewPage = "board_Free_Event.jsp";
			flag = true;
		}else if(commandName.equals("/board_Free_jungbo.do")) {
			command = (Command) new Board_Free_jungboCommand();
			command.excute(request, response);
			viewPage = "board_Free_Jungbo.jsp";
			flag = true;
		}
		
		// 댓글 쓰기 기능
		else if(commandName.equals("/board_Free_Dabgle.do")) {
			command = new board_Free_DabgleCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/Warrior_board_Free_Dabgle.do")) {
			command = new Warrior_board_Free_DabgleCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/Notice_board_Free_Dabgle.do")) {
			command = new Notice_board_Free_DabgleCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		
		else if(commandName.equals("/board_Free_ReCommand.do")) {
			command = new board_Free_ReCommandCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/Warrior_board_Free_ReCommand.do")) {
			command = new Warrior_board_Free_ReCommandCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/Notice_board_Free_ReCommand.do")) {
			command = new Notice_board_Free_ReCommandCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		//이름으로 검색
		else if(commandName.equals("/Board_Free_NickName_search.do")) {
			command = new Board_Free_NickName_searchCommand();
			command.excute(request, response);
			viewPage = "board_Free_searchNickName.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_Board_Free_NickName_search.do")) {
			command = new Warrior_Board_Free_NickName_searchCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_searchNickName.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_Board_Free_NickName_search.do")) {
			command = new Notice_Board_Free_NickName_searchCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_searchNickName.jsp";
			flag = true;
		}
		else if(commandName.equals("/delete_Reply_Comment.do")) {
			command = new delete_Reply_CommentCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/delete_WarriorReply_Comment.do")) {
			command = new delete_WarriorReply_CommentCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		else if(commandName.equals("/delete_NoticeReply_Comment.do")) {
			command = new delete_NoticeReply_CommentCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		//다음글 이전글
		else if(commandName.equals("/NextPred_board_Free_Content_View.do")) {
			command = new NextPred_board_Free_Content_ViewCommand();
			command.excute(request, response);
			viewPage = "board_Free_Content_View.jsp";
			flag = true;	
		}
		else if(commandName.equals("/Warrior_NextPred_board_Free_Content_View.do")) {
			command = new Warrior_NextPred_board_Free_Content_ViewCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_Content_View.jsp";
			flag = true;	
		}
		else if(commandName.equals("/Notice_NextPred_board_Free_Content_View.do")) {
			command = new Notice_NextPred_board_Free_Content_ViewCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_Content_View.jsp";
			flag = true;	
		}
		//10 30 추천글
		else if(commandName.equals("/onetwo_Board.do")) {
			command = new onetwo_BoardCommand();
			command.excute(request, response);
			viewPage = "onetwo_Board.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_onetwo_Board.do")) {
			command = new Warrior_onetwo_BoardCommand();
			command.excute(request, response);
			viewPage = "Warrior_onetwo_Board.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_onetwo_Board.do")) {
			command = new Notice_onetwo_BoardCommand();
			command.excute(request, response);
			viewPage = "Notice_onetwo_Board.jsp";
			flag = true;
		}
		
		//검색기능
		else if(commandName.equals("/search_Board_Free.do")) {
			command = new search_Board_FreeCommand();
			command.excute(request, response);
			viewPage = "board_Free_Search.jsp";
			flag = true;
		}
		else if(commandName.equals("/Warrior_search_Board_Free.do")) {
			command = new Warrior_search_Board_FreeCommand();
			command.excute(request, response);
			viewPage = "Warrior_board_Free_Search.jsp";
			flag = true;
		}
		else if(commandName.equals("/Notice_search_Board_Free.do")) {
			command = new Notice_search_Board_FreeCommand();
			command.excute(request, response);
			viewPage = "Notice_board_Free_Search.jsp";
			flag = true;
		}
		//통합검색
		else if(commandName.equals("/IntegratedSearch.do")) {
			command = new IntegratedSearchCommand();
			command.excute(request, response);
			viewPage = "IntegratedSearch.jsp";
			flag = true;
		}else if(commandName.equals("/IntegratedSearch_time.do")) {
			command = new IntegratedSearch_timeCommand();
			command.excute(request, response);
			viewPage = "IntegratedSearch.jsp";
			flag = true;
		}else if(commandName.equals("/IntegratedSearch_Accuracy.do")) {
			command = new IntegratedSearch_AccuracyCommand();
			command.excute(request, response);
			viewPage = "IntegratedSearch.jsp";
			flag = true;
		}
		
		//고객센터
		else if(commandName.equals("/QNA.do")) {
			command = new QNACommand();
			command.excute(request, response);
			viewPage = "QNA.jsp";
			flag = true;
		}else if(commandName.equals("/QNA_Write.do")) {
			command = new QNA_WriteCommand();
			command.excute(request, response);
			viewPage = "QNA.do";
			flag = true;
		}else if(commandName.equals("/QNA_RE_GOOD.do")) {
			command = new QNA_RE_GOODCommand();
			command.excute(request, response);
			viewPage = "QNAOK.jsp";
			flag = true;
		}
		
		
		
		
		
		//-----------------------------추천기능-----------------------------//
		
		else if(commandName.equals("/FreeBoard_recommend.do")) {
			command = new FreeBoard_recommendCommand();
			command.excute(request, response);
			flag= false;
//			viewPage = "board_Free.do";
//			flag = true;
		}
		
		else if(commandName.equals("/Warrior_FreeBoard_recommend.do")) {
			command = new Warrior_FreeBoard_recommendCommand();
			command.excute(request, response);
			flag= false;
//				viewPage = "board_Free.do";
//				flag = true;
		}
		else if(commandName.equals("/Notice_FreeBoard_recommend.do")) {
			command = new Notice_FreeBoard_recommendCommand();
			command.excute(request, response);
			flag= false;
//				viewPage = "board_Free.do";
//				flag = true;
		}
		
		//신고기능 
		
		else if(commandName.equals("/Report.do")) {
			command = new ReportCommand();
			command.excute(request, response);
			viewPage = "Report.jsp";
			flag = true;
		}else if(commandName.equals("/ReportOK.do")) {
			command = new ReportOKCommand();
			command.excute(request, response);
			viewPage = "ReportGood.jsp";
			flag = true;
		}
		
		
		//-----------------------------우편함--------------------------------//
		
		else if(commandName.equals("/note.do")) {
			command = new noteCommand();
			command.excute(request, response);
			viewPage = "note.jsp";
			flag = true;
		}else if(commandName.equals("/note_writing.do")) {
			viewPage = "note_writing.jsp";
			flag = true;
		}else if(commandName.equals("/note_write.do")) {
			viewPage = "note_writeOK.do";
			flag = true;
		}else if(commandName.equals("/note_storage.do")) {
			viewPage = "note_storage.jsp";
			flag = true;
		}else if(commandName.equals("/note_writingOK.do")) {
			command = new note_writingOKCommand();
			command.excute(request, response);
			viewPage = "note_writeOK.do";
			flag = true;
		}else if(commandName.equals("/note_writeOK.do")) {
			command = new note_writeOKCommand();
			command.excute(request, response);
			viewPage = "note_write.jsp";
			flag = true;
		}else if(commandName.equals("/note_write_content_viewOK.do")) {
			command = new note_write_content_viewOKCommand();
			command.excute(request, response);
			viewPage = "note_write_content_view.jsp";
			flag = true;
		}else if(commandName.equals("/deleteItems.do")) {
			command = new deleteItemsCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/note_content_viewOK.do")) {
			command = new note_content_viewOKCommand();
			command.excute(request, response);
			viewPage = "note_content_view.jsp";
			flag = true;
		}else if(commandName.equals("/note_writingGood.do")) {
			command = new note_writingGoodCommand();
			command.excute(request, response);
			viewPage = "note_writing.jsp";
			flag = true;
		}else if(commandName.equals("/deleteItemsNote.do")) {
			command = new deleteItemsNoteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		//----------------------------관리자 게시판----------------------------//
		
		else if(commandName.equals("/Admin.do")) {
			command = new AdminCommand();
			command.excute(request, response);
			viewPage = "Admin.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Member.do")) {
			command = new Admin_MemberCommand();
			command.excute(request, response);
			viewPage = "Admin_Member.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Member_Search.do")) {
			command = new Admin_Member_SearchCommand();
			command.excute(request, response);
			viewPage = "Admin_Member.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Member_Board.do")) {
			command = new Admin_Member_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Member.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Member_ReplyComment.do")) {
			command = new Admin_Member_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Member_ReplyComment.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_deleteItemsMember_Board.do")) {
			command = new Admin_deleteItemsMember_BoardCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/Admin_Update_Member.do")) {
			command = new Admin_Update_MemberCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/DeleteUserUpserAdmin.do")) {
			command = new DeleteUserUpserAdminCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/DeleteUserAdmin.do")) {
			command = new DeleteUserAdminCommand();
			command.excute(request, response);
			flag = false;
		}else if(commandName.equals("/Admin_Request.do")) {
			command = new Admin_RequestCommand();
			command.excute(request, response);
			viewPage = "Admin_Request.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_RequestOK.do")) {
			command = new Admin_RequestCommand();
			command.excute(request, response);
			viewPage = "Admin_RequestOK.jsp";
			flag = true;
		}else if(commandName.equals("/updategogo.do")) {
			command = new updategogoCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/deleteGood.do")) {
			command = new deleteGoodCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/Admin_Board.do")) {
			command = new Admin_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board1.do")) {
			command = new Admin1_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Board1.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board2.do")) {
			command = new Admin2_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Board2.jsp";
			flag = true;
		}
		
		else if(commandName.equals("/Admin_Board_Search.do")) {
			command = new Admin_Board_SearchCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Search1.do")) {
			command = new Admin_Board_Search1Command();
			command.excute(request, response);
			viewPage = "Admin_Board1.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Search2.do")) {
			command = new Admin_Board_Search2Command();
			command.excute(request, response);
			viewPage = "Admin_Board2.jsp";
			flag = true;
		}
		
		
		else if(commandName.equals("/Admin_Board_Hit.do")) {
			command = new Admin_Board_HitCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
			
		}else if(commandName.equals("/Admin_Board_Recommend.do")) {
			command = new Admin_Board_RecommendCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Wtime.do")) {
			command = new Admin_Board_WtimeCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Boardcategory.do")) {
			command = new Admin_Board_BoardcategoryCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Content_View.do")) {
			command = new Admin_Board_Content_ViewComand();
			command.excute(request, response);
			viewPage = "Admin_Board_Content_View.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Content_View1.do")) {
			command = new Admin_Board_Content_View1Comand();
			command.excute(request, response);
			viewPage = "Admin_Board_Content_View.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Board_Content_View2.do")) {
			command = new Admin_Board_Content_View2Comand();
			command.excute(request, response);
			viewPage = "Admin_Board_Content_View.jsp";
			flag = true;
		}
		
		else if(commandName.equals("/Admin_board_free_delete.do")) {
			command = new board_free_deleteCommand();
			command.excute(request, response);
			viewPage = "Admin_Board.do";
			flag = true;
		}else if(commandName.equals("/Admin_Report.do")) {
			command = new Admin_ReportCommand();
			command.excute(request, response);
			viewPage = "Admin_Report.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_ReportOK.do")) {
			command = new Admin_ReportOKCommand();
			command.excute(request, response);
			viewPage = "Admin_ReportOK.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Update.do")) {
			command = new Admin_UpdateCommand();
			command.excute(request, response);
			viewPage = "Admin_Report.do";
			flag = true;
		}else if(commandName.equals("/User_Revocation.do")) {
			command = new User_RevocationCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}else if(commandName.equals("/Power_Revocation.do")) {
			command = new Power_RevocationCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
		
		else if(commandName.equals("/Admin_Notice.do")) {
			command = new Admin_NoticeCommand();
			command.excute(request, response);
			viewPage = "Admin_Notice.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Write_Board.do")) {
			command = new Admin_Write_BoardCommand();
			command.excute(request, response);
			viewPage = "Admin_Notice.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Write_Board1.do")) {
			command = new Admin_Write_Board1Command();
			command.excute(request, response);
			viewPage = "Admin_Notice.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Write_Board2.do")) {
			command = new Admin_Write_Board2Command();
			command.excute(request, response);
			viewPage = "Admin_Notice.jsp";
			flag = true;
		}else if(commandName.equals("/Notice_Content_View.do")) {
			command = new Notice_Content_ViewCommand();
			command.excute(request, response);
			viewPage = "Admin_Notice_Content_View.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Notice_Modify.do")) {
			command = new Admin_Notice_ModifyCommand();
			command.excute(request, response);
			viewPage = "Admin_Notice_Modify.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_Notice_ModifyOK.do")) {
			command = new Admin_Notice_ModifyOKCommand();
			command.excute(request, response);
			viewPage = "Admin_Notice.do";
			flag = true;
		}else if(commandName.equals("/QNAContent.do")) {
			command = new QNAContentCommand();
			command.excute(request, response);
			viewPage = "Admin_QNA.jsp";
			flag = true;
		}
		else if(commandName.equals("/Admin_QNA_RE.do")) {
			command = new Admin_QNA_RECommand();
			command.excute(request, response);
			viewPage = "Admin_Notice.do";
			request.setAttribute("displayDiv", "div_div_div");
			flag = true;
		}else if(commandName.equals("/Admin_Image.do")) {
			viewPage = "Admin_Image.jsp";
			flag = true;
		}else if(commandName.equals("/Img_Upload.do")) {
			command = new Img_UploadCommand();
			command.excute(request, response);
			viewPage = "Admin_Image.jsp";
			flag = true;
		}else if(commandName.equals("/Admin_ImageOK.do")) {
			command = new Admin_ImageOKCommand();
			command.excute(request, response);
			viewPage = "Admin_ImageOK.jsp";
			flag = true;
		}else if(commandName.equals("/deleteIMG.do")) {
			command = new deleteIMGCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
			flag = false;
		}
			
		if(flag) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
