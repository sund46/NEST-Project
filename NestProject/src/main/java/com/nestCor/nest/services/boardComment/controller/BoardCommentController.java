package com.nestCor.nest.services.boardComment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nestCor.nest.services.boardComment.model.service.BoardCommentService;
import com.nestCor.nest.services.boardComment.model.vo.BoardComment;

@SessionAttributes(value= {"member"})
@Controller
public class BoardCommentController {

	@Autowired
	BoardCommentService boardCommentService;
	
	@RequestMapping("boardComment/insertBoardComment.do")
	public String insertBoardComment(@RequestParam int bno, @RequestParam int mno, @RequestParam String ccontent, BoardComment boardcomment, Model model) {
		System.out.println("/boardComment/boardComment.do가 호출되었습니다.");
		System.out.println("넘어온 bno의 값은 : "+bno+" mno : "+mno);
		System.out.println("넘어온 ccontent의 값은 : "+ccontent);
		System.out.println("boardComment 확인 : "+boardcomment);
		
		
		int result = boardCommentService.insertBoardComment(boardcomment);
		
		System.out.println("결과확인 : " + result);
		
		String loc = "/board/boardView.do?bno="+bno;
		String msg = "";
		
		if( result > 0) {
			msg = "댓글이 등록되었습니다!!";
			
		} else {
			msg = "댓글이 등록되지 않았습니다 관리자에게 문의하세요!!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/services/board/common/msg";
	}
	
	@RequestMapping("/boardComment/boardCommentDelete.do")
	public String boardCommentDelete(@RequestParam int bno, @RequestParam int cno, HttpSession session, Model model) {
		System.out.println("boardCommentDelete.do로 진입 성공");
		System.out.println("bno : "+bno+" cno : "+cno);
		
		int result = boardCommentService.deleteBoardComment(cno);
		
		String loc = "/board/boardView.do?bno="+bno;
		String msg = "";
		
		if(result >0) {
			msg = "댓글 삭제 성공!!";
		}else {
			msg = "댓글 삭제 실패ㅠㅠ";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/services/board/common/msg";
	}
	
}
