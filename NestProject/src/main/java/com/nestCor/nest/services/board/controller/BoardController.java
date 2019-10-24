package com.nestCor.nest.services.board.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nestCor.nest.common.util.Utils;
import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.board.model.service.BoardService;
import com.nestCor.nest.services.board.model.vo.Board;
import com.nestCor.nest.services.boardComment.model.service.BoardCommentService;
import com.nestCor.nest.services.boardComment.model.vo.BoardComment;

@SessionAttributes(value= {"member"})
@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	BoardCommentService boardCommentService;
	
	@RequestMapping("/board/board.do")
	public String boardMain(@RequestParam("mNo") int mNo,Model model) {
		System.out.println("/board/board.do가 호출되었습니다.");
		
		Member member = boardService.getMemberInfo(mNo);
		System.out.println("mno : " + mNo);
		System.out.println(member.getmNo());
		model.addAttribute("member",member);

		return "client/services/board/boardMain";
	}
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView ShowboardList(@RequestParam String cate1_code, @RequestParam String cate2_code,
								@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
								Model model){
		System.out.println("/board/boardList.do가 호출되었습니다. 넘어온 카테고리1값 : " +cate1_code + " 카테고리2값 : "+cate2_code);
		
		int limit = 10; // 한 페이지 당 게시글 수
		
		Board board = new Board(cate1_code, cate2_code);
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(boardService.selectBoardList(cPage, limit, board));

		System.out.println("넘어온 list 확인 : " + list);
		
		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = boardService.selectBoardTotalContents(board);
		
		System.out.println("게시글 수 : "+totalContents);
		
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "boardList.do?cate1_code="+cate1_code+"&cate2_code="+cate2_code);
		
		//해당되는 곳으로 값을 보내는 기능
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar);
		
		//다음으로 보낼때 카테고리들 값을 같이 넘겨주기 위해서 ModelAndView를 썼다.
		ModelAndView mv = new ModelAndView();
		mv.setViewName("client/services/board/boardList"); // 보낼 뷰의 경로
		
		// 다음 뷰로 보낼 cate1_code, cate2_code
		mv.addObject("cate1_code", cate1_code); 
		mv.addObject("cate2_code", cate2_code);
		
		
		return mv;
	}
	
	@RequestMapping("/board/boardForm.do")
	public ModelAndView boardForm(@RequestParam String cate1_code, @RequestParam String cate2_code){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("client/services/board/boardForm"); // 뷰의 이름
		System.out.println("/board/boardForm.do가 호출되었습니다. 넘어온 카테고리1값 : " +cate1_code + " 카테고리2값 : "+cate2_code);
		
		// 뷰로 보낼 cate1_code, cate2_code
		mv.addObject("cate1_code", cate1_code); 
		mv.addObject("cate2_code", cate2_code);
		
		return mv;
	}
	
	
	//가급적이면 @RequestParam을 쓰지 않으려고 했는데 경로를 설정해줘야 하는 부분에서 해당 카테고리 리스트를 보여줘야 하기 때문에 부득이하게 받았다.
	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(@RequestParam String cate1_code, @RequestParam String cate2_code, Board board, Model model,HttpSession session){

		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("nicName확인 : " + m.getNickName());
		
		System.out.println("insertBoard 확인 : " + board);
		int result = boardService.insertBoard(board);
		
		System.out.println("insert 결과 : " + result);
		
		//경로 설정
		String loc = "/board/boardList.do?cate1_code="+cate1_code+"&cate2_code="+cate2_code;
		String msg = "";
		
		if( result > 0) {
			msg = "게시글이 등록되었습니다!!";
			
		} else {
			msg = "게시글이 등록되지 않았습니다 관리자에게 문의하세요!!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/services/board/common/msg";	
	}
	
	//게시물 조회
	@RequestMapping("/board/boardView.do")
	public ModelAndView selectOneBoard(@RequestParam int bno, Model model) {
		System.out.println("/board/boardView.do가 호출되었습니다.");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/client/services/board/boardView"); // 뷰의 이름
		
		System.out.println("조회할 글번호 : "+bno);
		model.addAttribute("board", boardService.selectOneBoard(bno));
		
		//comment를 같이 뿌려주기 위해 board에 삽입
		
		BoardComment boardcomment = new BoardComment(bno);
		System.out.println(boardCommentService.selectBoardCommentList(boardcomment));
		ArrayList<BoardComment> clist = new ArrayList<>(boardCommentService.selectBoardCommentList(boardcomment));

		System.out.println("넘어온 list 확인 : " + clist);
		
		//댓글 개수 조회
		int totalCommentContents = boardCommentService.selectBoardCommentTotalContents(boardcomment);
		
		model.addAttribute("clist", clist).addAttribute("totalCommentContents",totalCommentContents);
		
		mv.addObject("bno", bno);
		
		return mv;
	}
	
	//게시물 수정페이지로 가기
	@RequestMapping("/board/boardUpdateView.do")
	public ModelAndView boardUpdateView(@RequestParam int bno, @RequestParam int mNo, HttpSession session, Model model) {
		System.out.println("/board/boardView.do가 호출되었습니다.");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("client/services/board/boardUpdateView"); // 뷰의 이름
		
		System.out.println("수정할 글번호 : "+bno);
		System.out.println("수정하는 멤버번호 : "+mNo);
		model.addAttribute("board", boardService.selectOneBoard(bno));
		
		mv.addObject("bno", bno).addObject("mNo",mNo);
		
		return mv;
		
	}
	
	//게시물 수정
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(@RequestParam int bno, @RequestParam int mNo, Board board, HttpSession session, Model model) {
		
		System.out.println(bno);
		System.out.println(board);
		System.out.println(mNo);
		
		// 원본 게시글 조회하여 특정 부분 수정하기
		Board originBoard = boardService.selectOneBoard(bno);
		
		System.out.println("수정할 값 확인"+board.getBtitle());
		System.out.println("수정할 값 확인"+board.getBcontent());
		
		originBoard.setBtitle(board.getBtitle());
		originBoard.setBcontent(board.getBcontent());
		
		int result = boardService.updateBoard(originBoard);
		
		Member member = boardService.getMemberInfo(mNo);
		System.out.println("mNo의 값은 : "+mNo);
		System.out.println(member.getmNo());
		model.addAttribute("member",member);
		
		String loc = "/board/board.do?mNo="+mNo;
		String msg = "";
		
		if(result > 0) {
			
			msg = "게시글 수정 성공!";
			
		} else {
			
			msg = "게시글 수정 실패!";
			
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "client/services/board/common/msg";
	}
	
	
	
	
	//게시물 삭제
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam int bno, @RequestParam int mNo, HttpSession session, Model model) {
		System.out.println("삭제할 글번호 : "+bno);
		
		int result = boardService.deleteBoard(bno);
		
		Member member = boardService.getMemberInfo(mNo);
		System.out.println(member.getmNo());
		model.addAttribute("member",member);
		
		String loc = "/board/board.do?mNo="+mNo;
		String msg = "";
		
		if(result >0) {
			msg = "게시글 삭제 성공!!";
		}else {
			msg = "게시글 삭제 실패ㅠㅠ";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/services/board/common/msg";
	}
	
	
}
