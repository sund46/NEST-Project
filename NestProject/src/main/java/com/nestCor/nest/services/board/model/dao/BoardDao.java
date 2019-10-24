package com.nestCor.nest.services.board.model.dao;

import java.util.List;
import java.util.Map;

import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.board.model.vo.Board;

public interface BoardDao {
	//게시물 추가
	int insertBoard(Board board);
	
	//게시물 리스트조회
	List<Map<String, String>> selectBoardList(int cPage, int limit, Board board);
	
	//게시글 총개수 - 페이징 처리
	int selectBoardTotalContents(Board board);
		
	//게시물 상세보기
	Board selectOneBoard(int bno);
	
	//게시물 수정
	int updateBoard(Board board);
	
	//게시물 삭제
	int deleteBoard(int bno);

	Member getMemberInfo(int mNo);
}
