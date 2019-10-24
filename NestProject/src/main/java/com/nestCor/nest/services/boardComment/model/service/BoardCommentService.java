package com.nestCor.nest.services.boardComment.model.service;

import java.util.List;

import com.nestCor.nest.services.boardComment.model.vo.BoardComment;

public interface BoardCommentService {
	/**
	 * 개발자 정보등록 메소드
	 * @param board
	 * @return result
	 */
	//게시물 추가
		int insertBoardComment(BoardComment boardcomment);
		
		//게시글 총개수 
		int selectBoardCommentTotalContents(BoardComment boardcomment);
		
		//게시물 리스트조회
		List<BoardComment> selectBoardCommentList(BoardComment boardcomment);
		
		//게시물 삭제
		int deleteBoardComment(int cno);
		
}
