package com.springbook.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.VO.BoardVO;
import com.springbook.biz.VO.MemberVO;
import com.springbook.biz.VO.NoteVO;
import com.springbook.biz.VO.QnaVO;
import com.springbook.biz.impl.member.MemberService;

@Controller
public class MemberController {

	// 회원
	@Autowired
	private MemberService memberService;

	// index페이지이동
	@RequestMapping("/index")
	public String index(Model model, BoardVO vo) {
		//메인화면 자유게시판 글 가져오기
		List<BoardVO> Freelist = memberService.FreeBoard();
		for(int i=0;i<Freelist.size();i++) {
			vo = Freelist.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.ReplyBoard(num);
			vo.setComment(count);
		}
		
		//메인화면 오늘의 화제글 가져오기
		List<BoardVO> Todaylist = memberService.TodayBoard();
		for(int i=0;i<Todaylist.size();i++) {
			vo = Todaylist.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.ReplyBoard(num);
			vo.setComment(count);
		}
		
		//메인화면 소식/공지 글 가져오기
		//공지
		List<BoardVO>  NoticeList= memberService.NoticeBoard();
		for(int i=0;i<NoticeList.size();i++) {
			vo = NoticeList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.NoticeReplyBoard(num);
			vo.setComment(count);
		}
		//버그제보
		List<BoardVO>  BugList= memberService.BugBoard();
		for(int i=0;i<BugList.size();i++) {
			vo = BugList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.NoticeReplyBoard(num);
			vo.setComment(count);
		}
		//이벤트
		List<BoardVO>  EventList= memberService.EventBoard();
		for(int i=0;i<EventList.size();i++) {
			vo = EventList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.NoticeReplyBoard(num);
			vo.setComment(count);
		}
		
		//직업게시판 글 가져오기
		//전체
		List<BoardVO>  AllList= memberService.AllBoard();
		for(int i=0;i<AllList.size();i++) {
			vo = AllList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		//전사
		List<BoardVO>  WarriorList= memberService.WarriorBoard();
		for(int i=0;i<WarriorList.size();i++) {
			vo = WarriorList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		//마법사
		List<BoardVO>  WizardList= memberService.WizardBoard();
		for(int i=0;i<WizardList.size();i++) {
			vo = WizardList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		//궁수
		List<BoardVO>  ArcherList= memberService.ArcherBoard();
		for(int i=0;i<ArcherList.size();i++) {
			vo = ArcherList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		//도적
		List<BoardVO>  BanditList= memberService.BanditBoard();
		for(int i=0;i<BanditList.size();i++) {
			vo = BanditList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		//해적
		List<BoardVO>  PirateList= memberService.PirateBoard();
		for(int i=0;i<PirateList.size();i++) {
			vo = PirateList.get(i);
			int num = vo.getNum();
			//게시판 댓글 가져오기
			int count = memberService.WarriorReplyBoard(num);
			vo.setComment(count);
		}
		
		
		
		
		/*----------------------------------------*/
		model.addAttribute("FreeList", Freelist);
		model.addAttribute("TodayList", Todaylist);
		model.addAttribute("NoticeList", NoticeList);
		model.addAttribute("BugList", BugList);
		model.addAttribute("EventList", EventList);
		model.addAttribute("AllList", AllList);
		model.addAttribute("WarriorList", WarriorList);
		model.addAttribute("WizardList", WizardList);
		model.addAttribute("ArcherList", ArcherList);
		model.addAttribute("BanditList", BanditList);
		model.addAttribute("PirateList", PirateList);
		return "index";
	}

	// 회원가입페이지 이동
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	//회원가입
	@RequestMapping("/JoinOK")
	public String joinOK(MemberVO vo) {
		
		//전화번호 11자리 합치기
		vo.setUserPhoneNumber(vo.getFirst_phone() + vo.getCenter_phone() + vo.getLast_phone());
		
		//메일, 전화번호 수신 체크
		String[] mailReceptionValues = vo.getMail_reception();
		String[] phoneReceptionValues = vo.getPhone_reception();
		boolean isMailReceptionChecked = mailReceptionValues != null && mailReceptionValues.length > 0;
		boolean isPhoneReceptionChecked = phoneReceptionValues != null && phoneReceptionValues.length > 0;
		vo.setIsMailReceptionChecked(isMailReceptionChecked);
		vo.setIsPhoneReceptionChecked(isPhoneReceptionChecked);
		
		memberService.join(vo);
		return "index";
	}
	
	//회원가입 아이디 중복체크
	@RequestMapping("/idCheck")
    @ResponseBody
    public Map<Object, Object> idCheck(@RequestBody String userId) {
        System.out.println(userId);
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = memberService.idCheck(userId);
        map.put("cnt", count);
 
        return map;
    }
	
	//회원가입 닉네임 중복체크
	@RequestMapping("/NickNameChk")
	public String NickNameChk(@RequestParam("userNickName") String userNickName) {
		System.out.println("nickname : " + userNickName);
		memberService.NickNameCheck(userNickName);
		return "join";
	}
	
	//로그인
	@ResponseBody
	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public Object login(MemberVO vo, HttpSession session, Model model) {
		vo = memberService.login(vo);
		if(vo!=null) {
			session.setAttribute("userInfo", vo);
			//성공
			return "0";
		}else {
			//실패
			return "1";
		}
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/index";
	}
	
	//개인정보창
	@RequestMapping("/info")
	public String info() {
		return "info";
	}
	
	//회원정보수정
	@RequestMapping("/member_modify")
	public String member_modify(MemberVO vo, HttpSession session) {
		
		memberService.modify(vo);
		session.setAttribute("userInfo", vo);
		return "/info";
	}
	
	//비밀번호변경
	@RequestMapping("/member_passwordOK")
	public String member_passwordOK(MemberVO vo, HttpSession session) {
		memberService.password(vo);
		return "/info";
	}
	
	//회원탈퇴
	@RequestMapping("/WithdrawalOK")
	public void WithdrawalOK(HttpSession session, MemberVO vo, Model model, HttpServletResponse response) throws IOException {
		memberService.WithdrawalOK(vo);
		session.invalidate();
		PrintWriter out = response.getWriter();
        out.println("<script>window.close();</script> ");
	}
	
	//아이디/비밀번호 찾기 페이지 이동
	@RequestMapping("/idpasswordFind")
	public String idpasswordFind() {
		return "/idpasswordFind";
	}
	
	//아이디/비밀번호 찾기
	@RequestMapping("/idpasswordFindOK")
	public String idpasswordFindOK(MemberVO vo, Model model, HttpSession session) {
		String member = memberService.idpasswordFind(vo);
		System.out.println(member);
		if(member != null) {
		    model.addAttribute("next", "입력하신 정보가 일치합니다. 다음단계로 넘어갑니다.");
		    model.addAttribute("userId", member);
		}
		if(member == null){
			model.addAttribute("error", "입력하신 정보가 일치하지 않습니다.");
		}
		return "/idpasswordFind";
	}
	
	//비밀번호변경
	@RequestMapping("/Findpassword")
	public String passwordOK(MemberVO vo) {
		memberService.passwordOK(vo);
		
		return "/idpasswordFind";
	}
	
	//받은 쪽지함 페이지 이동
	@RequestMapping("/note")
	public String note(Model model, HttpSession session) {
	    MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
	    if (userInfo != null) {
	        String userNickName = userInfo.getUserNickName();
	        model.addAttribute("writestorage", memberService.sendNote(userNickName));
	    }
	    return "/note";
	}
	
	//보낸 쪽지함 페이지 이동
	@RequestMapping("/note_write")
	public String note_write(Model model, HttpSession session) {
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
	    if (userInfo != null) {
	        String userNickName = userInfo.getUserNickName();
	        model.addAttribute("writestorage", memberService.writeNote(userNickName));
	    }
		return "note_write";
	}
		
	//쪽지 보내기 페이지 이동
	@RequestMapping("/note_writing")
	public String note_writing(Model model, NoteVO vo) {
		model.addAttribute("userNickName", vo.getUserNickName());
		return "note_writing";
	}
	
	//쪽지 쓰기
	@RequestMapping("/note_writingOK")
	public String note_writingOK(NoteVO vo) {
		memberService.note_write(vo);
		return "redirect:/note_write";
	}
	
	//쪽지 컨텐츠 뷰 이동
	@RequestMapping("/note_content_view")
	public String note_contentview(NoteVO vo, Model model) {
		model.addAttribute("Notelist", memberService.noteContentView(vo));
		model.addAttribute("NickName", vo.getUserNickName());
		return "note_content_view";
	}

	//쪽지 일괄 삭제
	@RequestMapping("/deleteItemsNote") 
	public String ajaxDelete(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("selectedItems"); 
		int size = ajaxMsg.length; 
		for(int i=0; i<size; i++) {
			memberService.deleteItems(ajaxMsg[i]); 
		} 
		return "note";
	}
	
	//고객센터
	@RequestMapping("/QNA")
	public String QNA(MemberVO vo, Model model, HttpSession session) {
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
		 if (userInfo != null) {
		        String userNickName = userInfo.getUserNickName();
		        vo.setUserNickName(userNickName);
		    }
		model.addAttribute("list", memberService.QNA(vo));	
		return "QNA";
	}
	
	//고객센터 문의하기
	@RequestMapping("/QNA_Write")
	public String QNA_Write(QnaVO vo, HttpServletRequest request) {
		int radio = Integer.parseInt(request.getParameter("QNARadio"));
		String QNARadio = null;
		if(radio == 1) {
			QNARadio = "게시판관련문의";
		}else if(radio == 2) {
			QNARadio = "회원관련문의";
		}else if(radio == 3) {
			QNARadio = "권한문의";
		}else if(radio == 4) {
			QNARadio = "기타";
		}
		vo.setQNARadio(QNARadio);
		memberService.QNA_Write(vo);
		return "redirect:/QNA";
	}
	
	//고객센터 컨텐츠 뷰
	@RequestMapping("/QNA_RE_GOOD")
	public String QNA_RE_GOOD(QnaVO vo, Model model) {
		model.addAttribute("userdto", memberService.QNA_Content_View(vo));
		return "QNAOK";
	}
}









































