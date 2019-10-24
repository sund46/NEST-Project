package com.nestCor.nest.services.boardComment.model.dao;

import java.util.List;

import com.nestCor.nest.services.boardComment.model.vo.BoardComment;

public interface BoardCommentDao {
	//게시물 추가
		int insertBoardComment(BoardComment boardcomment);
		
		//게시글 총개수 - 페이징 처리 - 반드시 cate2를 넘겨줘야한다 그래야 매개변수로 오는 cate2를 조회한다.
		int selectBoardCommentTotalContents(BoardComment boardcomment);
		
		//게시물 리스트조회
		List<BoardComment> selectBoardCommentList(BoardComment boardcomment);
		
		//게시물 삭제
		int deleteBoardComment(int cno);
		
}
